Feature: Austria Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "AustriaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Austria Positive flow
* req.params.Payload.CreditorAgent.Bic = "NATAAU3303M" 
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAgent.Bic = "BKAUATWWXXX"
* req.params.Payload.CreditorAccount.Iban = "AT483200000012345864"
* jUtil.SetData("GetAuditsAustriaAPIpostive",ref)
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
Scenario: Albania Positive flow with Other currency(USD) 
* req.params.Payload.InstructedAmount.Currency ="USD"
* req.params.Payload.CreditorAccount.AccountNumber="566542222"
* req.params.Payload.CreditorAgent.Bic = "BKAUATWWXXX"
* req.params.Payload.CreditorAccount.Iban=""
* req.params.Payload.PaymentPurpose=""
* jUtil.SetData("GetAuditsAustriaAPIothercurrency",ref)
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

Scenario: Austria Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.Iban = "AT483200000012345864"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Austria Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.Iban = "AT483200000012345864"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Austria Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "NATAAU3303M"
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.CreditorAccount.Iban = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* print response
* match response.error contains {message:"Creditor account number/IBAN is missing."}

