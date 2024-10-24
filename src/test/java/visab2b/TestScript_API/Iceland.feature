Feature: Iceland Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "IcelandAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential
 
Scenario: Iceland Positive flow
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential
* req.params.Payload.CreditorAgent.Bic = "ESJAISREXXX"
* req.params.Payload.InstructedAmount.Currency = "ISK"
* req.params.Payload.CreditorAccount.Iban = "IS140159260076545510730339" 
* jUtil.SetData("GetAuditsIcelandAPIpostive",ref)
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

   
Scenario: Iceland Positive flow with Other currency(USD)
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential
* req.params.Payload.InstructedAmount.Currency ="USD"
* req.params.Payload.CreditorAccount.Iban = "IS140159260076545510730339"
* jUtil.SetData("GetAuditsIcelandAPIothercurrency",ref)
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

  
Scenario: Iceland Bic as Invalid
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "ISK"
* req.params.Payload.CreditorAccount.Iban = "IS140159260076545510730339"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

  
Scenario: Iceland Bic as Empty
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "ISK"
* req.params.Payload.CreditorAccount.Iban = "IS140159260076545510730339"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAgentBic' cannot be null."}

  
Scenario: Iceland iban as Empty
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential
* req.params.Payload.CreditorAgent.Bic = "ESJAISREXXX"
* req.params.Payload.InstructedAmount.Currency = "ISK"
* req.params.Payload.CreditorAccount.Iban = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

  
