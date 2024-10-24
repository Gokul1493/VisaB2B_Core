Feature: Morocco Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "MoroccoAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential


Scenario: Morocco Positive flow
* req.params.Payload.CreditorAgent.Bic = "BCPOMAMCXXX"
* req.params.Payload.InstructedAmount.Currency = "MAD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsMoroccoAPIpostive')
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

Scenario: Morocco Positive flow with cross birder currency
* req.params.Payload.CreditorAgent.Bic = "BCPOMAMCXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsMoroccoAPIothercurrency')
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

Scenario: Morocco Positive flow without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "BCPOMAMCXXX"
* req.params.Payload.InstructedAmount.Currency = "MAD"
* req.params.Payload.CreditorAccount.AccountNumber = "324234634745856797892222"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* def getReferenceNumber = jutil.GetData('GetAuditsMoroccoAPIpostive')
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


Scenario: Morocco Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "MAD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Morocco Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "MAD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: Morocco Bic as less than 8 char
* req.params.Payload.CreditorAgent.Bic = "BCPOM"
* req.params.Payload.InstructedAmount.Currency = "MAD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Morocco Bic as more than 11 char
* req.params.Payload.CreditorAgent.Bic = "BCPOMAMCXXXXXXXXXXXX"
* req.params.Payload.InstructedAmount.Currency = "MAD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679789"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Morocco AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "BCPOMAMCXXX"
* req.params.Payload.InstructedAmount.Currency = "MAD"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}


Scenario: Morocco AccountNumber Greater than 24 digit
* req.params.Payload.CreditorAgent.Bic = "BCPOMAMCXXX"
* req.params.Payload.InstructedAmount.Currency = "MAD"
* req.params.Payload.CreditorAccount.AccountNumber = "324234634745856797895666666"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor AccountNumber must be 24-numeric."}


Scenario: Morocco AccountNumber less than 24 digit
* req.params.Payload.CreditorAgent.Bic = "BCPOMAMCXXX"
* req.params.Payload.InstructedAmount.Currency = "MAD"
* req.params.Payload.CreditorAccount.AccountNumber = "32423463474585679"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor AccountNumber must be 24-numeric."}

