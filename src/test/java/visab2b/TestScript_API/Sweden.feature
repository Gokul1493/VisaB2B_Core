Feature: Sweden Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "SwedenAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Sweden Positive flow
* req.params.Payload.CreditorAgent.Bic = "AAFCSEMM"
* req.params.Payload.InstructedAmount.Currency = "SEK"
* req.params.Payload.CreditorAccount.Iban = "SE9524946551426876936529"
* def getReferenceNumber = jutil.GetData('GetAuditsSwedenAPIpostive')
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

Scenario: Sweden Positive flow With USD currency
* req.params.Payload.CreditorAgent.Bic = "AAFCSEMM"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "SE9524946551426876936529"
* def getReferenceNumber = jutil.GetData('GetAuditsSwedenAPIothercurrency')
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


Scenario: Sweden Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "SEK"
* req.params.Payload.CreditorAccount.Iban = "SE9524946551426876936529"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Sweden Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "SEK"
* req.params.Payload.CreditorAccount.Iban = "SE9524946551426876936529"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Sweden Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "AAFCSEMM"
* req.params.Payload.InstructedAmount.Currency = "SEK"
* req.params.Payload.CreditorAccount.Iban = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

Scenario: Sweden Bic Less than 8 digits
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "SEK"
* req.params.Payload.CreditorAccount.Iban = "SE9524946551426876936529"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Sweden Bic more than 11 digits
* req.params.Payload.CreditorAgent.Bic = "AAFCSEMMXXXXXX"
* req.params.Payload.InstructedAmount.Currency = "SEK"
* req.params.Payload.CreditorAccount.Iban = "SE9524946551426876936529"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Sweden Positive flow Without enterpirse ID
* req.params.Payload.CreditorAgent.Bic = "AAFCSEMM"
* req.params.Payload.InstructedAmount.Currency = "SEK"
* req.params.Payload.CreditorAccount.Iban = "SE9524946551426876936529"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* def getReferenceNumber = jutil.GetData('GetAuditsSwedenAPIpostive')
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

