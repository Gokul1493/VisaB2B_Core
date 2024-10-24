Feature: Peru Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "Peru"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: Peru Positive flow with 11 digit Taxid
* req.params.Payload.CreditorAgent.Bic = "ICBKPEPLXXX"
* req.params.Payload.InstructedAmount.Currency = "PEN"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"

* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* def getReferenceNumber = jutil.GetData('GetAuditsPeruAPIpostive')
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

Scenario: Peru Positive flow with 11 digit Taxid with cross border currency
* req.params.Payload.CreditorAgent.Bic = "ICBKPEPLXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"

* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* def getReferenceNumber = jutil.GetData('GetAuditsPeruPIothercurrency')
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

Scenario: Peru Positive flow with 11 digit Taxid without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "ICBKPEPLXXX"
* req.params.Payload.InstructedAmount.Currency = "PEN"

* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* def getReferenceNumber = jutil.GetData('GetAuditsPeruAPIpostive')
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

Scenario: Peru Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "PEN"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"

* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Peru Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "PEN"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Peru Bic as More than 11 Char
* req.params.Payload.CreditorAgent.Bic = "ICBKPEPLXXXXXXXX"
* req.params.Payload.InstructedAmount.Currency = "PEN"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Peru Bic as less than 8 char
* req.params.Payload.CreditorAgent.Bic = "ICBK"
* req.params.Payload.InstructedAmount.Currency = "PEN"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Peru AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "ICBKPEPLXXX"
* req.params.Payload.InstructedAmount.Currency = "PEN"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

Scenario: Peru purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "ICBKPEPLXXX"
* req.params.Payload.InstructedAmount.Currency = "PEN"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"

* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}


Scenario: Peru TaxId as Empty
* req.params.Payload.CreditorAgent.Bic = "ICBKPEPLXXX"
* req.params.Payload.InstructedAmount.Currency = "PEN"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"

* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorTaxID' cannot be null."}


Scenario: Peru TaxId greater than 11 digit
* req.params.Payload.CreditorAgent.Bic = "ICBKPEPLXXX"
* req.params.Payload.InstructedAmount.Currency = "PEN"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAccount.TaxId = "11223344556566"

* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 11-numeric."}

Scenario: Peru TaxId less than 11 digit
* req.params.Payload.CreditorAgent.Bic = "ICBKPEPLXXX"
* req.params.Payload.InstructedAmount.Currency = "PEN"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAccount.TaxId = "112233445565"

* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 11-numeric."}
