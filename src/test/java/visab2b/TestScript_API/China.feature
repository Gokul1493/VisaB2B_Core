Feature: China Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "ChinaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: China Positive flow 
* req.params.Payload.CreditorAgent.Bic = "ICBKCNBJBJM"
* req.params.Payload.InstructedAmount.Currency = "CNY"
* req.params.Payload.CreditorAccount.AccountNumber = "50122200000017"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.ContactName = "Jeo Smith"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsChinaAPIpostive",ref)
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
Scenario: Albania Positive flow with Other currency(USD)
* req.params.Payload.InstructedAmount.Currency ="USD"
* req.params.Payload.CreditorAccount.AccountNumber="566542222"
* jUtil.SetData("GetAuditsChinaAPIothercurrency",ref)
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

 
Scenario: China Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "CNY"
* req.params.Payload.CreditorAccount.AccountNumber = "50122200000017"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAccount.ContactName = "Joe Smith"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}
 
Scenario: China Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "CNY"
* req.params.Payload.CreditorAccount.AccountNumber = "50122200000017"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.ContactName = "Joe Smith"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

 
Scenario: China AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "FNROCNBQXXX"
* req.params.Payload.InstructedAmount.Currency = "CNY"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.ContactName = "Joe Smith"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}


Scenario: China purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "FNROCNBQXXX"
* req.params.Payload.InstructedAmount.Currency = "CNY"
* req.params.Payload.CreditorAccount.AccountNumber = "50122200000017"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.ContactName = "Joe Smith"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}
 
 
Scenario: China ContactName as Empty
* req.params.Payload.CreditorAgent.Bic = "FNROCNBQXXX"
* req.params.Payload.InstructedAmount.Currency = "CNY"
* req.params.Payload.CreditorAccount.AccountNumber = "50122200000017"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.ContactName = ""
* req.params.Payload.PaymentPurpose = "CCTFDR"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorContactName' cannot be null."}

 
Scenario: China ContactPhonenumber as Empty
* req.params.Payload.CreditorAgent.Bic = "FNROCNBQXXX"
* req.params.Payload.InstructedAmount.Currency = "CNY"
* req.params.Payload.CreditorAccount.AccountNumber = "50122200000017"
* req.params.Payload.CreditorAccount.ContactName = "Jeo Smith"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorContactPhoneNumber' cannot be null."}
 
Scenario: China ContactPhonenumber as Invalid Format - Without country code(8099087766)
* req.params.Payload.CreditorAgent.Bic = "FNROCNBQXXX"
* req.params.Payload.InstructedAmount.Currency = "CNY"
* req.params.Payload.CreditorAccount.AccountNumber = "50122200000017"
* req.params.Payload.CreditorAccount.ContactName = "Jeo Smith"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Contact Phone Number must be starts with + and followed by dialing code,- and numeric digits."}
 
Scenario: China Contactname as Empty
* req.params.Payload.CreditorAgent.Bic = "FNROCNBQXXX"
* req.params.Payload.InstructedAmount.Currency = "CNY"
* req.params.Payload.CreditorAccount.AccountNumber = "50122200000017"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.ContactName = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorContactName' cannot be null."}




