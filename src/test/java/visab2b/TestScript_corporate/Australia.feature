Feature: Application Login

  Background: 
    * def testData = read('classpath:visab2b/TestData/Config.json')
    * def jutil = Java.type('visab2b.Drivers.Addons')
    * def login = read('classpath:visab2b/Payload/login.json')
    #* def rgDev = read('classpath:visab2b/Payload/register_device.json')
    #* def comDev = read('classpath:visab2b/Payload/complete_device.json')
    * def beneficiaries = read('classpath:visab2b/Payload/add_Beneficiary.json')

  #* login.params.api.credential = testData.Visa_CorporateMK.Credential
  Scenario: 
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
    * def auth = "Bearer " + bearer
    * configure headers = {"Authorization":'#(auth)'}
    * beneficiaries.params.payload.beneficiary.creditorAccountNumber = "345346546345"
    * beneficiaries.params.payload.beneficiary.creditorAgentBic = "QAWSAU23"
    * beneficiaries.params.payload.beneficiary.creditorName = "Markes"
    * beneficiaries.params.payload.beneficiary.creditorAgentClearingMemberID = "AU655655"
    * beneficiaries.params.payload.beneficiary.creditorAddress = "345 County Road 12 Fayette"
    * beneficiaries.params.payload.beneficiary.instructedCurrency = "AUD"
    * def priv_key = testData.Visa_CorporateMK.pk
    * string payload = beneficiaries.params.payload
    * print payload
    * def Sign = jutil.sign(payload,priv_key)
    * print Sign 
    * beneficiaries.params.api.signature = "MEQCIB9eiiiZGCDGDyGBd0ip3epkb/Xc3A+7ZpWhqTVKIofsAiAaFy7SmuAyMNMwmqe4Om35TRN3ehfGIAxZz/jTjVyB1w=="
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
