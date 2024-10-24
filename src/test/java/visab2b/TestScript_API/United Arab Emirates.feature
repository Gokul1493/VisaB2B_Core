Feature: United Arab Emirates Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "UnitedArabAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: United Arab Emirates Positive flow with AED currency
* req.params.Payload.CreditorAgent.Bic = "CBAUAEAAXXX"
* req.params.Payload.InstructedAmount.Currency = "AED"
* req.params.Payload.CreditorAccount.IBan = "AE070331234567890123456"
* req.params.Payload.PaymentPurposeCode = "CBP"
* def getReferenceNumber = jutil.GetData('GetAuditsUnitedArabAPIpostive')
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
* match response contains {}


Scenario: United Arab Emirates Positive flow without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "CBAUAEAAXXX"
* req.params.Payload.InstructedAmount.Currency = "AED"
* req.params.Payload.CreditorAccount.IBan = "AE070331234567890123456"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* req.params.Payload.PaymentPurposeCode = "CBP"
* def getReferenceNumber = jutil.GetData('GetAuditsUnitedArabAPIpostive')
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
* match response contains {}

 
Scenario: United Arab Emirates Positive flow with other currency(USD)
* req.params.Payload.CreditorAgent.Bic = "CBAUAEAAXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "AE070331234567890123456"
* req.params.Payload.PaymentPurposeCode = "CBP"
* def getReferenceNumber = jutil.GetData('GetAuditsUnitedArabAPIothercurrency')
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
* match response contains {}

 
Scenario: United Arab Emirates Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "AED"
* req.params.Payload.CreditorAccount.Iban = "AE070331234567890123456"
* req.params.Payload.PaymentPurposeCode = "CBP"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

 
Scenario: United Arab Emirates Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "AED"
* req.params.Payload.CreditorAccount.Iban = "AE070331234567890123456"
* req.params.Payload.PaymentPurposeCode = "CBP"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}



Scenario: United Arab Emirates Bic as more than 12
* req.params.Payload.CreditorAgent.Bic = "CBAUAEAAXXXXXXXXXX"
* req.params.Payload.InstructedAmount.Currency = "AED"
* req.params.Payload.CreditorAccount.Iban = "AE070331234567890123456"
* req.params.Payload.PaymentPurposeCode = "CBP"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}


Scenario: United Arab Emirates Bic as less than 8
* req.params.Payload.CreditorAgent.Bic = "CBAU"
* req.params.Payload.InstructedAmount.Currency = "AED"
* req.params.Payload.CreditorAccount.Iban = "AE070331234567890123456"
* req.params.Payload.PaymentPurposeCode = "CBP"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

 
Scenario: United Arab Emirates iban as Empty
* req.params.Payload.CreditorAgent.Bic = "CBAUAEAAXXX"
* req.params.Payload.InstructedAmount.Currency = "AED"
* req.params.Payload.CreditorAccount.Iban = ""
* req.params.Payload.PaymentPurposeCode = "CBP"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

 
Scenario: United Arab Emirates PaymentPurposeCode as Empty
* req.params.Payload.CreditorAgent.Bic = "CBAUAEAAXXX"
* req.params.Payload.InstructedAmount.Currency = "AED"
* req.params.Payload.CreditorAccount.Iban = "AE070331234567890123456"
* req.params.Payload.PaymentPurposeCode = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurposeCode' cannot be null."}

 
Scenario: United Arab Emirates PaymentPurposeCode Less than 3 character(3-character (uppercase) Remittance Code)
* req.params.Payload.CreditorAgent.Bic = "CBAUAEAAXXX"
* req.params.Payload.InstructedAmount.Currency = "AED"
* req.params.Payload.CreditorAccount.Iban = "AE070331234567890123456"
* req.params.Payload.PaymentPurposeCode = "CB"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Payment Purpose Code must be 3 Characters."}


 
Scenario: United Arab Emirates PaymentPurposeCode Greater than 3 character(3-character (uppercase) Remittance Code)
* req.params.Payload.CreditorAgent.Bic = "CBAUAEAAXXX"
* req.params.Payload.InstructedAmount.Currency = "AED"
* req.params.Payload.CreditorAccount.Iban = "AE070331234567890123456"
* req.params.Payload.PaymentPurposeCode = "CBP1"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Payment Purpose Code must be 3 Characters."}

