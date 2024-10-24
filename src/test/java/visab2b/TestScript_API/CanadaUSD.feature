Feature: CanadaUSD Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "CanadaUSD"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: CanadaUSD Positive flow with 9-digit Canada Clearing Code (Optional)
* req.params.Payload.CreditorAgent.Bic = "ACFXCAW1XXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "68539007547034666"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = "CC654120101"
* jUtil.SetData("GetAuditsCanadaUSDAPIpostive",ref)
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
* jUtil.SetData("GetAuditsCanadaUSDAPIothercurrency",ref)
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

Scenario: CanadaUSD Positive flow without 9-digit Canada Clearing Code (Optional)
* req.params.Payload.CreditorAgent.Bic = "ACFXCAW1XXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "68539007547034666"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* jUtil.SetData("GetAuditsCanadaUSDAPIpostivewithout9digitclearingcode",ref)
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

Scenario: CanadaUSD Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "68539007547034666"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: CanadaUSD Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "68539007547034666"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: CanadaUSD AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "ACFXCAW1XXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

Scenario: CanadaUSD Positive flow with greater than 9-digit Canada Clearing Code (Optional)
* req.params.Payload.CreditorAgent.Bic = "ACFXCAW1XXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "68539007547034666"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = "2541214521"
* def value = signsreq(req,user) 
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must start with 2 Alpha."}


Scenario: CanadaUSD Positive flow with lesser than 9-digit Canada Clearing Code (Optional)
* req.params.Payload.CreditorAgent.Bic = "ACFXCAW1XXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "68539007547034666"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = "CC78458"
* def value = signsreq(req,user) 
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must be starts with FW or CC and followed by 9 numeric digit."}


#newly added flow mar11/2024- Without BIC but with proper clearning member id 
Scenario: CanadaUSD Positive flow with greater than 9-digit Canada Clearing Code (Optional)
* req.params.Payload.CreditorAgent.Bic = "ACFXCAW1XXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "68539007547034666"
* req.params.Payload.CreditorAgent.ClearingMemberId = "FW12345678954"
* def value = signsreq(req,user) 
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must be starts with FW or CC and followed by 9 numeric digit."}
