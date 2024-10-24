Feature: Azerbaijan Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "AzerbaijanAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "AZ234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: Azerbaijan Positive flow 
* req.params.Payload.CreditorAgent.Bic = "IBAZAZ2XXXX" 
* req.params.Payload.InstructedAmount.Currency = "AZN"
* req.params.Payload.CreditorAccount.Iban = "AZ77VTBA00000000001234567890"
* req.params.Payload.CreditorAccount.TaxId = "1122334455"
* req.params.Payload.CreditorAgent.ClearingMemberId = "123456"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001944"
* req.params.Payload.CreditorAgentTaxID = "1236125879"
* jUtil.SetData("GetAuditsAzerbaijanAPIpostive",ref)
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

# Initiate transaction with different currency
Scenario: Albania Positive flow with Other currency(EUR)
* req.params.Payload.InstructedAmount.Currency ="EUR"
* req.params.Payload.CreditorAccount.AccountNumber="566542222"
* req.params.Payload.CreditorAccount.Iban=""
* req.params.Payload.PaymentPurpose=""
* jUtil.SetData("GetAuditsAzerbaijanAPIothercurrency",ref)
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

Scenario: Azerbaijan Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "AZN"
* req.params.Payload.CreditorAccount.Iban = "AZ77VTBA00000000001234567890"
* req.params.Payload.CreditorAccount.TaxId = "1122334455"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAgent.ClearingMemberId = "123456"
* req.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001944"
* req.params.Payload.CreditorAgentTaxID = "1236125879"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: Azerbaijan Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "AZN"
* req.params.Payload.CreditorAccount.Iban = "AZ77VTBA00000000001234567890"
* req.params.Payload.CreditorAccount.TaxId = "1122334455"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAgent.ClearingMemberId = "123456"
* req.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001944"
* req.params.Payload.CreditorAgentTaxID = "1236125879"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must start with 2 Alpha."}

Scenario: Azerbaijan Iban as Empty
* req.params.Payload.CreditorAgent.Bic = "IBAZAZ2XXXX"
* req.params.Payload.InstructedAmount.Currency = "AZN"
* req.params.Payload.CreditorAccount.Iban = ""
* req.params.Payload.CreditorAccount.TaxId = "1122334455"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAgent.ClearingMemberId = "123456"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001944"
* req.params.Payload.CreditorAgentTaxID = "1236125879"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorIBAN' cannot be null."}

Scenario: Azerbaijan PaymentPurpose as Empty
* req.params.Payload.CreditorAgent.Bic = "IBAZAZ2XXXX"
* req.params.Payload.InstructedAmount.Currency = "AZN"
* req.params.Payload.CreditorAccount.Iban = "AZ77VTBA00000000001234567890"
* req.params.Payload.CreditorAccount.TaxId = "1122334455"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAgent.ClearingMemberId = "123456"
* req.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001944"
* req.params.Payload.CreditorAgentTaxID = "1236125879"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

Scenario: Azerbaijan TaxId as Empty
* req.params.Payload.CreditorAgent.Bic = "IBAZAZ2XXXX"
* req.params.Payload.InstructedAmount.Currency = "AZN"
* req.params.Payload.CreditorAccount.Iban = "AZ77VTBA00000000001234567890"
* req.params.Payload.CreditorAccount.TaxId = ""
* req.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001944"
* req.params.Payload.CreditorAgent.ClearingMemberId = "123456"
* req.params.Payload.CreditorAgentTaxID = "1236125879"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorTaxID' cannot be null."}

Scenario: Azerbaijan TaxId greater than 10 digit
* req.params.Payload.CreditorAgent.Bic = "IBAZAZ2XXXX"
* req.params.Payload.InstructedAmount.Currency = "AZN"
* req.params.Payload.CreditorAccount.Iban = "AZ77VTBA00000000001234567890"
* req.params.Payload.CreditorAccount.TaxId = "112233445589"
* req.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001944"
* req.params.Payload.CreditorAgent.ClearingMemberId = "123456"
* req.params.Payload.CreditorAgentTaxID = "1236125879"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 10-numeric."}

Scenario: Azerbaijan TaxId less than 10 digit
* req.params.Payload.CreditorAgent.Bic = "IBAZAZ2XXXX"
* req.params.Payload.InstructedAmount.Currency = "AZN"
* req.params.Payload.CreditorAccount.Iban = "AZ77VTBA00000000001234567890"
* req.params.Payload.CreditorAccount.TaxId = "112233445"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001944"
* req.params.Payload.CreditorAgentTaxID = "1236125879"
* req.params.Payload.CreditorAgent.ClearingMemberId = "123456"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor TaxId must be 10-numeric."}



Scenario: Azerbaijan IBAN greater than 28 length
* req.params.Payload.CreditorAgent.Bic = "IBAZAZ2XXXX"
* req.params.Payload.InstructedAmount.Currency = "AZN"
* req.params.Payload.CreditorAccount.Iban = "AZ77VTBA000000000012345678901"
* req.params.Payload.CreditorAccount.TaxId = "1122334455"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = "123456"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Iban Number must be 28-Characters."}

Scenario: Azerbaijan IBAN Less than 28 length
* req.params.Payload.CreditorAgent.Bic = "IBAZAZ2XXXX"
* req.params.Payload.InstructedAmount.Currency = "AZN"
* req.params.Payload.CreditorAccount.Iban = "AZ77VTBA0000000000123456789"
* req.params.Payload.CreditorAccount.TaxId = "1122334455"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001944"
* req.params.Payload.CreditorAgentTaxID = "1236125879"
* req.params.Payload.CreditorAgent.ClearingMemberId = "123456"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Iban Number must be 28-Characters."}


Scenario: Azerbaijan Clearing Member ID as Empty
* req.params.Payload.CreditorAgent.Bic = "IBAZAZ2XXXX"
* req.params.Payload.InstructedAmount.Currency = "AZN"
* req.params.Payload.CreditorAccount.Iban = "AZ77VTBA00000000001234567890"
* req.params.Payload.CreditorAccount.TaxId = "1122334455"
* req.params.Payload.CreditorAgent.ClearingMemberId = "    "
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001944"
* req.params.Payload.CreditorAgentTaxID = "1236125879"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"CreditorAgentClearingMemberID' cannot be null."}

Scenario: Azerbaijan Clearing Member ID Less than 6 digit
* req.params.Payload.CreditorAgent.Bic = "IBAZAZ2XXXX"
* req.params.Payload.InstructedAmount.Currency = "AZN"
* req.params.Payload.CreditorAccount.Iban = "AZ77VTBA00000000001234567890"
* req.params.Payload.CreditorAgent.ClearingMemberId = "23456"
* req.params.Payload.CreditorAccount.TaxId = "1122334455"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must be 6 numeric digit."}

Scenario: Azerbaijan Clearing Member ID Greater than 6 digit
* req.params.Payload.CreditorAgent.Bic = "IBAZAZ2XXXX"
* req.params.Payload.InstructedAmount.Currency = "AZN"
* req.params.Payload.CreditorAccount.Iban = "AZ77VTBA00000000001234567890"
* req.params.Payload.CreditorAgent.ClearingMemberId = "2345673"
* req.params.Payload.CreditorAccount.TaxId = "1122334455"
* req.params.Payload.PaymentPurpose = "Payment as Agreed"
* req.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001944"
* req.params.Payload.CreditorAgentTaxID = "1236125879"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must be 6 numeric digit."}