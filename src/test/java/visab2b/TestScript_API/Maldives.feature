Feature: MaldivesAPI Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "MaldivesAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Maldives Positive flow
* req.params.Payload.CreditorAgent.Bic = "BCEYMVMV"
* req.params.Payload.InstructedAmount.Currency = "MVR"
* req.params.Payload.CreditorAccount.AccountNumber = "6004400006729503010102"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* def getReferenceNumber = jutil.GetData('GetAuditsMaldivesAPIpostive')
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

Scenario: Maldives Positive flow with USD currency
* req.params.Payload.CreditorAgent.Bic = "BCEYMVMV"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "6004400006729503010102"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* def getReferenceNumber = jutil.GetData('GetAuditsMaldivesAPIothercurrency')
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


   
Scenario: Maldives Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "MVR"
* req.params.Payload.CreditorAccount.AccountNumber = "6004400006729503010102"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}


   
Scenario: Maldives Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "MVR"
* req.params.Payload.CreditorAccount.AccountNumber = "6004400006729503010102"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}


   
Scenario: Maldives AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "BCEYMVMV"
* req.params.Payload.InstructedAmount.Currency = "MVR"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.CreditorAccount.Iban = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor account number/IBAN is missing."}


   
Scenario: Maldives purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "BCEYMVMV"
* req.params.Payload.InstructedAmount.Currency = "MVR"
* req.params.Payload.CreditorAccount.AccountNumber = "6004400006729503010102"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.PaymentPurpose = " "
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

Scenario: Maldives branch name as Empty
* req.params.Payload.CreditorAgent.Bic = "BCEYMVMV"
* req.params.Payload.InstructedAmount.Currency = "MVR"
* req.params.Payload.CreditorAccount.AccountNumber = "6004400006729503010102"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.BranchName = " "
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAgentBranchName' cannot be null."}