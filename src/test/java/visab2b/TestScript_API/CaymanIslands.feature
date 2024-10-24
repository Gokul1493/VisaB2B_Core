Feature: Cayman Islands Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "CaymanIslandsAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Cayman Islands Positive flow
* req.params.Payload.CreditorAgent.Bic = "CIMGKYKYXXX"
* req.params.Payload.InstructedAmount.Currency = "KYD"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* jUtil.SetData("GetAuditsCaymanIslandsAPIpostive",ref)
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

 
###Initiate transaction with different currency
Scenario: Albania Positive flow with Other currency(COP)
* req.params.Payload.InstructedAmount.Currency ="COP"
* req.params.Payload.CreditorAccount.AccountNumber="566542222"
* jUtil.SetData("GetAuditsCaymanIslandsAPIothercurrency",ref)
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
 
Scenario: Cayman Islands Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "KYD"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = "234567"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}
 
Scenario: Cayman Islands Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "KYD"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}
 
Scenario: Cayman Islands AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "CIMGKYKYXXX"
* req.params.Payload.InstructedAmount.Currency = "KYD"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}
 
Scenario: Cayman Islands purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "CIMGKYKYXXX"
* req.params.Payload.InstructedAmount.Currency = "KYD"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}