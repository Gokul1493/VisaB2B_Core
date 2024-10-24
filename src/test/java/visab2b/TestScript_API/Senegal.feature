Feature: Senegal Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "SenegalAPI"+jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: Senegal Positive flow
* req.params.Payload.CreditorAgent.Bic = "AFRISNDAXXX"
* req.params.Payload.InstructedAmount.Currency = "XOF"
* req.params.Payload.CreditorAccount.AccountNumber = "685390075470346663456789"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsSenegalAPIpostive')
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

Scenario: Senegal Positive flow with cross border curEmptyrency
* req.params.Payload.CreditorAgent.Bic = "AFRISNDAXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "685390075470346663456789"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsSenegalAPIothercurrency')
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

Scenario: Senegal Positive flow without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "AFRISNDAXXX"
* req.params.Payload.InstructedAmount.Currency = "XOF"
* req.params.Payload.CreditorAccount.AccountNumber = "685390075470346663456789"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* def getReferenceNumber = jutil.GetData('GetAuditsSenegalAPIpostive')
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

Scenario: Senegal Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "XOF"
* req.params.Payload.CreditorAccount.AccountNumber = "685390075470346663456789"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Senegal Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "XOF"
* req.params.Payload.CreditorAccount.AccountNumber = "685390075470346663456789"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAgentBic' cannot be null."}


Scenario: Senegal Bic as less than 8 char
* req.params.Payload.CreditorAgent.Bic = "AFRIS"
* req.params.Payload.InstructedAmount.Currency = "XOF"
* req.params.Payload.CreditorAccount.AccountNumber = "685390075470346663456789"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAgentBic' cannot be null."}

Scenario: Senegal Bic as more than 11 char
* req.params.Payload.CreditorAgent.Bic = "AFRISNDAXXXXXXXXXXXX"
* req.params.Payload.InstructedAmount.Currency = "XOF"
* req.params.Payload.CreditorAccount.AccountNumber = "685390075470346663456789"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAgentBic' cannot be null."}

Scenario: Senegal AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "AFRISNDAXXX"
* req.params.Payload.InstructedAmount.Currency = "XOF"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

Scenario: Senegal purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "AFRISNDAXXX"
* req.params.Payload.InstructedAmount.Currency = "XOF"
* req.params.Payload.CreditorAccount.AccountNumber = "685390075470346663456789"

* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

Scenario: Senegal AccountNumber Less than 24 characters
* req.params.Payload.CreditorAgent.Bic = "AFRISNDAXXX"
* req.params.Payload.InstructedAmount.Currency = "XOF"
* req.params.Payload.CreditorAccount.AccountNumber = "6853900754703466634567"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor AccountNumber must be 24-Characters."}

Scenario: Senegal AccountNumber Greater than 24 characters
* req.params.Payload.CreditorAgent.Bic = "AFRISNDAXXX"
* req.params.Payload.InstructedAmount.Currency = "XOF"
* req.params.Payload.CreditorAccount.AccountNumber = "68539007547034666345678909"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor AccountNumber must be 24-Characters."}