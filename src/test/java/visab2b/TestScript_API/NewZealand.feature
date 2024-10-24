Feature: New Zealand Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "NewZealandAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential
  
Scenario: New Zealand Positive flow
* req.params.Payload.CreditorAgent.Bic = "BKNZNZ22"
* req.params.Payload.InstructedAmount.Currency = "NZD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* def getReferenceNumber = jutil.GetData('GetAuditsNewZealandAPIpostive')
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.result contains {transactionId:"#string"}
* def all_eid = response.result.transactionId
* print all_eid

* def sleep = function(millis){ java.lang.Thread.sleep(millis) }
* eval sleep(10000)

# Approve Transaction
* def user = testData.Visa_API_CK
* approve.params.Api.Credential = user.Credential
* path 'api'
* approve.params.Payload.transactionIds[0] = all_eid
* def value = signsreq(approve,user)
* request value
* method post
* status 200
* match response.result contains {message:"1 of 1 Transactions approved successfully"}
  
  Scenario: New Zealand Positive flow with cross currency
* req.params.Payload.CreditorAgent.Bic = "BKNZNZ22"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* def getReferenceNumber = jutil.GetData('GetAuditsNewZealandAPIothercurrency')
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.result contains {transactionId:"#string"}
* def all_eid = response.result.transactionId
* print all_eid

* def sleep = function(millis){ java.lang.Thread.sleep(millis) }
* eval sleep(10000)

# Approve Transaction
* def user = testData.Visa_API_CK
* approve.params.Api.Credential = user.Credential
* path 'api'
* approve.params.Payload.transactionIds[0] = all_eid
* def value = signsreq(approve,user)
* request value
* method post
* status 200
* match response.result contains {message:"1 of 1 Transactions approved successfully"}
  
  Scenario: New Zealand Positive flow  without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "BKNZNZ22"
* req.params.Payload.InstructedAmount.Currency = "NZD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* def getReferenceNumber = jutil.GetData('GetAuditsNewZealandAPIpostive')
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.result contains {transactionId:"#string"}
* def all_eid = response.result.transactionId
* print all_eid

* def sleep = function(millis){ java.lang.Thread.sleep(millis) }
* eval sleep(10000)

# Approve Transaction
* def user = testData.Visa_API_CK
* approve.params.Api.Credential = user.Credential
* path 'api'
* approve.params.Payload.transactionIds[0] = all_eid
* def value = signsreq(approve,user)
* request value
* method post
* status 200
* match response.result contains {message:"1 of 1 Transactions approved successfully"}
  
Scenario: New Zealand Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "NZD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
 
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}
  
Scenario: New Zealand Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "NZD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: New Zealand Bic as less than 8 char
* req.params.Payload.CreditorAgent.Bic = "BKNZ"
* req.params.Payload.InstructedAmount.Currency = "NZD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: New Zealand Bic as more than 11 char
* req.params.Payload.CreditorAgent.Bic = "BKNZNZ22XXXXXXXXX"
* req.params.Payload.InstructedAmount.Currency = "NZD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}
  
Scenario: New Zealand AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "BKNZNZ22"
* req.params.Payload.InstructedAmount.Currency = "NZD"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

  
Scenario: New Zealand Clearing Member ID as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "NZD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error.message == "Parameter 'CreditorAgentBic' cannot be null."
  
Scenario: New Zealand Clearing Member ID Less than 6 digit
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "NZD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* req.params.Payload.CreditorAgent.ClearingMemberId = "NZ12345"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must be 6 numeric digit."}
  
Scenario: New Zealand Clearing Member ID Greater than 6 digit
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "NZD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* req.params.Payload.CreditorAgent.ClearingMemberId = "NZ1234567"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must be 6 numeric digit."}

  
#newly added flow mar11/2024- Without BIC but with proper clearning member id 
Scenario: Without BIC but with proper clearning member id
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "NZD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* req.params.Payload.CreditorAgent.ClearingMemberId = "NZ123456"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.result contains {transactionId:"#string"}
* def all_eid = response.result.transactionId
* print all_eid

* def sleep = function(millis){ java.lang.Thread.sleep(millis) }
* eval sleep(10000)

# Approve Transaction
* def user = testData.Visa_API_CK
* approve.params.Api.Credential = user.Credential
* path 'api'
* approve.params.Payload.transactionIds[0] = all_eid
* def value = signsreq(approve,user)
* request value
* method post
* status 200
* match response.result contains {message:"1 of 1 Transactions approved successfully"}



Scenario: Without BIC and Clearning member id
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "NZD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error.message == "Parameter 'CreditorAgentBic' cannot be null."

# BIC as Valid Clearing and empty Clearing member ID
Scenario: Without BIC and Clearning member id 1
* req.params.Payload.CreditorAgent.Bic = "BKNZNZ22"
* req.params.Payload.InstructedAmount.Currency = "NZD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error.message == "Creditor agent BIC/ClearingMemberID is missing."


