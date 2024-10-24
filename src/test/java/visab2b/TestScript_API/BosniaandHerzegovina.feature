Feature: Bosnia and Herzegovina Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "BosniaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Bosnia and Herzegovina Positive flow
* req.params.Payload.CreditorAgent.Bic = "UNCRBA22XXX" 
* req.params.Payload.InstructedAmount.Currency = "BAM"
* req.params.Payload.CreditorAccount.Iban = "BY13NBRB3600900000002Z00AB00"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsBosniaAPIpostive",ref)
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


# Initiate transaction with different currency
Scenario: Albania Positive flow with Other currency(COP)
* req.params.Payload.InstructedAmount.Currency ="COP"
* req.params.Payload.CreditorAccount.AccountNumber="566542222"
* jUtil.SetData("GetAuditsBosniaAPIothercurrency",ref)
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

Scenario: Bosnia and Herzegovina Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "BAM"
* req.params.Payload.CreditorAccount.Iban = "BY13NBRB3600900000002Z00AB00"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Bosnia and Herzegovina Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "BAM"
* req.params.Payload.CreditorAccount.Iban = "BY13NBRB3600900000002Z00AB00"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Bosnia and Herzegovina Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "UNCRBA22XXX"
* req.params.Payload.InstructedAmount.Currency = "BAM"
* req.params.Payload.CreditorAccount.Iban = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

Scenario: Bosnia and Herzegovina purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "UNCRBA22XXX"
* req.params.Payload.InstructedAmount.Currency = "BAM"
* req.params.Payload.CreditorAccount.Iban = "BY13NBRB3600900000002Z00AB00"

* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}