Feature: Israel Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "IsraelAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Israel Positive flow
* req.params.Payload.CreditorAgent.Bic = "ISRAILIJXXX"
* req.params.Payload.InstructedAmount.Currency = "ILS"
* req.params.Payload.CreditorAccount.Iban = "IL170108000000012612345"
* jUtil.SetData("GetAuditsIsraelAPIpostive",ref)
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

Scenario: Israel Positive flow with cross border currency
* req.params.Payload.CreditorAgent.Bic = "ISRAILIJXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "IL170108000000012612345"
* jUtil.SetData("GetAuditsIsraelAPIothercurrency",ref)
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

Scenario: Israel Positive flow without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "ISRAILIJXXX"
* req.params.Payload.InstructedAmount.Currency = "ILS"
* req.params.Payload.CreditorAccount.Iban = "IL170108000000012612345"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* jUtil.SetData("GetAuditsIsraelAPIpostivewithoutEID",ref)
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

Scenario: Israel Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "ILS"
* req.params.Payload.CreditorAccount.Iban = "IL170108000000012612345"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Israel Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "ILS"
* req.params.Payload.CreditorAccount.Iban = "IL170108000000012612345"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Israel Bic as less than 8 char
* req.params.Payload.CreditorAgent.Bic = "ISRA"
* req.params.Payload.InstructedAmount.Currency = "ILS"
* req.params.Payload.CreditorAccount.Iban = "IL170108000000012612345"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Israel Bic as more than 11 char
* req.params.Payload.CreditorAgent.Bic = "ISRAILIJXXXSAAAAAA"
* req.params.Payload.InstructedAmount.Currency = "ILS"
* req.params.Payload.CreditorAccount.Iban = "IL170108000000012612345"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Israel Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "ISRAILIJXXX"
* req.params.Payload.InstructedAmount.Currency = "ILS"
* req.params.Payload.CreditorAccount.Iban = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

