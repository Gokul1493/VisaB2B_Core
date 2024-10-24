Feature: Tanzania Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "TanzaniaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Tanzania Positive flow 
* req.params.Payload.CreditorAgent.Bic = "TANZTZTXXXX"
* req.params.Payload.InstructedAmount.Currency = "TZS"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"

* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsTanzaniaAPIpostive')
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

Scenario: Tanzania Positive flow with USD currency
* req.params.Payload.CreditorAgent.Bic = "TANZTZTXXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"

* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsTanzaniaAPIothercurrency')
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


Scenario: Tanzania Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "TZS"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"

* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Tanzania Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "TZS"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Tanzania AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "TANZTZTXXXX"
* req.params.Payload.InstructedAmount.Currency = "TZS"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"

* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

Scenario: Tanzania purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "TANZTZTXXXX"
* req.params.Payload.InstructedAmount.Currency = "TZS"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"

* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

Scenario: Tanzania BranchName as Empty
* req.params.Payload.CreditorAgent.Bic = "TANZTZTXXXX"
* req.params.Payload.InstructedAmount.Currency = "TZS"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = ""

* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAgentBranchName' cannot be null."}

Scenario: Tanzania Positive flow 
* req.params.Payload.CreditorAgent.Bic = "TANZTZTXXXX"
* req.params.Payload.InstructedAmount.Currency = "TZS"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.DebtorAccount.EnterpriseId = ""

* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsTanzaniaAPIpostive')
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

Scenario: Tanzania Bic less than 8 digits
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "TZS"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"

* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Tanzania Bic more than 11 digits
* req.params.Payload.CreditorAgent.Bic = "TANZTZTXXXXXXX"
* req.params.Payload.InstructedAmount.Currency = "TZS"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"

* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}



