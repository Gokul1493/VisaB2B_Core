Feature: GETAUDITS_API

  Background: 
    * def testData = read('classpath:visab2b/TestData/Config.json')
    * def jutil = Java.type('visab2b.Drivers.Addons')
    * def arg = jutil.PLtoken()
    * def email = arg.slice(6,10)
    * def orgName = arg.slice(5,10)
    * def Accno = arg.slice(3,10)
    * print Accno

  Scenario: Audits for AlbaniaAPI Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsAlbaniaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAlbaniaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for AlgeriaAPI form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsAlgeriaAPIIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAlgeriaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for AngolaAPI form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsAngolaAPIIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAngolaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for AntiguaAPI form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsAntiguaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAntiguaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for ArgentinaAPI form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsArgentinaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsArgentinaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Armenia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsArmeniaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsArmeniaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Australia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsAustraliaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAustraliaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Austria API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsAustriaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAustriaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Azerbaijan API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsAzerbaijanAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAzerbaijanAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Bahamas API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBahamasAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBahamasAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Bahrain API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBahrainAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBahrainAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for BahrainAny API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBahrainAnyAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Bangladesh API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBangladeshAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBangladeshAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    
    
    Scenario: Audits for Belearus API Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBelarusAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBelarusAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Belgium API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBelgiumAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBelgiumAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Bermuda API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBermudaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBermudaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Bolivia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBoliviaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBoliviaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Bosnia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBosniaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBosniaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Botswana API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBotswanaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBotswanaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Brazil API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBrazilAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBrazilAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for BritishVirginIslands API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBritishVirginAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBritishVirginAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for BulgariaBGN API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBulgariaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBulgarianAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for BulgariaEUR API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsBulgariaEURAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBulgariaEURothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Cambodia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCambodiaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCambodiaothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for CanadaCAD API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCanadaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCanadaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for CanadaUSD API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCanadaUSDAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCanadaUSDAPIpostivewithout9digitclearingcode')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCanadaUSDAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for CaymanIslands API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCaymanIslandsAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCaymanIslandsAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Chile API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsChileAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsChileAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for China API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsChinaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsChinaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Colombia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsColombiaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
     # Get Audits for same currency with 10 taxid
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsColombiaAPIpostivewith10txid')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsColombiaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for CostaRica API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCostaRicaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
      # Get Audits for same currency with 10 taxid
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCostaRicaAPIsamecurrencywith15txid')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCostaRicaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for CoteDivoire API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCoteDivoireAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCoteDivoireAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for CroatiaEUR API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCroatiaEURAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCroatiaEURAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for CroayiaHR API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCroayiaHRAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCroayiaHRAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Curacao API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCuracaoAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCuracaoAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Cyprus API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCyprusAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCyprusAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for CzechRepublic API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsCzechAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCzechAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Denmark API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsDenmarkAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsDenmarkAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for DominicanRepublic API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsDominicanRepublicAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsDominicanRepublicAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Ecuador API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsEcuadorAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsEcuadorAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Egypt API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsEgyptAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsEgyptAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for ElSalvador API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsElSalvadorAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsElSalvadorAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Estonia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsEstoniaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsEstoniaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Finland API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsFinlandAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsFinlandAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for France API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsFranceAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsFranceAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Georgia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsGeorgiaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGeorgiaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
     # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGeorgiaAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."


  Scenario: Audits for Germany API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsGermanyAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGermanyAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGermanyAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Ghana API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsGhanaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGhanaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGhanaAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Greece API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsGreeceAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGreeceAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGreeceAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Guatemala API form Transaction
    # Get Audits for same currency with 11 - digit - taxid
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsGuatemalaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency with 11 - digit - taxid with cross border currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGuatemalaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency with 11 - digit - taxid without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGuatemalaAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Guyana API form Transaction
    # Get Audits for same currency with 11 - digit - taxid
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsGuyanaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency with 11 - digit - taxid with cross border currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGuyanaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGuyanaAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Haiti API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsHaitiAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHaitiAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHaitiAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Honduras API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsHondurasAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHondurasAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
      # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHondurasAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for HongKong API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsHongKongAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHongKongAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHongKongAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Hunary EUR API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsHunaryAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHunaryAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHunaryAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Hungary HUF API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsHungaryAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHungaryAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHungaryAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Iceland API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsIcelandAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsIcelandAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Ireland API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsIrelandAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsIrelandAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsIrelandAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Israel API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsIsraelAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsIsraelAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsIsraelAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Italy API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsItalyAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsItalyAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Jamaica API form Transaction
    # Get Audits for same currency with 5 - digit - taxid
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsJamaicaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency with 5 - digit - taxid
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsJamaicaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency with 5 - digit - taxid without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsJamaicaAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Japan API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsJapanAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsJapanAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsJapanAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Jordan API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsJordanAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency with Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsJordanAPIothercurrencies')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsJordanAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    
    Scenario: Audits for Kazakhstan API Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsKazakhstanAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsKazakhstanAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
   

  Scenario: Audits for Kenya API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsKenyaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsKenyaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsKenyaAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Kuwait API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsKuwaitAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsKuwaitAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsKuwaitAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Laos API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsLaosAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLaosAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Latvia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsLatviaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLatviaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLatviaAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Lebanon API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsLebanonAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLebanonAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Lithuania API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsLithuaniaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLithuaniaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLithuaniaAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Luxembourg API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsLuxembourgAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLuxembourgAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    
    
     Scenario: Audits for Maldives API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsMaldivesAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMaldivesAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Malta API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsMaltaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsMaltaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMaltaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Mauritius API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsMauritiusAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMauritiusAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Mexcio API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsMexcioAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMexcioAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMexcioAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Mongolia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsMongoliaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMongoliaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Morocco API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsMoroccoAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMoroccoAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMoroccoAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    
    Scenario: Audits for Mozambique API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsMozambiqueAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMozambiqueAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    

  Scenario: Audits for Namibia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsNamibiaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNamibiaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Nertherlands API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsNertherlandsAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNertherlandsAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNertherlandsAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for NewZealand API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsNewZealandAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNewZealandAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNewZealandAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Nicaragua API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsNicaraguaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNicaraguaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Nigeria API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsNigeriaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNigeriaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNigeriaAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Norway API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsNorwayAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNorwayAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Oman API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsOmanAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsOmanAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsOmanAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Pakistan API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsPakistanAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPakistanAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Panama API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsPanamaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPanamaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency Without enterprise id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPanamaAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Paraguay API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsParaguayAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsParaguayAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency With 9 digit Taxid
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsParaguayAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Peru API form Transaction
    # Get Audits for same currency with 11 digit Taxid
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsPeruAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency with 11 digit Taxid
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPeruPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for Same currency with 11 digit Taxid without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPeruAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Poland API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsPolandAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPolandAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Portugal API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsPortugalAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPortugalAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPortugalAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Qatar API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsQatarAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsQatarAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsQatarAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Romania API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsRomaniaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsRomaniaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsRomaniaAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for SaudiArabia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSaudiArabiaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSaudiArabiaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSaudiArabiaAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Senegal API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSenegalAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSenegalAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSenegalAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Serbia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSerbiaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSerbiaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSerbiaAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Singapore API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSingaporeAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSingaporeAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSingaporeAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Slovakia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSlovakiaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSlovakiaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSlovakiaAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Slovinia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSloviniaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSloviniaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSloviniaAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for SouthAfrica API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSouthAfricaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSouthAfricaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSouthAfricaAPIpostivewithoutEID')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for SouthKorea API form Transaction
    # Get Audits for same currency with BIC11
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSouthKoreaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSouthKoreaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSouthKoreaAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency with BIC 8(Clearing Member ID Followed by KR-KR followed by 3-digit number, no spaces (e.g. //KR123))
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSouthKoreaAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Spain API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSpainAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSpainAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSpainAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for SriLanka API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSriLankaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSriLankaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSriLankaAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Sweden API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSwedenAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSwedenAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSwedenAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Switzerland API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsSwitzerlandAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSwitzerlandAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSwitzerlandAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Tanzania API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsTanzaniaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTanzaniaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTanzaniaAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Thailand API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsThailandAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsThailandAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsThailandAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Trinidad API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsTrinidadAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTrinidadAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTrinidadAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Tunisia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsTunisiaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTunisiaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTunisiaAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Tunisia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsTunisiaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTunisiaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Turkey API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsTurkeyAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTurkeyAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Turks API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsTurksAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTurksAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTurksAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Uganda API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsUgandaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUgandaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    
      Scenario: Audits for Ukraine API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsUkraineAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUkraineAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for UnitedArab API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsUnitedArabAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUnitedArabAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency without Enterprice ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsUnitedArabAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for UnitedKingdom API form Transaction
    # Get Audits for same currency with account number(Clearind ID mandatory)
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsUnitedKingdomAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency with Iban(Clearing member ID is optional)
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUnitedKingdomAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency Without BIC but with proper clearning member id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsUnitedKingdomAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for UnitedStates API form Transaction
    # Get Audits for same currency without Clearind ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsUnitedStatesAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency  without Clearind ID
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUnitedStatesAPIpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency Without BIC but with proper clearning member id
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsUnitedStatesAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Uruguay API form Transaction
    # Get Audits for same currency with 12 digit Taxid
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsUruguayAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency  with more than 12 digit Taxid
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUruguayAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Vietnam API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsVietnamAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsVietnamAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."

  Scenario: Audits for Zambia API form Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsZambiaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsZambiaAPIpostive')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumber
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
    And request audits
    When method POST
    Then status 200
    * print response
    * def requestName = response.result.audits[0].requestName
    * print requestName
    * def visarequest = response.result.audits[0].request
    * print visarequest
    * def visaresponse = response.result.audits[0].response
    * print visaresponse.responseList[0].reasonCode
    * print visaresponse.responseList[0].reasonDesc
    * match requestName == "Payment"
    * match visaresponse.responseList[0].reasonCode = "Z200"
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsZambiaAPIothercurrency')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."