Feature: CostaRica Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "CostaRicaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: CostaRica Positive flow with tax id as 12 digit
* req.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* req.params.Payload.InstructedAmount.Currency = "CRC"
* req.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "012345678901"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsCostaRicaAPIpostive",ref)
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

Scenario: CostaRica Positive flow with tax id as 15 digit
* req.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* req.params.Payload.InstructedAmount.Currency = "CRC"
* req.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "012345678901234"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsCostaRicaAPIsamecurrencywith15txid",ref)
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
 
Scenario: CostaRica Positive flow with other currency code (ALL)
* req.params.Payload.CreditorAgent.Bic = "AFDBCIABXXX"
* req.params.Payload.InstructedAmount.Currency = "ALL"
* req.params.Payload.CreditorAccount.AccountNumber = "685390075470346663456789"
* req.params.Payload.PaymentPurpose = ""
* jUtil.SetData("GetAuditsCostaricoAPIothercurrency",ref)
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

 
Scenario: CostaRica Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "BCCR"
* req.params.Payload.InstructedAmount.Currency = "CRC"
* req.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "012345678901234"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}
 
Scenario: CostaRica Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "CRC"
* req.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "012345678901234"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}


Scenario: CostaRica iban  as empty
* req.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* req.params.Payload.InstructedAmount.Currency = "CRC"
* req.params.Payload.CreditorAccount.Iban = ""
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "012345678901234"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}


Scenario: CostaRica phone number  as empty
* req.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* req.params.Payload.InstructedAmount.Currency = "CRC"
* req.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* req.params.Payload.CreditorAccount.PhoneNumber = ""
* req.params.Payload.CreditorAccount.TaxId = "012345678901234"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorContactPhoneNumber' cannot be null."}


Scenario: CostaRica phone number in invalid format
* req.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* req.params.Payload.InstructedAmount.Currency = "CRC"
* req.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* req.params.Payload.CreditorAccount.PhoneNumber = "8099087766"
* req.params.Payload.CreditorAccount.TaxId = "012345678901234"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Contact Phone Number must be starts with + and followed by dialing code,- and numeric digits."}


Scenario: CostaRica taxid  as empty
* req.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* req.params.Payload.InstructedAmount.Currency = "CRC"
* req.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorTaxID' cannot be null."}
 

 Scenario: CostaRica tax id less than 12 digit
* req.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* req.params.Payload.InstructedAmount.Currency = "CRC"
* req.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "012345678"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 12 to 15-numeric."}
 
 
 Scenario: CostaRica taxid greater than 15 digit
* req.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* req.params.Payload.InstructedAmount.Currency = "CRC"
* req.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "0123456789012345"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 12 to 15-numeric."}
 
 Scenario: CostaRica payment purpose as empty
* req.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* req.params.Payload.InstructedAmount.Currency = "CRC"
* req.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "012345678901234"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}
 
 
 