Feature: Srilanka Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "SriLankaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: Srilanka Positive flow
* req.params.Payload.CreditorAgent.Bic = "BCEYLKLXXXX"
* req.params.Payload.InstructedAmount.Currency = "LKR"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* def getReferenceNumber = jutil.GetData('GetAuditsSriLankaAPIpostive')
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
* match response contains {}

Scenario: Srilanka Positive flow with cross border currency
* req.params.Payload.CreditorAgent.Bic = "BCEYLKLXXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* def getReferenceNumber = jutil.GetData('GetAuditsSriLankaAPIothercurrency')
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
* match response contains {}

Scenario: Srilanka Positive flow without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "BCEYLKLXXXX"
* req.params.Payload.InstructedAmount.Currency = "LKR"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* def getReferenceNumber = jutil.GetData('GetAuditsSriLankaAPIpostive')
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
* match response contains {}

Scenario: Srilanka Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "LKR"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"

* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Srilanka Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "LKR"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Srilanka Bic as More than 11 Char
* req.params.Payload.CreditorAgent.Bic = "BCEYLKLXXXXZZZZZZZZ"
* req.params.Payload.InstructedAmount.Currency = "LKR"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Srilanka Bic as Less than 8 Char
* req.params.Payload.CreditorAgent.Bic = "BCEYL"
* req.params.Payload.InstructedAmount.Currency = "LKR"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Srilanka AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "BCEYLKLXXXX"
* req.params.Payload.InstructedAmount.Currency = "LKR"
* req.params.Payload.CreditorAccount.AccountNumber = ""

* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}



