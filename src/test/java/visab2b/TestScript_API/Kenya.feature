Feature: Kenya Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "KenyaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Kenya Positive flow 
* req.params.Payload.CreditorAgent.Bic = "CONKKENAXXX"
* req.params.Payload.InstructedAmount.Currency = "KES"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsKenyaAPIpostive",ref)
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

Scenario: Kenya Positive flow with USD currency
* req.params.Payload.CreditorAgent.Bic = "CONKKENAXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsKenyaAPIothercurrency",ref)
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

Scenario: Kenya Positive flow Without enterprise ID
* req.params.Payload.CreditorAgent.Bic = "CONKKENAXXX"
* req.params.Payload.InstructedAmount.Currency = "KES"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* jUtil.SetData("GetAuditsKenyaAPIpostivewithoutEID",ref)
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



Scenario: Kenya Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "KES"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Kenya Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "KES"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Kenya AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "CONKKENAXXX"
* req.params.Payload.InstructedAmount.Currency = "KES"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

Scenario: Kenya purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "CONKKENAXXX"
* req.params.Payload.InstructedAmount.Currency = "KES"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

Scenario: Kenya BranchName as Empty
* req.params.Payload.CreditorAgent.Bic = "CONKKENAXXX"
* req.params.Payload.InstructedAmount.Currency = "KES"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = ""
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAgentBranchName' cannot be null."}

Scenario: Kenya Bic less than 8 digits
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "KES"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Kenya Bic more than 11 digits
* req.params.Payload.CreditorAgent.Bic = "CONKKENAXXXXXX"
* req.params.Payload.InstructedAmount.Currency = "KES"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}


