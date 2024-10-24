Feature: Georgia Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "GeorgiaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Georgia Positive flow
* req.params.Payload.CreditorAgent.Bic = "BAGAGE22GTS"
* req.params.Payload.InstructedAmount.Currency = "GEL"
* req.params.Payload.CreditorAccount.Iban = "GE29NB0000000101904917"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsGeorgiaAPIpostive",ref)
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

Scenario: Georgia Positive flow with cross border currency
* req.params.Payload.CreditorAgent.Bic = "BAGAGE22GTS"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "GE29NB0000000101904917"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsGeorgiaAPIothercurrency",ref)
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

Scenario: Georgia Positive flow without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "BAGAGE22GTS"
* req.params.Payload.InstructedAmount.Currency = "GEL"
* req.params.Payload.CreditorAccount.Iban = "GE29NB0000000101904917"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* jUtil.SetData("GetAuditsGeorgiaAPIpostivewithoutEID",ref)
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

Scenario: Georgia Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "GEL"
* req.params.Payload.CreditorAccount.Iban = "GE29NB0000000101904917"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user) 
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Georgia Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "GEL"
* req.params.Payload.CreditorAccount.Iban = "GE29NB0000000101904917"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""	
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Georgia Bic as less than 8 char
* req.params.Payload.CreditorAgent.Bic = "BAG"
* req.params.Payload.InstructedAmount.Currency = "GEL"
* req.params.Payload.CreditorAccount.Iban = "GE29NB0000000101904917"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""	
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Georgia Bic as more than 11 char
* req.params.Payload.CreditorAgent.Bic = "BAGAGE22GTSSSSSSS"
* req.params.Payload.InstructedAmount.Currency = "GEL"
* req.params.Payload.CreditorAccount.Iban = "GE29NB0000000101904917"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""	
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Georgia Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "BAGAGE22GTS"
* req.params.Payload.InstructedAmount.Currency = "GEL"
* req.params.Payload.CreditorAccount.Iban = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

Scenario: Georgia purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "BAGAGE22GTS"
* req.params.Payload.InstructedAmount.Currency = "GEL"
* req.params.Payload.CreditorAccount.Iban = "GE29NB0000000101904917"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null"}

Scenario: Georgia Bic less than 8 digits
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "GEL"
* req.params.Payload.CreditorAccount.Iban = "GE29NB0000000101904917"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user) 
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Georgia Bic more than 11 digits
* req.params.Payload.CreditorAgent.Bic = "PUPXXXXCDCDCDCD"
* req.params.Payload.InstructedAmount.Currency = "GEL"
* req.params.Payload.CreditorAccount.Iban = "GE29NB0000000101904917"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user) 
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}