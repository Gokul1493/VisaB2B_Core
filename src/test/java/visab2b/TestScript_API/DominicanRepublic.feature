Feature: Dominician Republic Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "DominicanAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Dominician Republic Positive flow with 9 - digit - taxid
* req.params.Payload.CreditorAgent.Bic = "BPDODOSXXXX"
* req.params.Payload.InstructedAmount.Currency = "DOP"
* req.params.Payload.CreditorAccount.Iban = "DO22ACAU00000000000123456789"
* req.params.Payload.CreditorAccount.TaxId = "112233445"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsDominicanRepublicAPIpostive",ref)
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


Scenario: Dominician Republic Positive with other currency
* req.params.Payload.CreditorAgent.Bic = "BPDODOSXXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "408000000192000145399"
* jUtil.SetData("GetAuditsDominicanRepublicAPIothercurrency",ref)
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

Scenario: Dominician Republic Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "DOP"
* req.params.Payload.CreditorAccount.Iban = "DO22ACAU00000000000123456789"
* req.params.Payload.CreditorAccount.TaxId = "112233445"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Dominician Republic Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "DOP"
* req.params.Payload.CreditorAccount.Iban = "DO22ACAU00000000000123456789"
* req.params.Payload.CreditorAccount.TaxId = "112233445"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Dominician Republic Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "BPDODOSXXXX"
* req.params.Payload.InstructedAmount.Currency = "DOP"
* req.params.Payload.CreditorAccount.Iban = ""
* req.params.Payload.CreditorAccount.TaxId = "112233445"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

Scenario: Dominician Republic purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "BPDODOSXXXX"
* req.params.Payload.InstructedAmount.Currency = "DOP"
* req.params.Payload.CreditorAccount.Iban = "DO22ACAU00000000000123456789"
* req.params.Payload.CreditorAccount.TaxId = "112233445"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

Scenario: Dominician Republic TaxId as Empty
* req.params.Payload.CreditorAgent.Bic = "BPDODOSXXXX"
* req.params.Payload.InstructedAmount.Currency = "DOP"
* req.params.Payload.CreditorAccount.Iban = "DO22ACAU00000000000123456789"
* req.params.Payload.CreditorAccount.TaxId = ""
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorTaxID' cannot be null."}

Scenario: Dominician Republic TaxId greater than 9 digit
* req.params.Payload.CreditorAgent.Bic = "BPDODOSXXXX"
* req.params.Payload.InstructedAmount.Currency = "DOP"
* req.params.Payload.CreditorAccount.Iban = "DO22ACAU00000000000123456789"
* req.params.Payload.CreditorAccount.TaxId = "1122334455"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "COCADR"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 9-numeric."}

Scenario: Dominician Republic TaxId less than 9 digit
* req.params.Payload.CreditorAgent.Bic = "BPDODOSXXXX"
* req.params.Payload.InstructedAmount.Currency = "DOP"
* req.params.Payload.CreditorAccount.Iban = "DO22ACAU00000000000123456789"
* req.params.Payload.CreditorAccount.TaxId = "11223344"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 9-numeric."}

