Feature: Zambia Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "ZambiaAPI" + jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: Zambia Positive flow 
* req.params.Payload.CreditorAgent.Bic = "BAZAZMLUASA"
* req.params.Payload.InstructedAmount.Currency = "ZMW"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
 * jUtil.SetData("GetAuditsZambiaAPIpostive",ref)
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
* print response

Scenario: Zambia Positive flow 
* req.params.Payload.CreditorAgent.Bic = "BAZAZMLUASA"
* req.params.Payload.InstructedAmount.Currency = "ZMW"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
 * jUtil.SetData("GetAuditsZambiaAPIpostive",ref)
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
* print response

Scenario: Zambia Positive flow with USD Currency
* req.params.Payload.CreditorAgent.Bic = "BAZAZMLUASA"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsZambiaAPIothercurrency",ref)
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
* print response




Scenario: Zambia Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "ZMW"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Zambia Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "ZMW"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAgentBic' cannot be null."}

Scenario: Zambia AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "BAZAZMLUASA"
* req.params.Payload.InstructedAmount.Currency = "ZMW"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

Scenario: Zambia purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "BAZAZMLUASA"
* req.params.Payload.InstructedAmount.Currency = "ZMW"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

Scenario: Uruguay BranchName as Empty
* req.params.Payload.CreditorAgent.Bic = "BAZAZMLUASA"
* req.params.Payload.InstructedAmount.Currency = "ZMW"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAgentBranchName' cannot be null."}




