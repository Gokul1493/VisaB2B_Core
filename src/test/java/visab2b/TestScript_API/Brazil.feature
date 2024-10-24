Feature: Brazil Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "BrazilAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Brazil Positive flow
* req.params.Payload.CreditorAgent.Bic = "BRASBRRJXXX"
* req.params.Payload.InstructedAmount.Currency = "BRL"
* req.params.Payload.CreditorAccount.Iban = "BR1800360305000010009795493C1"
* req.params.Payload.CreditorAccount.TaxId = "11223344556098"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsBrazilAPIpostive",ref)
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


 
###Initiate transaction with different currency
Scenario: Albania Positive flow with Other currency(EUR)
* req.params.Payload.InstructedAmount.Currency ="EUR"
* req.params.Payload.CreditorAccount.AccountNumber="566542222"
* jUtil.SetData("GetAuditsBrazilAPIothercurrency",ref)
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.result contains {transactionId:"#string"}
* def all_eid = response.result.transactionId
* print all_eid
    
* def sleep = function(millis){ java.lang.Thread.sleep(millis) }
* eval sleep(15000)
    
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


 
Scenario: Brazil Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "BRL"
* req.params.Payload.CreditorAccount.Iban = "BR9700360305000010009795493P1"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}


 
Scenario: Brazil Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "BRL"
* req.params.Payload.CreditorAccount.Iban = "BR9700360305000010009795493P1"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}


 
Scenario: Brazil Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "ABCBBRSPXXX"
* req.params.Payload.InstructedAmount.Currency = "BRL"
* req.params.Payload.CreditorAccount.Iban = ""
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAgent.BranchId ="Branch 123"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}



 
Scenario: Brazil purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "ABCBBRSPXXX"
* req.params.Payload.InstructedAmount.Currency = "BRL"
* req.params.Payload.CreditorAccount.Iban = "BR9700360305000010009795493P1"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAgent.BranchId ="Branch 123"

* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}


 
Scenario: Brazil TaxId as Empty
* req.params.Payload.CreditorAgent.Bic = "ABCBBRSPXXX"
* req.params.Payload.InstructedAmount.Currency = "BRL"
* req.params.Payload.CreditorAccount.Iban = "BR9700360305000010009795493P1"
* req.params.Payload.CreditorAccount.TaxId = ""
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorTaxID' cannot be null."}


 
Scenario: Brazil TaxId greater than 14 digit
* req.params.Payload.CreditorAgent.Bic = "ABCBBRSPXXX"
* req.params.Payload.InstructedAmount.Currency = "BRL"
* req.params.Payload.CreditorAccount.Iban = "BR9700360305000010009795493P1"
* req.params.Payload.CreditorAccount.TaxId = "112233445566778"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 14-numeric."}


 
Scenario: Brazil TaxId less than 14 digit
* req.params.Payload.CreditorAgent.Bic = "ABCBBRSPXXX"
* req.params.Payload.InstructedAmount.Currency = "BRL"
* req.params.Payload.CreditorAccount.Iban = "BR9700360305000010009795493P1"
* req.params.Payload.CreditorAccount.TaxId = "1122334455667"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 14-numeric."}


 
Scenario: Brazil ContactPhonenumber as Empty
* req.params.Payload.CreditorAgent.Bic = "ABCBBRSPXXX"
* req.params.Payload.InstructedAmount.Currency = "BRL"
* req.params.Payload.CreditorAccount.Iban = "BR9700360305000010009795493P1"
* req.params.Payload.CreditorAccount.TaxId = "12345678912345"
* req.params.Payload.CreditorAccount.PhoneNumber = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorContactPhoneNumber' cannot be null."}


 
Scenario: Brazil ContactPhonenumber as Invalid Format - Without country code(8099087766)
* req.params.Payload.CreditorAgent.Bic = "ABCBBRSPXXX"
* req.params.Payload.InstructedAmount.Currency = "BRL"
* req.params.Payload.CreditorAccount.Iban = "BR9700360305000010009795493P1"
* req.params.Payload.CreditorAccount.TaxId = "12345678912345"
* req.params.Payload.CreditorAccount.PhoneNumber = "8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Contact Phone Number must be starts with + and followed by dialing code,- and numeric digits."}