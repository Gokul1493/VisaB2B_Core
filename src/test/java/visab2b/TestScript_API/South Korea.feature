Feature: South korea Transaction

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* url QaUrl
* path 'api'
* def req = read('classpath:visab2b/Payload/transaction.json')
* def approve = read('classpath:visab2b/Payload/approvetransaction.json')
* def ref = "SouthKoreaAPI"+ jUtil.PLtoken()
* req.params.Payload.EndToEndIdentification = ref
* req.params.Payload.CreditorAgent.ClearingMemberId = "BS234567"
* def user = testData.Visa_API_MK
* req.params.Api.Credential = testData.Visa_API_MK.Credential

Scenario: South korea Positive flow with BIC11
* req.params.Payload.CreditorAgent.Bic = "ABOCKRSEXXX"
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.CreditorAccount.TaxId = "112233445"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsSouthKoreaAPIpostive')
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

Scenario: South korea Positive flow with Cross border currency
* req.params.Payload.CreditorAgent.Bic = "ABOCKRSEXXX"
* req.params.Payload.InstructedAmount.Currency = "USD"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.CreditorAccount.TaxId = "112233445"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsSouthKoreaAPIothercurrency')
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

Scenario: South korea Positive flow without Enterprice ID
* req.params.Payload.CreditorAgent.Bic = "ABOCKRSEXXX"
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.CreditorAccount.TaxId = "112233445"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.DebtorAccount.EnterpriseId = ""
* req.params.Payload.DebtorAccount.AccountNumber = "9100910001"
* def getReferenceNumber = jutil.GetData('GetAuditsSouthKoreaAPIpostive')
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

Scenario: South korea Positive flow with BIC 8(Clearing Member ID Followed by KR-KR followed by 3-digit number, no spaces (e.g. //KR123))
* req.params.Payload.CreditorAgent.Bic = "ABOCKRSE"
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"

* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAgent.ClearingMemberId = "KR123"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def getReferenceNumber = jutil.GetData('GetAuditsSouthKoreaAPIpostive')
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

Scenario: South korea Bic as Invalid
* req.params.Payload.CreditorAgent.Bic = "PUPXXX"
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: South korea Bic as Empty
* req.params.Payload.CreditorAgent.Bic = ""
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor agent BIC/ClearingMemberID is missing."}

Scenario: South korea Bic as more than 11 character
* req.params.Payload.CreditorAgent.Bic = "ABOCKRSEXXXXXXXXXXXX"
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: South korea Bic as less than 8 Character
* req.params.Payload.CreditorAgent.Bic = "ABOCK"
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor BIC invalid."}

Scenario: South korea AccountNumber as Empty
* req.params.Payload.CreditorAgent.Bic = "ABOCKRSEXXX"
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = ""
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorAccountNumber' cannot be null."}

Scenario: South korea purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "ABOCKRSEXXX"
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}

Scenario: South korea TaxId as Empty
* req.params.Payload.CreditorAgent.Bic = "ABOCKRSEXXX"
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.CreditorAccount.TaxId = ""
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.result contains {status:"IN_PROCESS"}

Scenario: South korea TaxId greater than 10 digit
* req.params.Payload.CreditorAgent.Bic = "ABOCKRSEXXX"
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.result contains {status:"IN_PROCESS"}

Scenario: South korea TaxId less than 9 digit
* req.params.Payload.CreditorAgent.Bic = "ABOCKRSEXXX"
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.CreditorAccount.TaxId = "11223344"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.result contains {status:"IN_PROCESS"}

Scenario: South korea ContactPhonenumber as Empty
* req.params.Payload.CreditorAgent.Bic = "ABOCKRSEXXX"
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = ""
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'CreditorContactPhoneNumber' cannot be null."}

Scenario: South korea ContactPhonenumber as Invalid Format - Without country code(8099087766)
* req.params.Payload.CreditorAgent.Bic = "ABOCKRSEXXX"
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.CreditorAccount.TaxId = "11223344556"
* req.params.Payload.CreditorAccount.PhoneNumber = "8099087766"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Contact Phone Number must be starts with + and followed by dialing code,- and numeric digits."}



Scenario: South korea Clearing Member ID as Empty
* req.params.Payload.CreditorAgent.Bic = "ABOCKRSE"
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.CreditorAgent.ClearingMemberId = ""
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must be starts with KR and followed by 3 numeric digit."}

Scenario: South korea Clearing Member ID Less than 3 digit
* req.params.Payload.CreditorAgent.Bic = "ABOCKRSE"
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.CreditorAgent.ClearingMemberId = "KR12"

* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must be starts with KR and followed by 3 numeric digit."}

Scenario: South korea Clearing Member ID Greater than 3 digit
* req.params.Payload.CreditorAgent.Bic = "ABOCKRSE"
* req.params.Payload.InstructedAmount.Currency = "KRW"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.CreditorAgent.ClearingMemberId = "KR1234"

* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Creditor Agent Clearing MemberID must be starts with KR and followed by 3 numeric digit."}

Scenario: South korea purpose as Empty
* req.params.Payload.CreditorAgent.Bic = "ABOCKRSE"
* req.params.Payload.InstructedAmount.Currency = "ZAR"
* req.params.Payload.CreditorAccount.AccountNumber = "4152648451201"
* req.params.Payload.PaymentPurpose = "VO23456 Payment as Agreed"
* req.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* req.params.Payload.CreditorAgent.ClearingMemberId = "KR123"
* req.params.Payload.PaymentPurpose = ""
* def value = signsreq(req,user)
* request value
* method post
* status 200
* match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}