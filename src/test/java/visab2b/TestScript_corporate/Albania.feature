Feature: Albania beneficiary

  Background: 
    * def testData = read('classpath:visab2b/TestData/Config.json')
    * def jutil = Java.type('visab2b.Drivers.Addons')
    * def login = read('classpath:visab2b/Payload/login.json')
    * def beneficiaries = read('classpath:visab2b/Payload/add_Beneficiary.json')
    * def Selectbene = read('classpath:visab2b/TestData/transactionData.json')
    * def Transactions = read('classpath:visab2b/TestData/afterTransaction.json')

  Scenario: Add Beneficiary
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    # generate Totp
    #* def Gauth = testData.Visa_CorporateMK.gauth
    #* def Totp = jutil.getTOTPCode(Gauth)
    #* print Totp
    #* login.params.payload.totp = Totp
    * request login
    * method POST
    * status 200
    * def dev_id = response.result.deviceId
    * print dev_id
    * jutil.SetData("dev_id",dev_id)
    And configure charset = null
    * def bearer = response.result.authResponse.sessionCookie
    * print bearer
    * def auth = "Bearer "+ bearer
    * configure headers = {"Authorization":'#(auth)'}
    * beneficiaries.params.payload.beneficiary.creditorIBAN = "AL47212110090000000235698741"
    * beneficiaries.params.payload.beneficiary.creditorAgentBic = "MIFBALTR"
    * def Benename =  beneficiaries.params.payload.beneficiary.creditorName = "Auto Albania"
    * beneficiaries.params.payload.beneficiary.creditorAddress = "ALbania Street"
    * beneficiaries.params.payload.beneficiary.instructedCurrency ="ALL"
    * def user = testData.Visa_CorporateMK
    #* beneficiaries.params.api.deviceId = user.keyId
    * beneficiaries.params.api.deviceId = dev_id
    * def sig = signscorp(beneficiaries,user)
    * request beneficiaries
    * method POST
    * status 200
    * print response
    * match response.result contains {message:"Beneficiary added successfully"}
    #GET BENEFICIARY ID
    #Scenario: get Beneficiary
    * def getbeneficiary_req = read('classpath:visab2b/Payload/getbeneficiary.json')
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
    #* getbeneficiary_req.params.api.deviceId = user.keyId
    * getbeneficiary_req.params.api.deviceId = dev_id
    * def sig = signscorp(getbeneficiary_req,user)
    * request getbeneficiary_req
    * method post
    * status 200
    * def beneficiaryid_value = response.result.beneficiaries[0].id
    * print beneficiaryid_value
    * jutil.SetData("beneficiaryid",beneficiaryid_value)

@ignore
  Scenario: Empty BIC
    * def dev_id = jutil.GetData("dev_id")
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
    * beneficiaries.params.payload.beneficiary.creditorIBAN = "AL47212110090000000235698741"
    * beneficiaries.params.payload.beneficiary.creditorAgentBic = ""
    * beneficiaries.params.payload.beneficiary.creditorName = " Auto Albania"
    * beneficiaries.params.payload.beneficiary.creditorAddress = " ALbania Street"
    * beneficiaries.params.payload.beneficiary.instructedCurrency ="ALL"
    * def user = testData.Visa_CorporateMK
    #* beneficiaries.params.api.deviceId = user.keyId
    * beneficiaries.params.api.deviceId = dev_id
    * def sig = signscorp(beneficiaries,user)
    * request beneficiaries
    * method POST
    * status 200
    * print response
    * match response.error contains {message:"CreditorAgentBic/CreditorAgentClearingMemberID is cannot be empty"}

@ignore
  Scenario: Invalid BIC
    * def dev_id = jutil.GetData("dev_id")
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
    * beneficiaries.params.payload.beneficiary.creditorIBAN = "AL47212110090000000235698741"
    * beneficiaries.params.payload.beneficiary.creditorAgentBic = "AQWS"
    * beneficiaries.params.payload.beneficiary.creditorName = " Auto Albania"
    * beneficiaries.params.payload.beneficiary.creditorAddress = " ALbania Street"
    * beneficiaries.params.payload.beneficiary.instructedCurrency ="ALL"
    * def user = testData.Visa_CorporateMK
    #* beneficiaries.params.api.deviceId = user.keyId
    * beneficiaries.params.api.deviceId = dev_id
    * def sig = signscorp(beneficiaries,user)
    * request beneficiaries
    * method POST
    * status 200
    * print response
    * match response.error contains {message:"Parameter 'CreditorAgentBic' cannot be null."}

@ignore
  Scenario: IBAN empty
    * def dev_id = jutil.GetData("dev_id")
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
    * beneficiaries.params.payload.beneficiary.creditorIBAN = ""
    * beneficiaries.params.payload.beneficiary.creditorAgentBic = "MIFBALTR"
    * beneficiaries.params.payload.beneficiary.creditorName = " Auto Albania"
    * beneficiaries.params.payload.beneficiary.creditorAddress = " ALbania Street"
    * beneficiaries.params.payload.beneficiary.instructedCurrency ="ALL"
    * def user = testData.Visa_CorporateMK
    #* beneficiaries.params.api.deviceId = user.keyId
    * beneficiaries.params.api.deviceId = dev_id
    * def sig = signscorp(beneficiaries,user)
    * request beneficiaries
    * method POST
    * status 200
    * print response
    * match response.error contains {message:"CreditorAccountNumber/CreditorIBAN is cannot be empty"}

@ignore
  Scenario: Empty beneficiary name
    * def dev_id = jutil.GetData("dev_id")
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
    * beneficiaries.params.payload.beneficiary.creditorIBAN = "AL47212110090000000235698741"
    * beneficiaries.params.payload.beneficiary.creditorAgentBic = "MIFBALTR"
    * beneficiaries.params.payload.beneficiary.creditorName = ""
    * beneficiaries.params.payload.beneficiary.creditorAddress = " ALbania Street"
    * beneficiaries.params.payload.beneficiary.instructedCurrency ="ALL"
    * def user = testData.Visa_CorporateMK
    #* beneficiaries.params.api.deviceId = user.keyId
    * def sig = signscorp(beneficiaries,user)
    * request beneficiaries
    * method POST
    * status 200
    * print response
    * match response.error contains {message:"Parameter 'CreditorName' cannot be null."}

@ignore
  Scenario: Transactions for Albania
    * def dev_id = jutil.GetData("dev_id")
    * def beneID = jutil.GetData("beneficiaryid")
    * print beneID
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
    * Transactions.params.payload.instructedAmount.amount = 20.55
    * Transactions.params.payload.paymentPurpose= "POP"
    * def user = testData.Visa_CorporateMK
    #* Transactions.params.api.deviceId = user.keyId
    * Transactions.params.api.deviceId = dev_id
    * def sig = signscorp(Transactions,user)
    * Transactions.params.payload.beneficiaryId = beneID
    * request Transactions
    * method POST
    * status 200
    * print response
