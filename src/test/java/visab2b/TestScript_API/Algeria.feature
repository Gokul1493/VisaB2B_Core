Feature: Algeria Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "AlgeriaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Api.Credential = testData.Visa_API_MK.Credential
* req.params.Payload.CreditorAgent.ClearingMemberId = ""

 
Scenario: Algeria Positive flow
* def user = testData.Visa_API_MK
* req.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
* req.params.Payload.InstructedAmount.Currency = "DZD"
* req.params.Payload.CreditorAccount.AccountNumber = "DZ580002100001113000"
* req.params.Payload.CreditorAccount.ContactName = "Jeo Smith"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* jUtil.SetData("GetAuditsAlgeriaAPIIpostive",ref)
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
* path 'api'
* approve.params.Api.Credential = user.Credential
* approve.params.Payload.transactionIds[0] = all_eid
* def value = signsreq(approve,user)
* request value
* method post	
* status 200
* match response.result contains {message:"1 of 1 Transactions approved successfully"}

  
# Initiate transaction with different currency
Scenario: Algeria Positive flow with Other currency(EUR)
* def user = testData.Visa_API_MK
* req.params.Payload.InstructedAmount.Currency ="EUR"
* req.params.Payload.CreditorAccount.AccountNumber="566542454222"
* jUtil.SetData("GetAuditsAlgeriaAPIothercurrency",ref)
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
* path 'api'
* approve.params.Api.Credential = user.Credential
* approve.params.Payload.transactionIds[0] = all_eid
* def value = signsreq(approve,user)
* request value
* method post
* status 200
* match response.result contains {message:"1 of 1 Transactions approved successfully"}

   
Scenario: Algeria Bic as Invalid
* def user = testData.Visa_API_MK
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "DZD"
* req.params.Payload.CreditorAccount.AccountNumber = "DZ580002100001113000"
* req.params.Payload.CreditorAccount.ContactName = "Jeo Smith"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

   
Scenario: Algeria Bic as Empty
* def user = testData.Visa_API_MK
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "DZD"
* req.params.Payload.CreditorAccount.AccountNumber = "DZ580002100001113000"
* req.params.Payload.CreditorAccount.ContactName = "Jeo Smith"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

   
Scenario: Algeria AccountNumber as Empty
* def user = testData.Visa_API_MK
* req.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
* req.params.Payload.InstructedAmount.Currency = "DZD"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.CreditorAccount.ContactName = "Jeo Smith"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

   
Scenario: Algeria purpose as Empty
* def user = testData.Visa_API_MK
* req.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
* req.params.Payload.InstructedAmount.Currency = "DZD"
* req.params.Payload.CreditorAccount.AccountNumber = "DZ580002100001113000"
* req.params.Payload.CreditorAccount.ContactName = "Jeo Smith"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

   
Scenario: Algeria Contactname as Empty
* def user = testData.Visa_API_MK
* req.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
* req.params.Payload.InstructedAmount.Currency = "DZD"
* req.params.Payload.CreditorAccount.AccountNumber = "DZ580002100001113000"
* req.params.Payload.CreditorAccount.ContactName = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorContactName' cannot be null."}

   
Scenario: Algeria Phonenumber as Empty
* def user = testData.Visa_API_MK
* req.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
* req.params.Payload.InstructedAmount.Currency = "DZD"
* req.params.Payload.CreditorAccount.AccountNumber = "DZ580002100001113000"
* req.params.Payload.CreditorAccount.ContactName = "Jeo Smith"
* req.params.Payload.CreditorAccount.PhoneNumber = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorContactPhoneNumber' cannot be null."}

   
Scenario: Algeria Phonenumber as Invalid Format - Without country code(8099087766)
* def user = testData.Visa_API_MK
* req.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
* req.params.Payload.InstructedAmount.Currency = "DZD"
* req.params.Payload.CreditorAccount.AccountNumber = "DZ580002100001113000"
* req.params.Payload.CreditorAccount.ContactName = "Jeo Smith"
* req.params.Payload.CreditorAccount.PhoneNumber = "8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Contact Phone Number must be starts with + and followed by dialing code,- and numeric digits."}

  
Scenario: Algeria Account number greater than 20 length
* def user = testData.Visa_API_MK
* req.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
* req.params.Payload.InstructedAmount.Currency = "DZD"
* req.params.Payload.CreditorAccount.AccountNumber = "DZ5800021000011130001"
* req.params.Payload.CreditorAccount.ContactName = "Jeo Smith"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor AccountNumber must be 20-alphanumeric."}

  
Scenario: Algeria Account number Less than 20 length
* def user = testData.Visa_API_MK
* req.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
* req.params.Payload.InstructedAmount.Currency = "DZD"
* req.params.Payload.CreditorAccount.AccountNumber = "DZ5800021000011"
* req.params.Payload.CreditorAccount.ContactName = "Jeo Smith"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor AccountNumber must be 20-alphanumeric."}

