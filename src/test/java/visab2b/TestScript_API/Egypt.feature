Feature: Egypt Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "EgyptAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Egypt Positive flow 
* req.params.Payload.CreditorAgent.Bic = "CBEGEGCXXXX"
* req.params.Payload.InstructedAmount.Currency = "EGP"
* req.params.Payload.CreditorAccount.Iban = "EG800002000156789012345180002"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* jUtil.SetData("GetAuditsEgyptAPIpostive",ref)
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

Scenario: Egypt Positive flow  with other currency  code
* req.params.Payload.CreditorAgent.Bic = "CBEGEGCXXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "1009007500000235698741"
* jUtil.SetData("GetAuditsEgyptAPIothercurrency",ref)
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


Scenario: Egypt Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "EGP"
* req.params.Payload.CreditorAccount.Iban = "EG800002000156789012345180002"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Egypt Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "EGP"
* req.params.Payload.CreditorAccount.Iban = "EG800002000156789012345180002"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "VO23456"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Egypt Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "CBEGEGCXXXX"
* req.params.Payload.InstructedAmount.Currency = "EGP"
* req.params.Payload.CreditorAccount.Iban = ""
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "VO23456"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

Scenario: Egypt purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "CBEGEGCXXXX"
* req.params.Payload.InstructedAmount.Currency = "EGP"
* req.params.Payload.CreditorAccount.Iban = "EG800002000156789012345180002"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

Scenario: Egypt BranchName as Empty
* req.params.Payload.CreditorAgent.Bic = "CBEGEGCXXXX"
* req.params.Payload.InstructedAmount.Currency = "EGP"
* req.params.Payload.CreditorAccount.Iban = "EG800002000156789012345180002"
* req.params.Payload.CreditorAgent.BranchName = ""
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "VO23456"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAgentBranchName' cannot be null."}



Scenario: Egypt ContactPhonenumber as Empty
* req.params.Payload.CreditorAgent.Bic = "CBEGEGCXXXX"
* req.params.Payload.InstructedAmount.Currency = "EGP"
* req.params.Payload.CreditorAccount.Iban = "EG800002000156789012345180002"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.PhoneNumber = ""
* req.params.Payload.PaymentPurpose = "VO23456"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorContactPhoneNumber' cannot be null."}

Scenario: Egypt ContactPhonenumber as Invalid Format - Without country code(8099087766)
* req.params.Payload.CreditorAgent.Bic = "CBEGEGCXXXX"
* req.params.Payload.InstructedAmount.Currency = "EGP"
* req.params.Payload.CreditorAccount.Iban = "EG800002000156789012345180002"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "8099087766"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Contact Phone Number must be starts with + and followed by dialing code,- and numeric digits."}



