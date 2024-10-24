Feature: Argentina Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "ArgentinaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Argentina Positive flow
* req.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
* req.params.Payload.InstructedAmount.Currency = "ARS"
* req.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* jUtil.SetData("GetAuditsArgentinaAPIpostive",ref)
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


  
# Initiate transaction with different currency
Scenario: Albania Positive flow with Other currency(BHD)
* req.params.Payload.InstructedAmount.Currency ="BHD"
* req.params.Payload.CreditorAccount.AccountNumber="566542222"
* req.params.Payload.CreditorAccount.Iban=""
* req.params.Payload.PaymentPurpose=""
* jUtil.SetData("GetAuditsArgentinaAPIothercurrency",ref)
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


  
Scenario: Argentina Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "ARS"
* req.params.Payload.CreditorAccount.AccountNumber = "9858000210000111300001"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}


  
Scenario: Argentina Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "ARS"
* req.params.Payload.CreditorAccount.AccountNumber = "9858000210000111300001"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}


  
Scenario: Argentina AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
* req.params.Payload.InstructedAmount.Currency = "ARS"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}


  
Scenario: Argentina AccountNumber as ALPHANUMERICS
* req.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
* req.params.Payload.InstructedAmount.Currency = "ARS"
* req.params.Payload.CreditorAccount.AccountNumber = "ASDER000210000111300001"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor AccountNumber must be 22-numeric."}


  
Scenario: Argentina purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
* req.params.Payload.InstructedAmount.Currency = "ARS"
* req.params.Payload.CreditorAccount.AccountNumber = "9858000210000111300001"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}


  
Scenario: Argentina TaxId as Empty
* req.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
* req.params.Payload.InstructedAmount.Currency = "ARS"
* req.params.Payload.CreditorAccount.AccountNumber = "9858000210000111300001"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorTaxID' cannot be null."}


  
Scenario: Argentina TaxId greater than 11 digit
* req.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
* req.params.Payload.InstructedAmount.Currency = "ARS"
* req.params.Payload.CreditorAccount.AccountNumber = "9858000210000111300001"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "1122334455677"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 11-numeric."}


  
Scenario: Argentina TaxId less than 11 digit
* req.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
* req.params.Payload.InstructedAmount.Currency = "ARS"
* req.params.Payload.CreditorAccount.AccountNumber = "9858000210000111300001"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "1122334455"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 11-numeric."}


  
Scenario: Argentina ContactPhonenumber as Empty
* req.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
* req.params.Payload.InstructedAmount.Currency = "ARS"
* req.params.Payload.CreditorAccount.AccountNumber = "9858000210000111300001"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorContactPhoneNumber' cannot be null."}


  
Scenario: Argentina ContactPhonenumber as Invalid Format - Without country code(8099087766)
* req.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
* req.params.Payload.InstructedAmount.Currency = "ARS"
* req.params.Payload.CreditorAccount.AccountNumber = "9858000210000111300001"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Contact Phone Number must be starts with + and followed by dialing code,- and numeric digits."}


  
Scenario: Argentina Account number greater than 22 length
* req.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
* req.params.Payload.InstructedAmount.Currency = "ARS"
* req.params.Payload.CreditorAccount.AccountNumber = "985800021000011130000100"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor AccountNumber must be 22-numeric."}

  
Scenario: Argentina Account number Less than 22 length
* req.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
* req.params.Payload.InstructedAmount.Currency = "ARS"
* req.params.Payload.CreditorAccount.AccountNumber = "985800021000011130000"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor AccountNumber must be 22-numeric."}

