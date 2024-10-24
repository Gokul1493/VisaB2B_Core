Feature: Laos Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "LaosAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Laos Positive flow
* req.params.Payload.CreditorAgent.Bic = "LPDRLALAXXX"
* req.params.Payload.InstructedAmount.Currency = "LAK"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsLaosAPIpostive",ref)
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

Scenario: Laos Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "LAK"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Laos Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "LAK"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAgentBic' cannot be null."}

Scenario: Laos AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "LPDRLALAXXX"
* req.params.Payload.InstructedAmount.Currency = "LAK"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

Scenario: Laos purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "LPDRLALAXXX"
* req.params.Payload.InstructedAmount.Currency = "LAK"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}


Scenario: Laos Positive flow Without enterprise id
* req.params.Payload.CreditorAgent.Bic = "LPDRLALAXXX"
* req.params.Payload.InstructedAmount.Currency = "LAK"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* jUtil.SetData("GetAuditsLaosAPIpostivewithoutEID",ref)
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

Scenario: Laos Bic less than 8 digits
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "LAK"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Laos Bic more than 11 digits
* req.params.Payload.CreditorAgent.Bic = "LPDRLALAXXXXX"
* req.params.Payload.InstructedAmount.Currency = "LAK"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

