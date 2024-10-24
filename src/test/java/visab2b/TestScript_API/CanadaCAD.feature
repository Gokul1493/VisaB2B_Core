Feature: CanadaCAD Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "CanadaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: CanadaCAD Positive flow
* req.params.Payload.CreditorAgent.Bic = "FMCCCATMGMA"
* req.params.Payload.InstructedAmount.Currency = "CAD"
* req.params.Payload.CreditorAccount.AccountNumber = "68539007547034666"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* jUtil.SetData("GetAuditsCanadaAPIpostive",ref)
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
Scenario: Albania Positive flow with Other currency(BHD)
* req.params.Payload.InstructedAmount.Currency ="BHD"
* req.params.Payload.CreditorAccount.AccountNumber="566542222"
* jUtil.SetData("GetAuditsCanadaAPIothercurrency",ref)
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

 
Scenario: CanadaCAD Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "CAD"
* req.params.Payload.CreditorAccount.AccountNumber = "68539007547034666"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

 
Scenario: CanadaCAD Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "CAD"
* req.params.Payload.CreditorAccount.AccountNumber = "68539007547034666"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

 
Scenario: CanadaCAD AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "ACFXCAW1XXX"
* req.params.Payload.InstructedAmount.Currency = "CAD"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

 
Scenario: CanadaCAD Bic as empty and Clearing Member ID as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "CAD"
* req.params.Payload.CreditorAccount.AccountNumber = "68539007547034666"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""

* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

 
Scenario: CanadaCAD Clearing Member ID Less than 9 digit
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "CAD"
* req.params.Payload.CreditorAccount.AccountNumber = "68539007547034666"
* req.params.Payload.CreditorAgent.ClearingMemberId = "CC345678"

* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must be starts with CC and followed by 9 numeric digit."}

 
Scenario: CanadaCAD Clearing Member ID Greater than 9 digit
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "CAD"
* req.params.Payload.CreditorAccount.AccountNumber = "68539007547034666"
* req.params.Payload.CreditorAgent.ClearingMemberId = "CC34567890"

* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must be starts with CC and followed by 9 numeric digit."}


#newly added flow mar11/2024- Without BIC but with proper clearning member id 
Scenario: Without BIC but with proper clearning member id 
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "CAD"
* req.params.Payload.CreditorAccount.AccountNumber = "68539007547034666"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = "CC123456789"
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


 












