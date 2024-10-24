Feature: Colombia Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "ColombiaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: Colombia Positive flow with 9 - digit - taxid
* req.params.Payload.CreditorAgent.Bic = "COLOCOBMXXX"
* req.params.Payload.InstructedAmount.Currency = "COP"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.CreditorAccount.TaxId = "012345678"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsColombiaAPIpostive",ref)
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
 
Scenario: Colombia Positive flow with 10 - digit - taxid
* req.params.Payload.CreditorAgent.Bic = "BCTOCOBBXXX"
* req.params.Payload.InstructedAmount.Currency = "COP"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.CreditorAccount.TaxId = "1122334455"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsColombiaAPIpostivewith10txid",ref)
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
 
 
 Scenario: Colombia Positive flow with different currency
* req.params.Payload.CreditorAgent.Bic = "COLOCOBMXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000002"
* jUtil.SetData("GetAuditsColombiaAPIothercurrency",ref)
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
 
 
Scenario: Colombia Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "COP"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}
 
Scenario: Colombia Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "COP"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}
 
Scenario: Colombia AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "BCTOCOBBXXX"
* req.params.Payload.InstructedAmount.Currency = "COP"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "COCADR"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}
 
Scenario: Colombia purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "BCTOCOBBXXX"
* req.params.Payload.InstructedAmount.Currency = "COP"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}
 
Scenario: Colombia TaxId as Empty
* req.params.Payload.CreditorAgent.Bic = "BCTOCOBBXXX"
* req.params.Payload.InstructedAmount.Currency = "COP"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.CreditorAccount.TaxId = ""
* req.params.Payload.PaymentPurpose = "COCADR"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorTaxID' cannot be null."}
 
Scenario: Colombia TaxId greater than 10 digit
* req.params.Payload.CreditorAgent.Bic = "BCTOCOBBXXX"
* req.params.Payload.InstructedAmount.Currency = "COP"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.PaymentPurpose = "COCADR"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 9 or 10-numeric."}
 
Scenario: Colombia TaxId less than 9 digit
* req.params.Payload.CreditorAgent.Bic = "BCTOCOBBXXX"
* req.params.Payload.InstructedAmount.Currency = "COP"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "11223344"
* req.params.Payload.PaymentPurpose = "COCADR"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 9 or 10-numeric."}
 
Scenario: Colombia ContactPhonenumber as Empty
* req.params.Payload.CreditorAgent.Bic = "BCTOCOBBXXX"
* req.params.Payload.InstructedAmount.Currency = "COP"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.CreditorAccount.TaxId = "1122334455"
* req.params.Payload.CreditorAccount.PhoneNumber = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorContactPhoneNumber' cannot be null."}
 
Scenario: Colombia ContactPhonenumber as Invalid Format - Without country code(8099087766)
* req.params.Payload.CreditorAgent.Bic = "BCTOCOBBXXX"
* req.params.Payload.InstructedAmount.Currency = "COP"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.CreditorAccount.TaxId = "112233445"
* req.params.Payload.CreditorAccount.PhoneNumber = "8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Contact Phone Number must be starts with + and followed by dialing code,- and numeric digits."}



