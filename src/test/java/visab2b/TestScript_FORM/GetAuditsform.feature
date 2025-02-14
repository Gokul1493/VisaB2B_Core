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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditPositive_GetAuditsform.featureclearingmemberid')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.featureinclearingmemberid')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    * def getReferenceNumber = jutil.GetData('GetAuditPositive_GetAuditsform.feature')
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
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
