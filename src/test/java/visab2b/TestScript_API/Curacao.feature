Feature: Curacao Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "CuracaoAPI"+jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Curacao Positive flow
* req.params.Payload.CreditorAgent.Bic = "TOTLCWCUXXX"
* req.params.Payload.InstructedAmount.Currency = "ANG"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsCuracaoAPIpostive",ref)
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

 
Scenario: Curacao Positive flow with other currency code (ALL)
* req.params.Payload.CreditorAgent.Bic = "CBCSCWCUXXX"
* req.params.Payload.InstructedAmount.Currency = "ALL"
* req.params.Payload.CreditorAccount.AccountNumber = "232243546575638476860"
* req.params.Payload.PaymentPurpose = ""
* jUtil.SetData("GetAuditsCuracaoAPIothercurrency",ref)
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
 
Scenario: Curacao Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "ANG"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}
 
Scenario: Curacao Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "ANG"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}
 
Scenario: Curacao AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "CBCSCWCUXXX"
* req.params.Payload.InstructedAmount.Currency = "ANG"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}
 
Scenario: Curacao purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "CBCSCWCUXXX"
* req.params.Payload.InstructedAmount.Currency = "ANG"
* req.params.Payload.CreditorAccount.AccountNumber = "2322435465756384768678698797896709806890"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}