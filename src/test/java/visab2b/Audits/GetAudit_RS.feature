Feature: GETAUDITS_FORM

  Background: 
    * def validation_Messages = read('classpath:visab2b/TestData/Validation.json')
    * def validations = validation_Messages.Validations
    * def testData = read('classpath:visab2b/TestData/Config.json')
    * def jutil = Java.type('visab2b.Drivers.Addons')
    * def arg = jutil.PLtoken()
    * def email = arg.slice(6,10)
    * def orgName = arg.slice(5,10)
    * def Accno = arg.slice(3,10)
    * print Accno
    * url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')

  # Re-usable Code
  Scenario: Fetch Audits with Reference Number
    Given url QaUrl + 'api'
    * def params = getAudits.params
    # Accept dynamic reference number __arg.
    * params.Payload.reference = reference
    * params.Api.Credential = user.Credential
    * params.Api.deviceId = user.keyId
    * def audits = signsreq(getAudits, user)
    And request audits
    When method POST
    Then status 200
        * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    * eval sleep(30000)
    * print response
    # Extract audit with requestName as payment
    * def audits = response.result.audits
    ## Find the first matching entry
    * def paymentAudit = karate.filter(audits, function(x){ return x.requestName == 'Payment' })[0]  
    * print paymentAudit
    * print 'Request:', paymentAudit.request
    * print 'Response:', paymentAudit.response
    # Extract key fields safely
    * def visarequest = paymentAudit.request
    * def visaresponse = paymentAudit.response
    * def responseJson = karate.fromString(visaresponse)
    * def responseList = responseJson.responseList
    # Print extracted details
    * print responseList
    * match responseList[0].reasonCode == "Z200"
    * match responseList[0].reasonDesc == "Payment Processing successful."
