Feature: Malta Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "MaltaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: Malta Positive flow
* req.params.Payload.CreditorAgent.Bic = "MALTMTMTXXX"
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.Iban = "MT84MALT011000012345MTLCAST001S"
* def getReferenceNumber = jutil.GetData('GetAuditsMaltaAPIpostive')
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

Scenario: Malta Positive flow
* req.params.Payload.CreditorAgent.Bic = "MALTMTMTXXX"
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.Iban = "MT84MALT011000012345MTLCAST001S"
* def getReferenceNumber = jutil.GetData('GetAuditsMaltaAPIpostive')
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

Scenario: Malta Positive flow with cross border currency 
* req.params.Payload.CreditorAgent.Bic = "MALTMTMTXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "MT84MALT011000012345MTLCAST001S"
* def getReferenceNumber = jutil.GetData('GetAuditsMaltaAPIothercurrency')
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

Scenario: Malta Bic as Invalid without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.Iban = "MT84MALT011000012345MTLCAST001S"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Malta Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.Iban = "MT84MALT011000012345MTLCAST001S"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Malta Bic as less than 8 char
* req.params.Payload.CreditorAgent.Bic = "MALTM"
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.Iban = "MT84MALT011000012345MTLCAST001S"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Malta Bic as more than 11 char
* req.params.Payload.CreditorAgent.Bic = "MALTMTMTXXXXXXXXXXXXX"
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.Iban = "MT84MALT011000012345MTLCAST001S"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Malta Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "MALTMTMTXXX"
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.Iban = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

