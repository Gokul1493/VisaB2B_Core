Feature: BahrainAny Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "BahrainAnyAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: BahrainAny Positive flow
* req.params.Payload.CreditorAgent.Bic = "ABCIBHBMXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.iban = "BH67BMAG00001299123456" 
* req.params.Payload.PaymentPurposeCode = "CBP"
* jUtil.SetData("GetAuditsBahrainAnyAPIpostive",ref)
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

Scenario: BahrainAny Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "BH67BMAG00001299123456"
* req.params.Payload.PaymentPurposeCode = "CBP"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: BahrainAny Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "BH67BMAG00001299123456"
* req.params.Payload.PaymentPurposeCode = "CBP"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Invalid Clearing Member ID"}

Scenario: BahrainAny iban as Empty
* req.params.Payload.CreditorAgent.Bic = "ABCIBHBMXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = ""
* req.params.Payload.PaymentPurposeCode = "CBP"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

Scenario: BahrainAny PaymentPurposeCode as Empty
* req.params.Payload.CreditorAgent.Bic = "ABCIBHBMXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "BH67BMAG00001299123456"
* req.params.Payload.PaymentPurposeCode = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurposeCode' cannot be null."}

Scenario: BahrainAny PaymentPurposeCode Less than 3 character(3-character (uppercase) Remittance Code)
* req.params.Payload.CreditorAgent.Bic = "ABCIBHBMXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "BH67BMAG00001299123456"
* req.params.Payload.PaymentPurposeCode = "CB"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Payment Purpose Code Number must be 3-UpperCase Characters."}

Scenario: BahrainAny PaymentPurposeCode Greater than 3 character(3-character (uppercase) Remittance Code)
* req.params.Payload.CreditorAgent.Bic = "ABCIBHBMXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "BH67BMAG00001299123456"
* req.params.Payload.PaymentPurposeCode = "CBPT"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Payment Purpose Code Number must be 3-UpperCase Characters."}

