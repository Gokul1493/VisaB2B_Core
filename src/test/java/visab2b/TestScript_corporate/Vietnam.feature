Feature: Vietnam

  Background: 
    * def testData = read('classpath:visab2b/TestData/Config.json')
    * def jutil = Java.type('visab2b.Drivers.Addons')
    * def login = read('classpath:visab2b/Payload/login.json')
    * def checkerLogin = read('classpath:visab2b/Payload/checkerLogin.json')
    * def connectorCheckerLogin = read('classpath:visab2b/Payload/connectorCheckerLogin.json')
    * def beneficiaries = read('classpath:visab2b/Payload/add_Beneficiary.json')
    * def beneTestData = read('classpath:visab2b/TestData/testData.json')
    * def Selectbene = read('classpath:visab2b/Payload/transactionData.json')
    * def Transactions = read('classpath:visab2b/Payload/afterTransaction.json')
    * def getbeneficiary_req = read('classpath:visab2b/Payload/getbeneficiary.json')
    * def getTransactionID = read('classpath:visab2b/Payload/getCustomerTransactions.json')
    * def getApproveTransactionID = read('classpath:visab2b/Payload/getCustomerApproveTransactions.json')
    * def ApproveCustomerTransaction = read('classpath:visab2b/Payload/ApproveCustomerTransaction.json')
    * def connectorTranApprov = read('classpath:visab2b/Payload/connectorTranApprov.json')
    * def con_TranList2App = read('classpath:visab2b/Payload/con_TranList2App.json')
    * def user = testData.Visa_CorporateMK
    * def checkerUser = testData.Visa_CorporateCK
    * def connectorCheckerUser = testData.Visa_ConnectorCK
    * def jutil = Java.type('visab2b.Drivers.Addons')
    * def arg = jutil.PLtoken()
    * def endToendID = "CompRef" + 	arg.slice(6,12)
    * beneficiaries.params.payload.beneficiary.creditorIBAN = beneTestData.Vietnam.creditorIBAN
    * beneficiaries.params.payload.beneficiary.creditorAgentBic = beneTestData.Vietnam.creditorAgentBic
    * beneficiaries.params.payload.beneficiary.creditorName = beneTestData.Vietnam.creditorName
    * beneficiaries.params.payload.beneficiary.creditorAddress = beneTestData.Vietnam.creditorAddress
    * beneficiaries.params.payload.beneficiary.instructedCurrency = beneTestData.Vietnam.instructedCurrency
    * beneficiaries.params.payload.beneficiary.creditorAgentBranchName = beneTestData.Vietnam.creditorAgentBranchName
    * beneficiaries.params.payload.beneficiary.creditorAccountNumber = beneTestData.Vietnam.creditorAccountNumber

  @positive
  Scenario: positive
    * call read('classpath:visab2b/TestScript_corporate/baseFunctions/loginCreds.feature@loginWithAuth')
    #* def auth = jutil.GetData("auth")
    #add Beneficiary
    * def user = testData.Visa_CorporateMK
    * beneficiaries.params.api.deviceId = user.keyId
    * def sig = signscorp(beneficiaries,user)
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
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
    * match creditorName == beneTestData.Vietnam.creditorName
    * match creditorAgentBic == beneTestData.Vietnam.creditorAgentBic
    * match creditorIBAN == beneTestData.Vietnam.creditorIBAN
    * match creditorAddress == beneTestData.Vietnam.creditorAddress
    #Select Beneficiary
    * def beneficiaryid_value = response.result.beneficiaries[0].id
    * print beneficiaryid_value
    * jutil.SetData("beneficiaryid",beneficiaryid_value)
    #Transaction
    * configure headers = {"Authorization":'#(auth)'}
    * Transactions.params.payload.instructedAmount.amount = "20.55"
    * Transactions.params.payload.paymentPurpose= "POP"
    * Transactions.params.api.deviceId = user.keyId
    * Transactions.params.payload.beneficiaryId = beneficiaryid_value
    * Transactions.params.payload.creditorAccount.name = creditorName
    * Transactions.params.payload.creditorAccount.iban = creditorIBAN
    * Transactions.params.payload.creditorAgent.bic = creditorAgentBic
    * Transactions.params.payload.instructedAmount.currency = beneTestData.Vietnam.instructedCurrency
    
    * def sig = signscorp(Transactions,user)
    * request Transactions
    * method POST
    * status 200
    * print response
    #GET Transaction ID
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    * configure headers = {"Authorization":'#(auth)'}
    * getTransactionID.params.api.deviceId = user.keyId
    * def sig = signscorp(getTransactionID,user)
    * request getTransactionID
    * method post
    * status 200
    #Beneficiary Validation
    * def transactioID = response.result.transactions[0].id
    * call read('classpath:visab2b/TestScript_corporate/baseFunctions/loginCreds.feature@loginWithChecker')
    #GET Approve Transaction ID
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    * configure headers = {"Authorization":'#(auth)'}
    * getApproveTransactionID.params.api.deviceId = checkerUser.keyId
    * def sig = signscorp(getApproveTransactionID,checkerUser)
    * request getApproveTransactionID
    * method post
    * status 200
    #Beneficiary Validation
    * def approveTransactioID = response.result.transactions[0].id
    * print approveTransactioID
    * print transactioID
    * match transactioID == approveTransactioID
    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    * eval sleep(10000)
    #Approve Customer Transaction
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    * configure headers = {"Authorization":'#(auth)'}
    * ApproveCustomerTransaction.params.api.deviceId = checkerUser.keyId
    * ApproveCustomerTransaction.params.payload.transactionIds[0] = transactioID
    * def sig = signscorp(ApproveCustomerTransaction,checkerUser)
    * request ApproveCustomerTransaction
    * method post
    * status 200
    #Approve Transaction in connector
    * call read('classpath:visab2b/TestScript_corporate/baseFunctions/loginCreds.feature@loginWithConnectorChecker')
    #Get list of transaction to approve and verify the presence of transaction
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    * configure headers = {"Authorization":'#(auth)'}
    * con_TranList2App.params.Api.deviceId = connectorCheckerUser.keyId
    * def sig = signsreq(con_TranList2App,connectorCheckerUser)
    * request con_TranList2App
    * method post
    * status 200
    #Beneficiary Validation
    * def avaitingApprovTranID = response.result.transactions[0].id
    * print approveTransactioID
    * print transactioID
    * match transactioID == avaitingApprovTranID
    #Approve connector Transaction
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    * configure headers = {"Authorization":'#(auth)'}
    * connectorTranApprov.params.Api.deviceId = connectorCheckerUser.keyId
    * connectorTranApprov.params.Payload.transactionId = transactioID
    * connectorTranApprov.params.Payload.endToEndIdentification = endToendID
    * print endToendID
    * def sig = signsreq(connectorTranApprov,connectorCheckerUser)
    * eval sleep(10000)
    * request connectorTranApprov
    * method post
    * status 200
    * match response.result contains {message:"Approved successfully"}

  @withoutamount
  Scenario: transaction without amount
    * call read('classpath:visab2b/TestScript_corporate/baseFunctions/loginCreds.feature@loginWithAuth')
    #Get Beneficiary
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    * configure headers = {"Authorization":'#(auth)'}
    * getbeneficiary_req.params.api.deviceId = user.keyId
    * def sig = signscorp(getbeneficiary_req,user)
    * request getbeneficiary_req
    * method post
    * status 200
    #Transaction
    * Transactions.params.payload.instructedAmount.amount = ""
    * Transactions.params.payload.creditorAccount.name = beneTestData.Vietnam.creditorName
    * Transactions.params.payload.creditorAccount.creditorAgentBic = beneTestData.Vietnam.creditorAgentBic
    * Transactions.params.payload.creditorAccount.address = beneTestData.Vietnam.creditorAddress
    * Transactions.params.payload.creditorAccount.iban = beneTestData.Vietnam.creditorIBAN
    * Transactions.params.payload.instructedAmount.currency = beneTestData.Vietnam.instructedCurrency
    * def user = testData.Visa_CorporateMK
    * Transactions.params.api.deviceId = user.keyId
    * def beneficiaryid_value = response.result.beneficiaries[0].id
    * Transactions.params.payload.beneficiaryId = beneficiaryid_value
    * Transactions.params.payload.creditorAccount.name = beneTestData.Vietnam.creditorName
    * Transactions.params.payload.creditorAccount.iban = beneTestData.Vietnam.creditorIBAN
    * Transactions.params.payload.creditorAgent.bic = beneTestData.Vietnam.creditorAgentBic
    * def sig = signscorp(Transactions,user)
    * request Transactions
    * method POST
    * status 200
    * print response
    * match response.error contains {message:"Parameter 'instructedAmount.amount' cannot be null."}

  @withoutPOP
  Scenario: transaction without POP
    * call read('classpath:visab2b/TestScript_corporate/baseFunctions/loginCreds.feature@loginWithAuth')
    #Get Beneficiary
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    * configure headers = {"Authorization":'#(auth)'}
    * getbeneficiary_req.params.api.deviceId = user.keyId
    * def sig = signscorp(getbeneficiary_req,user)
    * request getbeneficiary_req
    * method post
    * status 200
    #Transaction
    * Transactions.params.payload.instructedAmount.amount = "16.74"
    * Transactions.params.payload.paymentPurpose= ""
    * Transactions.params.payload.creditorAccount.name = beneTestData.Vietnam.creditorName
    * Transactions.params.payload.creditorAccount.creditorAgentBic = beneTestData.Vietnam.creditorAgentBic
    * Transactions.params.payload.creditorAccount.address = beneTestData.Vietnam.creditorAddress
    * Transactions.params.payload.creditorAccount.iban = beneTestData.Vietnam.creditorIBAN
    * Transactions.params.payload.instructedAmount.currency = beneTestData.Vietnam.instructedCurrency
    * def user = testData.Visa_CorporateMK
    * Transactions.params.api.deviceId = user.keyId
    * def beneficiaryid_value = response.result.beneficiaries[0].id
    * Transactions.params.payload.beneficiaryId = beneficiaryid_value
    * Transactions.params.payload.creditorAccount.name = beneTestData.Vietnam.creditorName
    * Transactions.params.payload.creditorAccount.iban = beneTestData.Vietnam.creditorIBAN
    * Transactions.params.payload.creditorAgent.bic = beneTestData.Vietnam.creditorAgentBic
    * def sig = signscorp(Transactions,user)
    * request Transactions
    * method POST
    * status 200
    * print response
    * match response.error contains {message:"Parameter 'PaymentPurpose' cannot be null."}
