Feature: Jordan Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "JordanAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: Jordan Positive flow
* req.params.Payload.CreditorAgent.Bic = "BJORJOAXXXX"
* req.params.Payload.InstructedAmount.Currency = "JOD"
* req.params.Payload.CreditorAccount.Iban = "JO71CBJO0000000000001234567890"
* req.params.Payload.PaymentPurposeCode = "8111"
* jUtil.SetData("GetAuditsJordanAPIpostive",ref)
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

Scenario: Jordan Positive flow  without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "BJORJOAXXXX"
* req.params.Payload.InstructedAmount.Currency = "JOD"
* req.params.Payload.CreditorAccount.Iban = "JO71CBJO0000000000001234567890"
* req.params.Payload.PaymentPurposeCode = "8111"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* jUtil.SetData("GetAuditsJordanAPIpostivewithoutEID",ref)
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


Scenario: Jordan Positive flow with other currency
* req.params.Payload.CreditorAgent.Bic = "BJORJOAXXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "JO71CBJO0000000000001234567890"
* req.params.Payload.PaymentPurposeCode = "8111"
* jUtil.SetData("GetAuditsJordanAPIothercurrencies",ref)
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



 
Scenario: Jordan Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "JOD"
* req.params.Payload.CreditorAccount.Iban = "JO71CBJO0000000000001234567890"
* req.params.Payload.PaymentPurposeCode = "0811"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}


 
Scenario: Jordan Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "JOD"
* req.params.Payload.CreditorAccount.Iban = "JO71CBJO0000000000001234567890"
* req.params.Payload.PaymentPurposeCode = "0811"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

 
Scenario: Jordan Bic as less than 8 char
* req.params.Payload.CreditorAgent.Bic = "BJOR"
* req.params.Payload.InstructedAmount.Currency = "JOD"
* req.params.Payload.CreditorAccount.Iban = "JO71CBJO0000000000001234567890"
* req.params.Payload.PaymentPurposeCode = "0811"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}
 
Scenario: Jordan Bic as more than 11 char
* req.params.Payload.CreditorAgent.Bic = "BJORJOAXXXXAAAAAA"
* req.params.Payload.InstructedAmount.Currency = "JOD"
* req.params.Payload.CreditorAccount.Iban = "JO71CBJO0000000000001234567890"
* req.params.Payload.PaymentPurposeCode = "0811"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}
 
Scenario: Jordan iban as Empty
* req.params.Payload.CreditorAgent.Bic = "BJORJOAXXXX"
* req.params.Payload.InstructedAmount.Currency = "JOD"
* req.params.Payload.CreditorAccount.Iban = ""
* req.params.Payload.PaymentPurposeCode = "0811"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}


 
Scenario: Jordan PaymentPurposeCode as Empty
* req.params.Payload.CreditorAgent.Bic = "BJORJOAXXXX"
* req.params.Payload.InstructedAmount.Currency = "JOD"
* req.params.Payload.CreditorAccount.Iban = "JO71CBJO0000000000001234567890"
* req.params.Payload.PaymentPurposeCode = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurposeCode' cannot be null."}


 
Scenario: Jordan PaymentPurposeCode Less than 4 character(3-character (uppercase) Remittance Code)
* req.params.Payload.CreditorAgent.Bic = "BJORJOAXXXX"
* req.params.Payload.InstructedAmount.Currency = "JOD"
* req.params.Payload.CreditorAccount.Iban = "JO71CBJO0000000000001234567890"
* req.params.Payload.PaymentPurposeCode = "081"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Payment Purpose Code must be 4-numeric."}


 
Scenario: Jordan PaymentPurposeCode Greater than 4 character(3-character (uppercase) Remittance Code)
* req.params.Payload.CreditorAgent.Bic = "BJORJOAXXXX"
* req.params.Payload.InstructedAmount.Currency = "JOD"
* req.params.Payload.CreditorAccount.Iban = "JO71CBJO0000000000001234567890"
* req.params.Payload.PaymentPurposeCode = "08111"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Payment Purpose Code must be 4-numeric."}

