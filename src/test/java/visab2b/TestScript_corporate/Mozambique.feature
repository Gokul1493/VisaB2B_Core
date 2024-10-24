Feature: Mozambique

  Background: 
    * def testData = read('classpath:visab2b/TestData/Config.json')
    * def jutil = Java.type('visab2b.Drivers.Addons')
    * def login = read('classpath:visab2b/Payload/login.json')
    * def beneficiaries = read('classpath:visab2b/Payload/add_Beneficiary.json')
    * def beneTestData = read('classpath:visab2b/TestData/testData.json')
    * beneficiaries.params.payload.beneficiary.creditorAccountNumber = beneTestData.Mozambique.creditorAccountNumber
    * beneficiaries.params.payload.beneficiary.creditorAgentBic = beneTestData.Mozambique.creditorAgentBic
    * beneficiaries.params.payload.beneficiary.creditorName = beneTestData.Mozambique.creditorName
    * beneficiaries.params.payload.beneficiary.CreditorAgentBranchName = beneTestData.Mozambique.CreditorAgentBranchName
    * beneficiaries.params.payload.beneficiary.creditorAddress = beneTestData.Mozambique.creditorAddress
    * beneficiaries.params.payload.beneficiary.instructedCurrency = beneTestData.Mozambique.instructedCurrency

  Scenario: positive
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    # generate Totp
    * def Gauth = testData.Visa_CorporateMK.gauth
    * def Totp = jutil.getTOTPCode(Gauth)
    * print Totp
    * login.params.payload.totp = Totp
    * request login
    * method POST
    * status 200
    * def bearer = response.result.authResponse.sessionCookie
    * print bearer
    * def auth = "Bearer "+ bearer
    * configure headers = {"Authorization":'#(auth)'}
    * def user = testData.Visa_CorporateMK
    * beneficiaries.params.api.deviceId = user.keyId
    * def sig = signscorp(beneficiaries,user)
    * request beneficiaries
    * method POST
    * status 200
    * print response
    * match response.result contains {message:"Beneficiary added successfully"}
     #GET BENEFICIARY ID
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    * configure headers = {"Authorization":'#(auth)'}
    * getbeneficiary_req.params.api.deviceId = user.keyId
    * def sig = signscorp(getbeneficiary_req,user)
    * request getbeneficiary_req
    * method post
    * status 200
    #Beneficiary Validation
    * def creditorName = response.result.beneficiaries[0].creditorName
    * def creditorAgentBic = response.result.beneficiaries[0].creditorAgentBic
    * def creditorIBAN = response.result.beneficiaries[0].creditorIBAN
    * def creditorAddress = response.result.beneficiaries[0].creditorAddress
    * match creditorName == beneTestData.Slovakia.creditorName
    * match creditorAgentBic == beneTestData.Slovakia.creditorAgentBic
    * match creditorIBAN == beneTestData.Slovakia.creditorIBAN
    * match creditorAddress == beneTestData.Slovakia.creditorAddress
    #Select Beneficiary
    * def beneficiaryid_value = response.result.beneficiaries[0].id
    * print beneficiaryid_value
    * jutil.SetData("beneficiaryid",beneficiaryid_value)
    #Transaction
    * configure headers = {"Authorization":'#(auth)'}
    * Transactions.params.payload.instructedAmount.amount = "20.55"
    #* Transactions.params.payload.paymentPurpose= "POP"
    * Transactions.params.api.deviceId = user.keyId
    * Transactions.params.payload.beneficiaryId = beneficiaryid_value
    * Transactions.params.payload.creditorAccount.name = creditorName
    * Transactions.params.payload.creditorAccount.iban = creditorIBAN
    * Transactions.params.payload.creditorAgent.bic = creditorAgentBic
    * def sig = signscorp(Transactions,user)
    * request Transactions
    * method POST
    * status 200
    * print response

  Scenario: without BIC
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    # generate Totp
    * def Gauth = testData.Visa_CorporateMK.gauth
    * def Totp = jutil.getTOTPCode(Gauth)
    * print Totp
    * login.params.payload.totp = Totp
    * request login
    * method POST
    * status 200
    * def bearer = response.result.authResponse.sessionCookie
    * print bearer
    * def auth = "Bearer "+ bearer
    * configure headers = {"Authorization":'#(auth)'}
    * beneficiaries.params.payload.beneficiary.creditorAgentBic = ""
    * def user = testData.Visa_CorporateMK
    * beneficiaries.params.api.deviceId = user.keyId
    * def sig = signscorp(beneficiaries,user)
    * request beneficiaries
    * method POST
    * status 200
    * print response
    * match response.error contains {message:"CreditorAgentBic/CreditorAgentClearingMemberID is cannot be empty"}

  Scenario: without Creditor Name
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    # generate Totp
    * def Gauth = testData.Visa_CorporateMK.gauth
    * def Totp = jutil.getTOTPCode(Gauth)
    * print Totp
    * login.params.payload.totp = Totp
    * request login
    * method POST
    * status 200
    * def bearer = response.result.authResponse.sessionCookie
    * print bearer
    * def auth = "Bearer "+ bearer
    * configure headers = {"Authorization":'#(auth)'}
    * beneficiaries.params.payload.beneficiary.creditorName = ""
    * def user = testData.Visa_CorporateMK
    * beneficiaries.params.api.deviceId = user.keyId
    * def sig = signscorp(beneficiaries,user)
    * request beneficiaries
    * method POST
    * status 200
    * print response
    * match response.error contains {message:"Parameter 'CreditorName' cannot be null."}

  Scenario: invalid BIC
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    # generate Totp
    * def Gauth = testData.Visa_CorporateMK.gauth
    * def Totp = jutil.getTOTPCode(Gauth)
    * print Totp
    * login.params.payload.totp = Totp
    * request login
    * method POST
    * status 200
    * def bearer = response.result.authResponse.sessionCookie
    * print bearer
    * def auth = "Bearer "+ bearer
    * configure headers = {"Authorization":'#(auth)'}
    * beneficiaries.params.payload.beneficiary.creditorAgentBic = "ABCBLKLX546587984"
    * def user = testData.Visa_CorporateMK
    * beneficiaries.params.api.deviceId = user.keyId
    * def sig = signscorp(beneficiaries,user)
    * request beneficiaries
    * method POST
    * status 200
    * print response
    * match response.error contains {message:"Parameter 'CreditorAgentBic' cannot be null."}

  Scenario: without Creditor Agent BranchName
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    # generate Totp
    * def Gauth = testData.Visa_CorporateMK.gauth
    * def Totp = jutil.getTOTPCode(Gauth)
    * print Totp
    * login.params.payload.totp = Totp
    * request login
    * method POST
    * status 200
    * def bearer = response.result.authResponse.sessionCookie
    * print bearer
    * def auth = "Bearer "+ bearer
    * configure headers = {"Authorization":'#(auth)'}
    * beneficiaries.params.payload.beneficiary.CreditorAgentBranchName = ""
    * def user = testData.Visa_CorporateMK
    * beneficiaries.params.api.deviceId = user.keyId
    * def sig = signscorp(beneficiaries,user)
    * request beneficiaries
    * method POST
    * status 200
    * print response
    * match response.error contains {message:"Parameter 'CreditorAgentBranchName' cannot be null."}
