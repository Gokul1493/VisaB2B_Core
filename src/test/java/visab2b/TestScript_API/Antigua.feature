Feature: Antigua Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "AntiguaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Antigua Positive flow
* req.params.Payload.CreditorAgent.Bic = "ANCBAGAGXXX"
* req.params.Payload.InstructedAmount.Currency = "XCD"
* req.params.Payload.CreditorAccount.AccountNumber = "6004400006729503010102"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsAntiguaAPIpostive",ref)
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

#Initiate transaction with different currency
Scenario: Antigua Positive flow with different currency
* req.params.Payload.CreditorAgent.Bic = "ANCBAGAGXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "6004400006729503010102"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsAntiguaAPIothercurrency",ref)
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

   
Scenario: Antigua Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "XCD"
* req.params.Payload.CreditorAccount.AccountNumber = "6004400006729503010102"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}


   
Scenario: Antigua Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "XCD"
* req.params.Payload.CreditorAccount.AccountNumber = "6004400006729503010102"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}


   
Scenario: Antigua AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "ANCBAGAGXXX"
* req.params.Payload.InstructedAmount.Currency = "XCD"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}


   
Scenario: Antigua purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "ANCBAGAGXXX"
* req.params.Payload.InstructedAmount.Currency = "XCD"
* req.params.Payload.CreditorAccount.AccountNumber = "6004400006729503010102"

* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}