Feature: Nicaragua Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "NicaraguaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Nicaragua Positive flow
* req.params.Payload.CreditorAgent.Bic = "BAPRNIMAXXX"
* req.params.Payload.InstructedAmount.Currency = "NIO"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsNicaraguaAPIpostive')
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

Scenario: Nicaragua Positive flow with other currency
* req.params.Payload.CreditorAgent.Bic = "BAPRNIMAXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsNicaraguaAPIothercurrency')
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


Scenario: Nicaragua Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "NIO"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Nicaragua Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "NIO"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Nicaragua AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "BAPRNIMAXXX"
* req.params.Payload.InstructedAmount.Currency = "NIO"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

Scenario: Nicaragua purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "BAPRNIMAXXX"
* req.params.Payload.InstructedAmount.Currency = "NIO"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"

* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

Scenario: Nicaragua Positive flow
* req.params.Payload.CreditorAgent.Bic = "BAPRNIMAXXX"
* req.params.Payload.InstructedAmount.Currency = "NIO"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
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

Scenario: Nicaragua Bic less than 8 digits
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "NIO"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Nicaragua Bic more than 11 digits
* req.params.Payload.CreditorAgent.Bic = "BAPRNIMAXXXXXX"
* req.params.Payload.InstructedAmount.Currency = "NIO"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}
