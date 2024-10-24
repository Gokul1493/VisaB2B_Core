Feature: Australia Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "Australia"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "AS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: Australia Positive flow
* req.params.Payload.CreditorAgent.Bic = "NATAAU3303M"
* req.params.Payload.InstructedAmount.Currency = "AUD"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = "AU234567"
* jUtil.SetData("GetAuditsAustraliaAPIpostive",ref)
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

 
# Initiate transaction with different currency
Scenario: Australia Positive flow with Other currency(ARS)
* req.params.Payload.InstructedAmount.Currency ="ARS"
* req.params.Payload.CreditorAccount.AccountNumber="566542222"
* req.params.Payload.CreditorAccount.Iban=""
* req.params.Payload.PaymentPurpose=""
* jUtil.SetData("GetAuditsAustraliaAPIothercurrency",ref)
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

 
Scenario: Australia Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "AUD"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = "234567"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

 
Scenario: Australia Bic as Empty and clearing member id as invalid
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "AUD"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = "123456"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must start with 2 Alpha."}

 
Scenario: Australia AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "NATAAU3303M"
* req.params.Payload.InstructedAmount.Currency = "AUD"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.CreditorAgent.ClearingMemberId = "AU234567"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

 
Scenario: Australia Clearing Member ID as Empty and BIC also
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "AUD"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

 
Scenario: Australia Clearing Member ID Less than 6 digit
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "AUD"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = "AU234"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must be starts with AU and followed by 6 numeric digit"}

 
Scenario: Australia Clearing Member ID Greater than 6 digit
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "AUD"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = "AU2345673"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must be starts with AU and followed by 6 numeric digit"}
 
Scenario: Australia Clearing Member ID MUST be start with 2 Alphabets #Bug
* req.params.Payload.CreditorAgent.Bic = "NATAAU3303M"
* req.params.Payload.InstructedAmount.Currency = "AUD"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = "234567"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must start with 2 Alpha."}


 
#newly added flow mar11/2024- Without BIC but with proper clearning member id 
Scenario: Without BIC but with proper clearning member id 
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "AUD"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = "AU123456"
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
* req.params.Payload.InstructedAmount.Currency = "AUD"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error.message == "Creditor agent BIC/ClearingMemberID is missing."












