Feature: Ireland Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "IrelandAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Ireland Positive flow
* req.params.Payload.CreditorAgent.Bic = "BOFIIE2DXXX"
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.Iban = "IE64IRCE92050112345678"
* jUtil.SetData("GetAuditsIrelandAPIpostive",ref)
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

Scenario: Ireland Positive flow with usd currency
* req.params.Payload.CreditorAgent.Bic = "BOFIIE2DXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "IE64IRCE92050112345678"
* jUtil.SetData("GetAuditsIrelandAPIothercurrency",ref)
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

Scenario: Ireland Positive flow WITHOUT ENTERPRISE ID
* req.params.Payload.CreditorAgent.Bic = "BOFIIE2DXXX"
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.Iban = "IE64IRCE92050112345678"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* jUtil.SetData("GetAuditsIrelandAPIpostivewithoutEID",ref)
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



Scenario: Ireland Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.Iban = "IE64IRCE92050112345678"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Ireland Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.Iban = "IE64IRCE92050112345678"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Ireland Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "BOFIIE2DXXX"
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.Iban = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

Scenario: Ireland Bic Less than 8 digits
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.Iban = "IE64IRCE92050112345678"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Ireland Bic more than 11 digits
* req.params.Payload.CreditorAgent.Bic = "PUPXXXPUPXXX"
* req.params.Payload.InstructedAmount.Currency = "EUR"
* req.params.Payload.CreditorAccount.Iban = "IE64IRCE92050112345678"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

