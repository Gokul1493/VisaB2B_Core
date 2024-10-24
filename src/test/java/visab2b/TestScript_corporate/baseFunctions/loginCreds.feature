Feature: preRequisite

  @loginWithMaker
  Scenario: loginWithMaker
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    #Given url 'http://localhost:4200/'
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

  @loginWithChecker
  Scenario: checkerLogin
    # Generate Totp
    * def Gauth = testData.Visa_CorporateCK.gauth
    * def Totp = jutil.getTOTPCode(Gauth)
    * print Totp
    * checkerLogin.params.payload.totp = Totp
    # Initiate the Request
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    #Given url 'http://localhost:4200/'
    #* configure headers = {"Authorization":'Bearer '}
    And request checkerLogin
    When method POST
    Then status 200
    Then print response
    # Get & Store the Session Token in Hashmap
    * def bearer = response.result.authResponse.sessionCookie
    * print bearer
    * def auth = "Bearer "+ bearer
    * configure headers = {"Authorization":'#(auth)'}
    
  @loginWithConnectorChecker
  Scenario: connectorCheckerLogin   
     #Generate Totp
    * def Gauth = testData.Visa_ConnectorCK.gauth
    * def Totp = jutil.getTOTPCode(Gauth)
    * print Totp
    * connectorCheckerLogin.params.Payload.totp = Totp
     #Initiate the Request
    Given url 'https://connectors.cbwpayments.com/visab2b/api'
    #Given url 'http://localhost:9030/'
    * configure headers = {"Authorization":'Bearer '}
    And request connectorCheckerLogin
    When method POST
    Then status 200
    Then print response
     #Get & Store the Session Token in Hashmap
    * def bearer = response.result.authResponse.sessionCookie
    * def auth = "Bearer "+ bearer
