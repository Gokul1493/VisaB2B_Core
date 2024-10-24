Feature: Angola Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "AngolaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential
 
Scenario: Angola Positive flow
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential
* req.params.Payload.CreditorAgent.Bic = "FNROCNBQXXX"
* req.params.Payload.InstructedAmount.Currency = "AOA"
* req.params.Payload.CreditorAccount.Iban = "AO06004400006729503010102" 
* jUtil.SetData("GetAuditsAngolaAPIIpostive",ref)
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

   
Scenario: Angola Positive flow with Other currency(USD)
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential
* req.params.Payload.InstructedAmount.Currency ="USD"
* req.params.Payload.CreditorAccount.AccountNumber="566542454222"
* jUtil.SetData("GetAuditsAngolaAPIothercurrency",ref)
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

  
Scenario: Angola Bic as Invalid
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "AOA"
* req.params.Payload.CreditorAccount.Iban = "AO06004400006729503010102"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

  
Scenario: Angola Bic as Empty
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "AOA"
* req.params.Payload.CreditorAccount.Iban = "AO06004400006729503010102"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

  
Scenario: Angola iban as Empty
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential
* req.params.Payload.CreditorAgent.Bic = "BCCBAOLUXXX"
* req.params.Payload.InstructedAmount.Currency = "AOA"
* req.params.Payload.CreditorAccount.Iban = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

  
Scenario: Angola purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "BCCBAOLUXXX"
* req.params.Payload.InstructedAmount.Currency = "AOA"
* req.params.Payload.CreditorAccount.Iban = "AO06004400006729503010102"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}