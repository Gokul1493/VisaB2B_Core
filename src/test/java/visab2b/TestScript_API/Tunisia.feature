Feature: Tunisia Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "TunisiaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Tunisia Positive flow
* req.params.Payload.CreditorAgent.Bic = "ATBKTNTTXXX"
* req.params.Payload.InstructedAmount.Currency = "TND"
* req.params.Payload.CreditorAccount.Iban = "TN5910006035183598478831"
* def getReferenceNumber = jutil.GetData('GetAuditsTunisiaAPIpostive')
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

Scenario: Tunisia Positive flow with cross border currency
* req.params.Payload.CreditorAgent.Bic = "ATBKTNTTXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "TN5910006035183598478831"
* def getReferenceNumber = jutil.GetData('GetAuditsTunisiaAPIothercurrency')
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

Scenario: Tunisia Positive flow without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "ATBKTNTTXXX"
* req.params.Payload.InstructedAmount.Currency = "TND"
* req.params.Payload.CreditorAccount.Iban = "TN5910006035183598478831"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* def getReferenceNumber = jutil.GetData('GetAuditsTunisiaAPIpostive')
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

Scenario: Tunisia Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "TND"
* req.params.Payload.CreditorAccount.Iban = "TN5910006035183598478831"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Tunisia Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "TND"
* req.params.Payload.CreditorAccount.Iban = "TN5910006035183598478831"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Tunisia Bic as more than 11 character
* req.params.Payload.CreditorAgent.Bic = "ATBKTNTTXXXXXXXX"
* req.params.Payload.InstructedAmount.Currency = "TND"
* req.params.Payload.CreditorAccount.Iban = "TN5910006035183598478831"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Tunisia Bic as less than 8 character
* req.params.Payload.CreditorAgent.Bic = "ATBKT"
* req.params.Payload.InstructedAmount.Currency = "TND"
* req.params.Payload.CreditorAccount.Iban = "TN5910006035183598478831"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Tunisia Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "ATBKTNTTXXX"
* req.params.Payload.InstructedAmount.Currency = "TND"
* req.params.Payload.CreditorAccount.Iban = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