@InvalidBIC
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
    * beneficiaries.params.payload.beneficiary.creditorAgentBic = "2165498456"
    * def user = testData.Visa_CorporateMK
    * beneficiaries.params.api.deviceId = user.keyId
    * def sig = signscorp(beneficiaries,user)
    * request beneficiaries
    * method POST
    * status 200
    * print response
    * match response.error contains {message:"Parameter 'CreditorAgentBic' cannot be null."}

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

@address
  Scenario: without Creditor Agent Address
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
    * beneficiaries.params.payload.beneficiary.creditorAddress = ""
    * def user = testData.Visa_CorporateMK
    * beneficiaries.params.api.deviceId = user.keyId
    * def sig = signscorp(beneficiaries,user)
    * request beneficiaries
    * method POST
    * status 200
    * print response
    * match response.error contains {message:"Parameter 'CreditorAddress' cannot be null."}

  Scenario: without Account Number
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
    * beneficiaries.params.payload.beneficiary.creditorAccountNumber = ""
    * def user = testData.Visa_CorporateMK
    * beneficiaries.params.api.deviceId = user.keyId
    * def sig = signscorp(beneficiaries,user)
    * request beneficiaries
    * method POST
    * status 200
    * print response
    * match response.error contains {message:"CreditorAccountNumber/CreditorIBAN is cannot be empty"}
