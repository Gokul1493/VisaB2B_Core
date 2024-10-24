Feature: Norway Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "NorwayAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: Norway Positive flow
* req.params.Payload.CreditorAgent.Bic = "CHASNO33XXX"
* req.params.Payload.InstructedAmount.Currency = "NOK"
* req.params.Payload.CreditorAccount.Iban = "NO9386011117947"
* def getReferenceNumber = jutil.GetData('GetAuditsNorwayAPIpostive')
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

Scenario: Norway Positive flow With usd currency
* req.params.Payload.CreditorAgent.Bic = "CHASNO33XXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "NO9386011117947"
* def getReferenceNumber = jutil.GetData('GetAuditsNorwayAPIothercurrency')
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

Scenario: Norway Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "NOK"
* req.params.Payload.CreditorAccount.Iban = "NO9386011117947"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Norway Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "NOK"
* req.params.Payload.CreditorAccount.Iban = "NO9386011117947"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Norway Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "CHASNO33XXX"
* req.params.Payload.InstructedAmount.Currency = "NOK"
* req.params.Payload.CreditorAccount.Iban = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

Scenario: Norway Positive flow Without enterprise id
* req.params.Payload.CreditorAgent.Bic = "CHASNO33XXX"
* req.params.Payload.InstructedAmount.Currency = "NOK"
* req.params.Payload.CreditorAccount.Iban = "NO9386011117947"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
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

Scenario: Norway Bic less than 8 digits
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "NOK"
* req.params.Payload.CreditorAccount.Iban = "NO9386011117947"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Norway Bic more than 11 digits
* req.params.Payload.CreditorAgent.Bic = "CHASNO33XXXXXX"
* req.params.Payload.InstructedAmount.Currency = "NOK"
* req.params.Payload.CreditorAccount.Iban = "NO9386011117947"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

