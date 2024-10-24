Feature: Panama Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "PanamaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Panama Positive flow
* req.params.Payload.CreditorAgent.Bic = "BAGEPAPAXXX"
* req.params.Payload.InstructedAmount.Currency = "PAB"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsPanamaAPIpostive')
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

Scenario: Panama Positive flow with cross border currency
* req.params.Payload.CreditorAgent.Bic = "BAGEPAPAXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsPanamaAPIothercurrency')
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

Scenario: Panama Positive flow without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "BAGEPAPAXXX"
* req.params.Payload.InstructedAmount.Currency = "PAB"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* def getReferenceNumber = jutil.GetData('GetAuditsPanamaAPIpostive')
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

Scenario: Panama Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "PAB"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Panama Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "PAB"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Panama Bic as less than 8 char
* req.params.Payload.CreditorAgent.Bic = "BAGE"
* req.params.Payload.InstructedAmount.Currency = "PAB"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Panama Bic as more than 11 char
* req.params.Payload.CreditorAgent.Bic = "BAGEPAPAXXXZZZZZZ"
* req.params.Payload.InstructedAmount.Currency = "PAB"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Panama AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "BAGEPAPAXXX"
* req.params.Payload.InstructedAmount.Currency = "PAB"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

Scenario: Panama purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "BAGEPAPAXXX"
* req.params.Payload.InstructedAmount.Currency = "PAB"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"

* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}