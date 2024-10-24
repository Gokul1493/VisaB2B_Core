Feature: Uruguay Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: Uruguay Positive flow with 12 digit Taxid
* req.params.Payload.CreditorAgent.Bic = "BROUUYMMXXX"
* req.params.Payload.InstructedAmount.Currency = "UYU"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "VO1235 Payment as Agreed"
* req.params.Payload.CreditorAccount.TaxId = "112233445566"
* jUtil.SetData("GetAuditsUruguayAPIpostive",ref)
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
* print response

Scenario: Uruguay Positive flow with more than 12 digit Taxid
* req.params.Payload.CreditorAgent.Bic = "BROUUYMMXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAccount.TaxId = "112233445566566"
* jUtil.SetData("GetAuditsUruguayAPIothercurrency",ref)
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
* print response




Scenario: Uruguay Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "UYU"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "112233445566"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Uruguay Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "UYU"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "112233445566"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Uruguay AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "BROUUYMMXXX"
* req.params.Payload.InstructedAmount.Currency = "UYU"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "112233445566"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

Scenario: Uruguay purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "BROUUYMMXXX"
* req.params.Payload.InstructedAmount.Currency = "UYU"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "112233445566"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

Scenario: Uruguay BranchName as Empty
* req.params.Payload.CreditorAgent.Bic = "BROUUYMMXXX"
* req.params.Payload.InstructedAmount.Currency = "UYU"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = ""
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = "112233445566"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAgentBranchName' cannot be null."}

Scenario: Uruguay TaxId as Empty
* req.params.Payload.CreditorAgent.Bic = "BROUUYMMXXX"
* req.params.Payload.InstructedAmount.Currency = "UYU"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAccount.TaxId = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorTaxID' cannot be null."}


Scenario: Uruguay TaxId greater than 12 digit
* req.params.Payload.CreditorAgent.Bic = "BROUUYMMXXX"
* req.params.Payload.InstructedAmount.Currency = "UYU"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAccount.TaxId = "1122334455665"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 12-numeric."}

Scenario: Uruguay TaxId less than 12 digit
* req.params.Payload.CreditorAgent.Bic = "BROUUYMMXXX"
* req.params.Payload.InstructedAmount.Currency = "UYU"
* req.params.Payload.CreditorAccount.AccountNumber = "4325435465"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAgent.BranchName = "Downtown Branch"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 12-numeric."}
