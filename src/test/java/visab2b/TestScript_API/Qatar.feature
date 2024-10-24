Feature: Qatar Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "QatarAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Qatar Positive flow
* req.params.Payload.CreditorAgent.Bic = "QNBAQAQASLB"
* req.params.Payload.InstructedAmount.Currency = "QAR"
* req.params.Payload.CreditorAccount.Iban = "QA58DOHB00001234567890ABCDEFG"
* def getReferenceNumber = jutil.GetData('GetAuditsQatarAPIpostive')
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

Scenario: Qatar Positive flow with usd currency
* req.params.Payload.CreditorAgent.Bic = "QNBAQAQASLB"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "QA58DOHB00001234567890ABCDEFG"
* def getReferenceNumber = jutil.GetData('GetAuditsQatarAPIothercurrency')
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


Scenario: Qatar Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "QAR"
* req.params.Payload.CreditorAccount.Iban = "QA58DOHB00001234567890ABCDEFG"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Qatar Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "QAR"
* req.params.Payload.CreditorAccount.Iban = "QA58DOHB00001234567890ABCDEFG"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Qatar Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "QNBAQAQASLB"
* req.params.Payload.InstructedAmount.Currency = "QAR"
* req.params.Payload.CreditorAccount.Iban = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

Scenario: Qatar Positive flow WITHOUT ENTERPRISE ID
* req.params.Payload.CreditorAgent.Bic = "QNBAQAQASLB"
* req.params.Payload.InstructedAmount.Currency = "QAR"
* req.params.Payload.CreditorAccount.Iban = "QA58DOHB00001234567890ABCDEFG"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* def getReferenceNumber = jutil.GetData('GetAuditsQatarAPIpostive')
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

Scenario: Qatar Bic Less than 8 digits
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "QAR"
* req.params.Payload.CreditorAccount.Iban = "QA58DOHB00001234567890ABCDEFG"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Qatar Bic more than 11 digits
* req.params.Payload.CreditorAgent.Bic = "QNBAQAQASLBXXX"
* req.params.Payload.InstructedAmount.Currency = "QAR"
* req.params.Payload.CreditorAccount.Iban = "QA58DOHB00001234567890ABCDEFG"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}
