Feature: Uganda Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "UgandaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: Uganda Positive flow
* req.params.Payload.CreditorAgent.Bic = "UGBAUGKAXXX"
* req.params.Payload.InstructedAmount.Currency = "UGX"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsUgandaAPIpostive')
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

Scenario: Uganda Positive flow with cross border currency
* req.params.Payload.CreditorAgent.Bic = "UGBAUGKAXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsUgandaAPIothercurrency')
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

Scenario: Uganda Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "UGX"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Uganda Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "UGX"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Uganda AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "UGBAUGKAXXX"
* req.params.Payload.InstructedAmount.Currency = "UGX"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

Scenario: Uganda purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "UGBAUGKAXXX"
* req.params.Payload.InstructedAmount.Currency = "UGX"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"

* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

Scenario: Uganda Bic more than 11 digits
* req.params.Payload.CreditorAgent.Bic = "UGBAUGKAXXXX"
* req.params.Payload.InstructedAmount.Currency = "UGX"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Uganda Bic less than 8 digits
* req.params.Payload.CreditorAgent.Bic = "UGBAU"
* req.params.Payload.InstructedAmount.Currency = "UGX"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

