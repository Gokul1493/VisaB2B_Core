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

  Scenario: Audits for Albania form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsAlbaniaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAlbaniaFormothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Algeria form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetauditsAlgeriaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetauditsAlgeriaformsamecurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * jutil.SetData("getAuditsothercurrencyAngola",referencenumber)

  Scenario: Audits for Angola form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('getAuditssamecurrencyAngola')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('getAuditsothercurrencyAngola')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse

  Scenario: Audits for Antigua form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsAntiguaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAntiguaFormothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Argentina form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsArgentinaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsArgentinaFormothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Australia form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsAustraliaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAustraliaFormothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Austria form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsAustriaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAustriaFormothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Azerbaijan form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsAzerbaijanformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAzerbaijanFormothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Bahamas form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBahamasformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBahamasFormothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for BahrainAny form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBahrainAnyformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBahrainAnyFormothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for BahrainBhd form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBahrainBhdformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Bangladesh form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBangladeshformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBangladeshFormothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Belgium form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBelgiumformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBelgiumFormothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Bermuda form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBermudaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBermudaFormothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Bolivia form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBoliviaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBoliviaFormothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for BosniaandHerzegovina form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBosniaandherzegovinaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBosniaandherzegovinaFormothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Brazil form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBrazilformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBrazilformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for BritishVirginIslands form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBritishVirginIslandsformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBritishVirginIslandsothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Bulgaria form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBulgariaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBulgariaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Cambodia form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCambodiaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCambodiaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for CanadaCAD form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCanadaCADformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCanadaCADformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits clearing member id for positive flow
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCanadaformpostiveclearingmemberid')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Canada(USA) form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCanadaUSAformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCanadaUSAformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for CaymanIsalands form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCaymanIsalandsformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCaymanIsalandsformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Chile form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsChileformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsChileformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for China form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsChinaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsChinaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Colombia form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsColombiaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsColombiaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for CostaRica form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCostaRicaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCostaRicaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for CoteDivoire form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCoteDivoireformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCoteDivoireformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Croatia form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCroatiaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCroatiaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Curacao form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCuracaoformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCuracaoformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Cyprus form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCyprusformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCyprusformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for CzechRepublic form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCzechRepublicformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCzechRepublicformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Denmark form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsDenmarkformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsDenmarkformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for DominicanRepublic form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsDominicanRepublicformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsDominicanRepublicformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Ecuador form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsEcuadorformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsEcuadorformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Egypt form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsEgyptformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsEgyptformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for ElSalvador form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsElSalvadorformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsElSalvadorformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Estonia form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsEstoniaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsEstoniaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Finland form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsFinlandformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsFinlandformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for France form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsFranceformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsFranceformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Georgia form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsGeorgiaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGeorgiaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Germany form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsGermanyformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGermanyformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Ghana form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsGhanaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGhanaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Greece form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsGreeceformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGreeceformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Guatemala form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsGuatemalaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGuatemalaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Guyana form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsGuyanaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGuyanaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Haiti form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsHaitiformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHaitiformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Honduras form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsHondurasformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHondurasformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for HongKong form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsHongKongformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHongKongformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Hungary form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsHungaryformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHungaryformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Indonesia form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsIndonesiaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsIndonesiaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Ireland form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsIrelandformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsIrelandformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Israel form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsIsraelformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsIsraelformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Italy form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsItalyformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsItalyformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Jamaica form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsJamaicaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsJamaicaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Japan form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsJapanformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsJapanformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Jordan form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsJordanformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsJordanformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Kenya form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsKenyaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsKenyaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Kuwait form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsKuwaitformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsKuwaitformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Laos form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsLaosformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLaosformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Latvia form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsLatviaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLatviaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Lebanon form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsLebanonformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLebanonformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Lithuania form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsLithuaniaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLithuaniaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Luxembourg form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsLuxembourgformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLuxembourgformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Malaysia form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsMalaysiaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMalaysiaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Malta form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsMaltaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMaltaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Mauritius form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsMauritiusformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMauritiusformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Mexcio form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsMexcioformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMexcioformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Mongolia form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsMongoliaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMongoliaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Morocco form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsMoroccoformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMoroccoformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Netherlands form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsNetherlandsformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNetherlandsformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Zealand form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsZealandformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for same currency with Clearning member id and without BIC
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsZealandformpostiveinclearingmemberid')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsZealandformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Nicaragua form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsNicaraguaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNicaraguaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Nigeria form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsNigeriaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNigeriaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Norway form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsNorwayformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNorwayformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Oman form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsOmanformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsOmanformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Pakistan form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsPakistanformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPakistanformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Panama form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsPanamaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPanamaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Paraguay form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsParaguayformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsParaguayformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Peru form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsPeruformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPeruformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Philippines form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsPhilippinesformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPhilippinesformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Poland form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsPolandformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPolandformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Portugal form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsPortugalformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPortugalformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Qatar form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsQatarformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsQatarformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Romania form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsRomaniaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsRomaniaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for SaudiArabia form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSaudiArabiaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSaudiArabiaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Senegal form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSenegalformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSenegalformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Serbia form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSerbiaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSerbiaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Singapore form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSingaporeformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSingaporeformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Slovakia form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSlovakiaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSlovakiaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Slovenia form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSloveniaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSloveniaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for SouthAfrica form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSouthAfricaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for with ClearingMemberId without BIC
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSouthAfricaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSouthAfricaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for SouthKorea form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSouthKoreaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSouthKoreaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Spain form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSpainformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSpainformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for SriLanka form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSriLankaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSriLankaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Sweden form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSwedenformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSwedenformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Switzerland form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSwitzerlandformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSwitzerlandformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Tanzania form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsTanzaniaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTanzaniaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Thailand form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsThailandformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsThailandformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for TrinidadandTobago form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsTrinidadandTobagoformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTrinidadandTobagoformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Tunisia form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsTunisiaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTunisiaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Turkey form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsTurkeyformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTurkeyformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for TurksandCaicosIslands form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsTurksandCaicosIslandsformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTurksandCaicosIslandsformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Uganda form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsUgandaformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUgandaformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for UnitedArabEmirates form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsUnitedArabEmiratesformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUnitedArabEmiratesformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for UnitedKingdom form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsUnitedKingdomformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits with clearning member id without BIC
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUnitedKingdomformclearningmemberid')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUnitedKingdomformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for UnitedStates form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsUnitedStatesformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits with clearning member id without BIC
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUnitedStatesformclearningmemberid')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUnitedStatesformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Uruguay form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsUruguayformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUruguayformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."

  Scenario: Audits for Vietnam form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsVietnamformpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsVietnamformothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = "Payment Processing successful."
