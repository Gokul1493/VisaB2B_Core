Feature: Serbia Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "SerbiaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Serbia Positive flow
* req.params.Payload.CreditorAgent.Bic = "RZBSRSBGXXX"
* req.params.Payload.InstructedAmount.Currency = "RSD"
* req.params.Payload.CreditorAccount.Iban = "RS35260005601001611379"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsSerbiaAPIpostive')
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

Scenario: Serbia Positive flow with usd currency
* req.params.Payload.CreditorAgent.Bic = "RZBSRSBGXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "RS35260005601001611379"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsSerbiaAPIothercurrency')
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


Scenario: Serbia Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "RSD"
* req.params.Payload.CreditorAccount.Iban = "RS35260005601001611379"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Serbia Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "RSD"
* req.params.Payload.CreditorAccount.Iban = "RS35260005601001611379"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Serbia Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "RZBSRSBGXXX"
* req.params.Payload.InstructedAmount.Currency = "RSD"
* req.params.Payload.CreditorAccount.Iban = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

Scenario: Serbia purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "RZBSRSBGXXX"
* req.params.Payload.InstructedAmount.Currency = "RSD"
* req.params.Payload.CreditorAccount.Iban = "RS35260005601001611379"

* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

Scenario: Serbia Positive flow WITHOUT ENTERPRISE ID
* req.params.Payload.CreditorAgent.Bic = "RZBSRSBGXXX"
* req.params.Payload.InstructedAmount.Currency = "RSD"
* req.params.Payload.CreditorAccount.Iban = "RS35260005601001611379"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* def getReferenceNumber = jutil.GetData('GetAuditsSerbiaAPIpostive')
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

Scenario: Serbia Bic less than 8 digits
* req.params.Payload.CreditorAgent.Bic = "RZBSR"
* req.params.Payload.InstructedAmount.Currency = "RSD"
* req.params.Payload.CreditorAccount.Iban = "RS35260005601001611379"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Serbia Bic more than 11 digits
* req.params.Payload.CreditorAgent.Bic = "RZBSRSBGXXXXX"
* req.params.Payload.InstructedAmount.Currency = "RSD"
* req.params.Payload.CreditorAccount.Iban = "RS35260005601001611379"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}
