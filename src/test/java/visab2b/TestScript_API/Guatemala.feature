Feature: Guatemala Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "GuatemalaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Guatemala Positive flow with 11 - digit - taxid
* req.params.Payload.CreditorAgent.Bic = "BAGUGTGBXXX"
* req.params.Payload.InstructedAmount.Currency = "GTQ"
* req.params.Payload.CreditorAccount.Iban = "GT82TRAJ01020000001210029690"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "COCADR"
* jUtil.SetData("GetAuditsGuatemalaAPIpostive",ref)
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

Scenario: Guatemala Positive flow with 11 - digit - taxid with cross border currency
* req.params.Payload.CreditorAgent.Bic = "BAGUGTGBXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.Iban = "GT82TRAJ01020000001210029690"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "COCADR"
* jUtil.SetData("GetAuditsGuatemalaAPIothercurrency",ref)
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

Scenario: Guatemala Positive flow with 11 - digit - taxid without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "BAGUGTGBXXX"
* req.params.Payload.InstructedAmount.Currency = "GTQ"
* req.params.Payload.CreditorAccount.Iban = "GT82TRAJ01020000001210029690"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "COCADR"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* jUtil.SetData("GetAuditsGuatemalaAPIpostivewithoutEID",ref)
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

Scenario: Guatemala Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "GTQ"
* req.params.Payload.CreditorAccount.Iban = "GT82TRAJ01020000001210029690"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "COCADR"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Guatemala Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "GTQ"
* req.params.Payload.CreditorAccount.Iban = "GT82TRAJ01020000001210029690"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "COCADR"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}


Scenario: Guatemala Bic as less than 8 char
* req.params.Payload.CreditorAgent.Bic = "BAGUG"
* req.params.Payload.InstructedAmount.Currency = "GTQ"
* req.params.Payload.CreditorAccount.Iban = "GT82TRAJ01020000001210029690"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "COCADR"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Guatemala Bic as more than 11 char
* req.params.Payload.CreditorAgent.Bic = "BAGUGTGBXXXSSSSSSS"
* req.params.Payload.InstructedAmount.Currency = "GTQ"
* req.params.Payload.CreditorAccount.Iban = "GT82TRAJ01020000001210029690"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "COCADR"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}
Scenario: Guatemala Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "BAGUGTGBXXX"
* req.params.Payload.InstructedAmount.Currency = "GTQ"
* req.params.Payload.CreditorAccount.Iban = ""
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "COCADR"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

Scenario: Guatemala purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "BAGUGTGBXXX"
* req.params.Payload.InstructedAmount.Currency = "GTQ"
* req.params.Payload.CreditorAccount.Iban = "GT82TRAJ01020000001210029690"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

Scenario: Guatemala TaxId as Empty
* req.params.Payload.CreditorAgent.Bic = "BAGUGTGBXXX"
* req.params.Payload.InstructedAmount.Currency = "GTQ"
* req.params.Payload.CreditorAccount.Iban = "GT82TRAJ01020000001210029690"
* req.params.Payload.CreditorAccount.TaxId = ""
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "COCADR"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorTaxID' cannot be null."}

Scenario: Guatemala TaxId greater than 11 digit
* req.params.Payload.CreditorAgent.Bic = "BAGUGTGBXXX"
* req.params.Payload.InstructedAmount.Currency = "GTQ"
* req.params.Payload.CreditorAccount.Iban = "GT82TRAJ01020000001210029690"
* req.params.Payload.CreditorAccount.TaxId = "112233445567"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "COCADR"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 11-numeric."}

Scenario: Guatemala TaxId less than 12 digit
* req.params.Payload.CreditorAgent.Bic = "BAGUGTGBXXX"
* req.params.Payload.InstructedAmount.Currency = "GTQ"
* req.params.Payload.CreditorAccount.Iban = "GT82TRAJ01020000001210029690"
* req.params.Payload.CreditorAccount.TaxId = "1122334455"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "COCADR"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 11-numeric."}

Scenario: Guatemala ContactPhonenumber as Empty
* req.params.Payload.CreditorAgent.Bic = "BAGUGTGBXXX"
* req.params.Payload.InstructedAmount.Currency = "GTQ"
* req.params.Payload.CreditorAccount.Iban = "GT82TRAJ01020000001210029690"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.PhoneNumber = ""
* req.params.Payload.PaymentPurpose = "COCADR"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorContactPhoneNumber' cannot be null."}

Scenario: Guatemala ContactPhonenumber as Invalid Format - Without country code(8099087766)
* req.params.Payload.CreditorAgent.Bic = "BAGUGTGBXXX"
* req.params.Payload.InstructedAmount.Currency = "GTQ"
* req.params.Payload.CreditorAccount.Iban = "GT82TRAJ01020000001210029690"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "8099087766"

* req.params.Payload.PaymentPurpose = "COCADR"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Contact Phone Number must be starts with + and followed by dialing code,- and numeric digits."}



