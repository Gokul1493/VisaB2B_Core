Feature: South Africa Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "SouthAfricaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: South Africa Positive flow 
* req.params.Payload.CreditorAgent.Bic = "AFEPZAJ2CLO"
* req.params.Payload.InstructedAmount.Currency = "ZAR"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def getReferenceNumber = jutil.GetData('GetAuditsSouthAfricaAPIpostive')
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



Scenario: South Africa Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "ZAR"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: South Africa Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "ZAR"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: South Africa AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "AFEPZAJ2CLO"
* req.params.Payload.InstructedAmount.Currency = "ZAR"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

Scenario: South Africa purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "AFEPZAJ2CLO"
* req.params.Payload.InstructedAmount.Currency = "ZAR"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}


Scenario: South Africa ContactPhonenumber as Empty
* req.params.Payload.CreditorAgent.Bic = "AFEPZAJ2CLO"
* req.params.Payload.InstructedAmount.Currency = "ZAR"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAccount.PhoneNumber = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorContactPhoneNumber' cannot be null."}

Scenario: South Africa ContactPhonenumber as Invalid Format - Without country code(8099087766)
* req.params.Payload.CreditorAgent.Bic = "AFEPZAJ2CLO"
* req.params.Payload.InstructedAmount.Currency = "ZAR"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAccount.PhoneNumber = "8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Contact Phone Number must be starts with + and followed by dialing code,- and numeric digits."}

Scenario: South Africa Positive flow with USD Currency
* req.params.Payload.CreditorAgent.Bic = "AFEPZAJ2CLO"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def getReferenceNumber = jutil.GetData('GetAuditsSouthAfricaAPIothercurrency')
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

Scenario: South Africa Positive flow WITHOUT Enterprise ID
* req.params.Payload.CreditorAgent.Bic = "AFEPZAJ2CLO"
* req.params.Payload.InstructedAmount.Currency = "ZAR"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* def getReferenceNumber = jutil.GetData('GetAuditsSouthAfricaAPIpostivewithoutEID')
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


Scenario: South Africa Bic less than 8 digits
* req.params.Payload.CreditorAgent.Bic = "AFEP"
* req.params.Payload.InstructedAmount.Currency = "ZAR"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: South Africa Bic more than 11 digits
* req.params.Payload.CreditorAgent.Bic = "AFEPZAJ2CLOXXX"
* req.params.Payload.InstructedAmount.Currency = "ZAR"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}


