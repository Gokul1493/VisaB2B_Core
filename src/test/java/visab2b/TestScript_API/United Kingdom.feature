Feature: United Kingdom Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "UnitedKingdomAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


 
Scenario: United Kingdom Positive flow with account number(Clearind ID mandatory)
* req.params.Payload.CreditorAgent.Bic = "BARCGB21"
* req.params.Payload.InstructedAmount.Currency = "GBP"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = "SC234567"
* def getReferenceNumber = jutil.GetData('GetAuditsUnitedKingdomAPIpostive')
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
* match response contains {}

 
Scenario: United Kingdom Positive flow with Iban(Clearing member ID is optional)
* req.params.Payload.CreditorAgent.Bic = "BARCGB21"
* req.params.Payload.InstructedAmount.Currency = "GBP"
* req.params.Payload.CreditorAccount.Iban = "GB29NWBK60161331926819"
* def getReferenceNumber = jutil.GetData('GetAuditsUnitedKingdomAPIpostive')
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
* match response contains {}

 
Scenario: United Kingdom Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "GBP"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = "234567"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

 
Scenario: United Kingdom Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "GBP"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

 
Scenario: United Kingdom Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "BCCBAOLUXXX"
* req.params.Payload.InstructedAmount.Currency = "GBP"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.CreditorAccount.Iban = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor account number/IBAN is missing."}

 
Scenario: United Kingdom AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "BARCGB21"
* req.params.Payload.InstructedAmount.Currency = "GBP"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.CreditorAccount.Iban = ""
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor account number/IBAN is missing."}

 
Scenario: United Kingdom Clearing Member ID as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "GBP"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

 
Scenario: United Kingdom Clearing Member ID Less than 6 digit
* req.params.Payload.CreditorAgent.Bic = "BARCGB21"
* req.params.Payload.InstructedAmount.Currency = "GBP"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = "SC12356"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must be 6 numeric digit."}

 
Scenario: United Kingdom Clearing Member ID Greater than 6 digit
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "GBP"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = "SC1234565"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must be 6 numeric digit."}

 
#newly added flow mar11/2024- Without BIC but with proper clearning member id 
Scenario: Without BIC but with proper clearning member id 
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "GBP"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = "SC123456"
* def getReferenceNumber = jutil.GetData('GetAuditsUnitedKingdomAPIpostive')
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
* match response contains {}


Scenario: Without BIC and Clearing member id
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "GBP"
* req.params.Payload.CreditorAccount.AccountNumber = "04400006729503010102"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error.message == "Creditor agent BIC/ClearingMemberID is missing."


























