Feature: Albania Transaction

Background:  
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "AlbaniaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Api.Credential = testData.Visa_API_MK.Credential
 
Scenario: Albania Positive flow with Alabania currency
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential
* req.params.Payload.CreditorAccount.Iban="AL47212110090000000235698741" 
* req.params.Payload.CreditorAgent.Bic="PUPPALTRXXX"
* req.params.Payload.InstructedAmount.Currency ="ALL"
* req.params.Payload.PaymentPurpose = "Payment as Agreed" 
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* jUtil.SetData("GetAuditsAlbaniaAPIpostive",ref)
* def value = signsreq(req,user)
* request value	
* method post
* status 200
* match response.result contains {transactionId:"#string"}
* def all_eid = response.result.transactionId
* print all_eid

* def sleep = function(millis){ java.lang.Thread.sleep(millis) }
* eval sleep(15000)

# Approve Transaction
* def user = testData.Visa_API_CK
* approve.params.Api.Credential = user.Credential
* approve.params.Payload.transactionIds[0] = all_eid
* path 'api'
* def value = signsreq(approve,user)
* request value
* method post
* status 200
* match response.result contains {message:"1 of 1 Transactions approved successfully"}


###Initiate transaction with different currency
Scenario: Albania Positive flow with Other currency(EUR)
* def user = testData.Visa_API_MK
* req.params.Payload.InstructedAmount.Currency ="EUR"
* req.params.Payload.CreditorAccount.AccountNumber="566542222"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* jUtil.SetData("GetAuditsAlbaniaAPIothercurrency",ref)
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
* approve.params.Payload.transactionIds[0] = all_eid
* path 'api'

* def value = signsreq(approve,user)
* request value
* method post
* status 200
* match response.result contains {message:"1 of 1 Transactions approved successfully"}
 
 
 
Scenario: Albania Bic as Invalid(Currency and BIC are in same country-ALBANIA)
* def user = testData.Visa_API_MK
* req.params.Payload.CreditorAccount.Iban="AL47212110090000000235698741" 
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency ="ALL"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}


 
Scenario: Albania Bic as Empty (Currency and BIC are in same country-ALBANIA)
* def user = testData.Visa_API_MK
* req.params.Payload.CreditorAccount.Iban="AL47212110090000000235698741" 
* req.params.Payload.InstructedAmount.Currency ="ALL"
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}
 
 
 
Scenario: Albania iban as Empty(Currency and BIC are in same country-ALBANIA)
* def user = testData.Visa_API_MK
* req.params.Payload.CreditorAccount.Iban = ""
* req.params.Payload.InstructedAmount.Currency ="ALL"
* req.params.Payload.CreditorAgent.Bic="PUPPALTRXXX"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}


 
Scenario: Albania purpose as Empty(Currency and BIC are in same country-ALBANIA)
* def user = testData.Visa_API_MK
* req.params.Payload.CreditorAccount.Iban="AL47212110090000000235698741" 
* req.params.Payload.InstructedAmount.Currency ="ALL"
* req.params.Payload.CreditorAgent.Bic="PUPPALTRXXX"
* req.params.Payload.PaymentPurpose = ""
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}
