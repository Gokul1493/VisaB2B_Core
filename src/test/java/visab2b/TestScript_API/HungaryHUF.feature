Feature: HungaryHUF Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "HungaryAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: HungaryHUF Positive flow
* req.params.Payload.CreditorAgent.Bic = "GHUNHUHBXXX"
* req.params.Payload.InstructedAmount.Currency = "HUF"
* req.params.Payload.CreditorAccount.Iban = "HU93116000060000000012345676"
* jUtil.SetData("GetAuditsHungaryAPIpostive",ref)
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

Scenario: HungaryHUF Positive flow with cross border currency
* req.params.Payload.CreditorAgent.Bic = "GHUNHUHBXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "HU93116000060000000012345676"
* jUtil.SetData("GetAuditsHungaryAPIothercurrency",ref)
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

Scenario: HungaryHUF Positive flow without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "GHUNHUHBXXX"
* req.params.Payload.InstructedAmount.Currency = "HUF"
* req.params.Payload.CreditorAccount.Iban = "HU93116000060000000012345676"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* jUtil.SetData("GetAuditsHungaryAPIpostivewithoutEID",ref)
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

Scenario: HungaryHUF Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "HUF"
* req.params.Payload.CreditorAccount.Iban = "HU93116000060000000012345676"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: HungaryHUF Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "HUF"
* req.params.Payload.CreditorAccount.Iban = "HU93116000060000000012345676"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: HungaryHUF Bic as less than 8
* req.params.Payload.CreditorAgent.Bic = "GHUN"
* req.params.Payload.InstructedAmount.Currency = "HUF"
* req.params.Payload.CreditorAccount.Iban = "HU93116000060000000012345676"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: HungaryHUF Bic as more than 11
* req.params.Payload.CreditorAgent.Bic = "GHUNHUHBXXXAAAAAAA"
* req.params.Payload.InstructedAmount.Currency = "HUF"
* req.params.Payload.CreditorAccount.Iban = "HU93116000060000000012345676"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: HungaryHUF Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "GHUNHUHBXXX"
* req.params.Payload.InstructedAmount.Currency = "HUF"
* req.params.Payload.CreditorAccount.Iban = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

