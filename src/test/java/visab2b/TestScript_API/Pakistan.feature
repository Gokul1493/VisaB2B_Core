Feature: Pakistan Transaction

Background:  
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "PakistanAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: Pakistan Positive flow
* req.params.Payload.CreditorAgent.Bic = "HABBPKKA007"
* req.params.Payload.InstructedAmount.Currency = "PKR"
* req.params.Payload.CreditorAccount.Iban = "PK36SCBL0000001123456702"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsPakistanAPIpostive')
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

Scenario: Pakistan Positive flow with usd currency
* req.params.Payload.CreditorAgent.Bic = "HABBPKKA007"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "PK36SCBL0000001123456702"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsPakistanAPIothercurrency')
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


Scenario: Pakistan Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "PKR"
* req.params.Payload.CreditorAccount.Iban = "PK36SCBL0000001123456702"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Pakistan Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "PKR"
* req.params.Payload.CreditorAccount.Iban = "PK36SCBL0000001123456702"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Pakistan Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "HABBPKKA007"
* req.params.Payload.InstructedAmount.Currency = "PKR"
* req.params.Payload.CreditorAccount.Iban = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

Scenario: Pakistan purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "HABBPKKA007"
* req.params.Payload.InstructedAmount.Currency = "PKR"
* req.params.Payload.CreditorAccount.Iban = "PK36SCBL0000001123456702"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

Scenario: Pakistan Positive flowWITHOUT ENTERPRISE ID
* req.params.Payload.CreditorAgent.Bic = "HABBPKKA007"
* req.params.Payload.InstructedAmount.Currency = "PKR"
* req.params.Payload.CreditorAccount.Iban = "PK36SCBL0000001123456702"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
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

Scenario: Pakistan Bic Less than 8 digits
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "PKR"
* req.params.Payload.CreditorAccount.Iban = "PK36SCBL0000001123456702"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Pakistan Bic more than 11 digits
* req.params.Payload.CreditorAgent.Bic = "HABBPKKA007XXXX"
* req.params.Payload.InstructedAmount.Currency = "PKR"
* req.params.Payload.CreditorAccount.Iban = "PK36SCBL0000001123456702"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}
