Feature: Vietnam Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "VietnamAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential
   
Scenario: Vietnam Positive flow
* req.params.Payload.CreditorAgent.Bic = "ABOCVNVXXXX"
* req.params.Payload.InstructedAmount.Currency = "VND"
* req.params.Payload.CreditorAccount.AccountNumber = "232243546575638476867869"
* req.params.Payload.CreditorAgent.BranchName = "Vietcombank"
    * req.params.Payload.PaymentPurpose = "Payment as Agreed"
    * jUtil.SetData("GetAuditsVietnamAPIpostive",ref)
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
 
  Scenario: Vietnam Positive flow FOR OTHER CURRENCY(USD)
    * req.params.Payload.CreditorAgent.Bic = "ABOCVNVXXXX"
    * req.params.Payload.InstructedAmount.Currency = "USD"
    * req.params.Payload.CreditorAccount.AccountNumber = "232243546575638476867869"
    * req.params.Payload.CreditorAgent.BranchName = ""
    * jUtil.SetData("GetAuditsVietnamAPIothercurrency",ref)
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

  Scenario: Vietnam Bic as Invalid
    * req.params.Payload.CreditorAgent.Bic = "VIETNAM"
    * req.params.Payload.InstructedAmount.Currency = "VND"
    * req.params.Payload.CreditorAccount.AccountNumber = "232243546575638476867869"
    * req.params.Payload.CreditorAgent.BranchName = "Vietcombank"
    * def value = signsreq(req,user)
    * request value
    * method post
    * status 200
    * match response.error.message == "Creditor BIC invalid."

  Scenario: Vietnam Bic as Empty
    * req.params.Payload.CreditorAgent.Bic = ""
    * req.params.Payload.InstructedAmount.Currency = "VND"
    * req.params.Payload.CreditorAccount.AccountNumber = "232243546575638476867869"
    * req.params.Payload.CreditorAgent.BranchName = "Vietcombank"
    * def value = signsreq(req,user)
    * request value
    * method post
    * status 200
    * match response.error.message == "Creditor agent BIC/ClearingMemberID is missing."

  Scenario: Vietnam Account number as empty
    * req.params.Payload.CreditorAgent.Bic = "ABOCVNVXXXX"
    * req.params.Payload.InstructedAmount.Currency = "VND"
    * req.params.Payload.CreditorAccount.AccountNumber = ""
    * req.params.Payload.CreditorAgent.BranchName = "Vietcombank"
    * def value = signsreq(req,user)
    * request value
    * method post
    * status 200
    * match response.error.message == "Parameter 'CreditorAccountNumber' cannot be null."

  Scenario: Vietnam BranchName as empty
    * req.params.Payload.CreditorAgent.Bic = "ABOCVNVXXXX"
    * req.params.Payload.InstructedAmount.Currency = "VND"
    * req.params.Payload.CreditorAccount.AccountNumber = "232243546575638476867869"
    * req.params.Payload.CreditorAgent.BranchName = ""
    * def value = signsreq(req,user)
    * request value
    * method post
    * status 200
    * match response.error.message == "Parameter 'CreditorAgentBranchName' cannot be null."

  Scenario: Vietnam purpose of payment as empty
    * req.params.Payload.CreditorAgent.Bic = "ABOCVNVXXXX"
    * req.params.Payload.InstructedAmount.Currency = "VND"
    * req.params.Payload.CreditorAccount.AccountNumber = "232243546575638476867869"
    * req.params.Payload.CreditorAgent.BranchName = "Vietcombank"
    * req.params.Payload.PaymentPurpose = ""
    * def value = signsreq(req,user)
    * request value
    * method post
    * status 200
    * match response.error.message == "Parameter 'PaymentPurpose' cannot be null."
    
    Scenario: Vietnam Bic MORE THAN 11 DIGITS
    * req.params.Payload.CreditorAgent.Bic = "ABOCVNVXXXXXX"
    * req.params.Payload.InstructedAmount.Currency = "VND"
    * req.params.Payload.CreditorAccount.AccountNumber = "232243546575638476867869"
    * req.params.Payload.CreditorAgent.BranchName = "Vietcombank"
    * def value = signsreq(req,user)
    * request value
    * method post
    * status 200
    * match response.error.message == "Creditor BIC invalid."
    
    Scenario: Vietnam Bic Less than 8 digits
    * req.params.Payload.CreditorAgent.Bic = "ABOCVNV"
    * req.params.Payload.InstructedAmount.Currency = "VND"
    * req.params.Payload.CreditorAccount.AccountNumber = "232243546575638476867869"
    * req.params.Payload.CreditorAgent.BranchName = "Vietcombank"
    * def value = signsreq(req,user)
    * request value
    * method post
    * status 200
    * match response.error.message == "Creditor BIC invalid."
