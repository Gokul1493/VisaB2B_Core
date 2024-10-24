Feature: Thailand Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "ThailandAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Thailand Positive flow
* req.params.Payload.CreditorAgent.Bic = "BKKBTHBKXXX"
* req.params.Payload.InstructedAmount.Currency = "THB"
* req.params.Payload.CreditorAccount.AccountNumber = "232243546575638"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsThailandAPIpostive')
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

Scenario: Thailand Positive flow with cross border currency
* req.params.Payload.CreditorAgent.Bic = "BKKBTHBKXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "232243546575638"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsThailandAPIothercurrency')
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

Scenario: Thailand Positive flow without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "BKKBTHBKXXX"
* req.params.Payload.InstructedAmount.Currency = "THB"
* req.params.Payload.CreditorAccount.AccountNumber = "232243546575638"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* def getReferenceNumber = jutil.GetData('GetAuditsThailandAPIpostive')
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

Scenario: Thailand Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "THB"
* req.params.Payload.CreditorAccount.AccountNumber = "232243546575638"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Thailand Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "THB"
* req.params.Payload.CreditorAccount.AccountNumber = "232243546575638"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Thailand Bic as less than 8 Character
* req.params.Payload.CreditorAgent.Bic = "BKKBT"
* req.params.Payload.InstructedAmount.Currency = "THB"
* req.params.Payload.CreditorAccount.AccountNumber = "232243546575638"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Thailand Bic as more than 12 character
* req.params.Payload.CreditorAgent.Bic = "BKKBTHBKXXXXXX"
* req.params.Payload.InstructedAmount.Currency = "THB"
* req.params.Payload.CreditorAccount.AccountNumber = "232243546575638"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Thailand AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "BKKBTHBKXXX"
* req.params.Payload.InstructedAmount.Currency = "THB"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

Scenario: Thailand purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "BKKBTHBKXXX"
* req.params.Payload.InstructedAmount.Currency = "THB"
* req.params.Payload.CreditorAccount.AccountNumber = "232243546575638"

* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}