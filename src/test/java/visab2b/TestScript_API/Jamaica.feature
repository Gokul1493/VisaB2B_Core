Feature: Jamaica Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "JamaicaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: Jamaica Positive flow with 5 - digit - taxid
* req.params.Payload.CreditorAgent.Bic = "JNCBJMKXXXX"
* req.params.Payload.InstructedAmount.Currency = "JMD"
* req.params.Payload.CreditorAccount.AccountNumber = "7780000000235698741"
* req.params.Payload.CreditorAccount.TaxId = "11223"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
    * req.params.Payload.CreditorAgent.BranchId = "12345"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsJamaicaAPIpostive",ref)
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


Scenario: Jamaica Positive flow with 5 - digit - taxid cross border currency
* req.params.Payload.CreditorAgent.Bic = "JNCBJMKXXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "7780000000235698741"
* req.params.Payload.CreditorAccount.TaxId = "11223"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsJamaicaAPIothercurrency",ref)
* def value = signsreq(req,user) 
* request value
* method post
* status 200
* match response.result contains {transactionId:"#string"}
* def all_eid = response.result.transactionId
* print all_eid

* def sleep = function(millis){ java.lang.Thread.sleep(millis) }
* eval sleep(10000)

 ##Approve Transaction
* def user = testData.Visa_API_CK
* approve.params.Api.Credential = user.Credential
* path 'api'
* approve.params.Payload.transactionIds[0] = all_eid
* def value = signsreq(approve,user)
* request value
* method post
* status 200
* match response.result contains {message:"1 of 1 Transactions approved successfully"}

Scenario: Jamaica Positive flow with 5 - digit - taxid without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "JNCBJMKXXXX"
* req.params.Payload.InstructedAmount.Currency = "JMD"
* req.params.Payload.CreditorAccount.AccountNumber = "7780000000235698741"
* req.params.Payload.CreditorAccount.TaxId = "11223"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* req.params.Payload.CreditorAgent.BranchID = "12345"
* jUtil.SetData("GetAuditsJamaicaAPIpostivewithoutEID",ref)
* def value = signsreq(req,user) 
* request value
* method post
* status 200
* match response.result contains {transactionId:"#string"}
* def all_eid = response.result.transactionId
* print all_eid

* def sleep = function(millis){ java.lang.Thread.sleep(millis) }
* eval sleep(10000)

 ##Approve Transaction
* def user = testData.Visa_API_CK
* approve.params.Api.Credential = user.Credential
* path 'api'
* approve.params.Payload.transactionIds[0] = all_eid
* def value = signsreq(approve,user)
* request value
* method post
* status 200
* match response.result contains {message:"1 of 1 Transactions approved successfully"}


Scenario: Jamaica Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "JMD"
* req.params.Payload.CreditorAccount.AccountNumber = "7780000000235698741"
* req.params.Payload.CreditorAccount.TaxId = "11223"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAccount.BranchId = '56789'
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Jamaica Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "JMD"
* req.params.Payload.CreditorAccount.AccountNumber = "7780000000235698741"
* req.params.Payload.CreditorAccount.TaxId = "11223"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAccount.BranchId = '56789'
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
    * match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Jamaica Bic as less than 8 char
* req.params.Payload.CreditorAgent.Bic = "JNCBJ"
* req.params.Payload.InstructedAmount.Currency = "JMD"
* req.params.Payload.CreditorAccount.AccountNumber = "7780000000235698741"
* req.params.Payload.CreditorAccount.TaxId = "11223"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAccount.BranchId = '56789'
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Jamaica Bic as more than 11 char
* req.params.Payload.CreditorAgent.Bic = "JNCBJMKXXXXSSSSSSSSS"
* req.params.Payload.InstructedAmount.Currency = "JMD"
* req.params.Payload.CreditorAccount.AccountNumber = "7780000000235698741"
* req.params.Payload.CreditorAccount.TaxId = "11223"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAccount.BranchId = '56789'
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Jamaica AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "JNCBJMKXXXX"
* req.params.Payload.InstructedAmount.Currency = "JMD"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.CreditorAccount.TaxId = "11223"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAccount.BranchId = '56789'
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

Scenario: Jamaica purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "JNCBJMKXXXX"
* req.params.Payload.InstructedAmount.Currency = "JMD"
* req.params.Payload.CreditorAccount.AccountNumber = "7780000000235698741"
* req.params.Payload.CreditorAccount.TaxId = "11223"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = ""
* req.params.Payload.CreditorAccount.BranchId = '56789'
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

Scenario: Jamaica TaxId as Empty
* req.params.Payload.CreditorAgent.Bic = "JNCBJMKXXXX"
* req.params.Payload.InstructedAmount.Currency = "JMD"
* req.params.Payload.CreditorAccount.AccountNumber = "7780000000235698741"
* req.params.Payload.CreditorAccount.TaxId = ""
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAccount.BranchId = '56789'
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"CreditorAgentBranchID must be min 3 and max 5 characters"}

Scenario: Jamaica TaxId greater than 5 digit
* req.params.Payload.CreditorAgent.Bic = "JNCBJMKXXXX"
* req.params.Payload.InstructedAmount.Currency = "JMD"
* req.params.Payload.CreditorAccount.AccountNumber = "7780000000235698741"
* req.params.Payload.CreditorAccount.TaxId = "112233"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAccount.BranchId = '56789'
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"CreditorAgentBranchID must be min 3 and max 5 characters"}

Scenario: Jamaica TaxId less than 5 digit
* req.params.Payload.CreditorAgent.Bic = "JNCBJMKXXXX"
* req.params.Payload.InstructedAmount.Currency = "JMD"
* req.params.Payload.CreditorAccount.AccountNumber = "7780000000235698741"
* req.params.Payload.CreditorAccount.TaxId = "1122"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAccount.BranchId = '56789'
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"CreditorAgentBranchID must be min 3 and max 5 characters"}

