Feature: Croatia (HR) Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "CroayiaHR"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

  
Scenario: Croatia (HR) Positive flow
* req.params.Payload.CreditorAgent.Bic = "ESBCHR22BRO"
* req.params.Payload.InstructedAmount.Currency = "HRK"
* req.params.Payload.CreditorAccount.Iban = "HR1210010051863000160"
* jUtil.SetData("GetAuditsCroayiaHRAPIpostive",ref)
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

   
Scenario: Croatia (HR) Positive flow with other currency code (ALL)
* req.params.Payload.CreditorAgent.Bic = "HKBOHR2XXXX"
* req.params.Payload.InstructedAmount.Currency = "ALL"
* req.params.Payload.CreditorAccount.AccountNumber = "210010051863000160"
* jUtil.SetData("GetAuditsCroayiaHRAPIothercurrency",ref)
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

   
Scenario: Croatia (HR) Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "HRK"
* req.params.Payload.CreditorAccount.Iban = "HR1210010051863000160"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}
  
Scenario: Croatia (HR) Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "HRK"
* req.params.Payload.CreditorAccount.Iban = "HR1210010051863000160"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAgentBic' cannot be null."}
 
Scenario: Croatia (HR) Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "HKBOHR2XXXX"
* req.params.Payload.InstructedAmount.Currency = "HRK"
* req.params.Payload.CreditorAccount.Iban = ""
#Account number and bic are mandatory, when country currency mismatch situation
* req.params.Payload.CreditorAccount.AccountNumber = "65546546546564" 
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.result contains {status: "IN_PROCESS"}