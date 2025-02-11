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

  Scenario: Audits for Albania mt103 review submit Transaction
    # Get Audits for same currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumber = jutil.GetData('GetAuditsAlbaniaMT103RSpostive')
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
    * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    Given url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAlbaniaMT103RSothercurrency')
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    * getAudits.params.Payload.reference = getReferenceNumberothercurrency
    * getAudits.params.Api.Credential = testData.Visa_CK.Credential
    * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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

  #Scenario: Audits for Algeria mt103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsAlgeriamt103RSpostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAlgeriamt103RSothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Angola MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsAngolamt103RSpostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAngolamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Antigua MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsAntiguamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAntiguamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Argentina MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsArgentinamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsArgentinamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Armenia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsArmeniamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsArmeniamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Australia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsAustraliamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAustraliamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Austria MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsAustriamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAustriamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Azerbaijan MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsazerbaijanmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAzerbaijanmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Bahamas MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsBahamasmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsbahamasmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Bahrain anycurrency MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsBahrainacmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Bahrain BHD MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsBahrainmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBahrainmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Bangladesh MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsbanglamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsbanglamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Belgium MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsBelgiummt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsbelgiummt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Bermuda MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsBermudamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBermudamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Bolivia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsBoliviamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBoliviamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Bosnia and herzegovnia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsbahmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBAHmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Botswana MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsbotswanamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsbotswanamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Brazil MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsBrazilmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBrazilmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Britishvirgin island MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsbritishmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsbritishmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Bulgaria MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsBulgariamt103rsmpostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBulgariamt103rsthercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for cambodia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsCambodiamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditscambodiamt103othercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for canada CAD MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsCanadaCAdmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for For Without BIC
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNobicpostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for For other currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditscanadacadothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for canada USD MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsCanadaUSDpostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Cayman islands MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsCaymanislandsmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCaymanmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Chile MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditschilemt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsChilemt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for China MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsChinamt103rsmpostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditschinamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Colombia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsColombiamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsColombiamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for CostaRica MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsCostaricamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCostaricamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Cotedivoire MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsCotedivoiremt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCotedivoiremt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Curacao MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsCuracomt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditscuracaomt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Cyprus MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditscyprusmt103rsmpostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCyprusmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for czechrepublic MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsczechmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCzechmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Denmark MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsDenmarkmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsDenmarkmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for DominicanRepublic MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsDominicanRepublicmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsDominicanrepublicmt103rsmothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Ecuador MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsEcuadormt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsEcuadormt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Egypt MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsEgyptmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for 13 Digit tax ID
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsEgyptmt103rsspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for 14 Digit tax ID
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsegyptmt10314digittaxidpostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD Currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsEgyptmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for El Slavdor MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsElsalvadormt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditselslavdormt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Estonia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsEstoniamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsEstoniamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Finland MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsFinlandmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsFinlandmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for France MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsFrancemt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsfrancemt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for georgia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsgeorgiamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGeorgiamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Germany MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsGermanymt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGermanymt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Ghana MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsghanamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsghanamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Greece MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsGreecemt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGreecemt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Guatemala MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsgautemalamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsgautemalamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Guyana MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsGuyanamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGuyanamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Halti MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditshaltimt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHaltimt103rsmothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Honduras MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsHondurasmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHondurasmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Hongkong MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsHongkongmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHongkongmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Hungary MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsHungarymt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHungarymt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Iceland MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsIcelandmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsIcelandmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Indonesia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsindomt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsindomt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Ireland MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsirelandmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsirelandmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for israel MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsisraelmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsisraelmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Italy MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsitalymt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsItalymt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Jamaica MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsjamaicamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsjamaicamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Japan MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsjanpanmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsjapanmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Jordan MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsJordanmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsjordanmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Kenya MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditskenyamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditskenyamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for kuwait MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditskuwaitmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditskuwaitmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Laos MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditslaosmt103rsmpostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditslaosmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Latvia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditslatviamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditslatviamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Lebanon MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsLebanonmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditslebanonmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Lithuania MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditslithuaniamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditslithuaniamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for luxembourg MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsluxemt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsluxemt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for malaysia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsmalysiamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsmalysiamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for maldives MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsmaldivesmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsmaldivesmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for malta MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsmaltamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsmaltamt103othercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Mauritius MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsmauritismt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMauritiesmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for mexico MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsmexicomt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsmexicomt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Mongolia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsmongoliamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsmongoliamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for morocco MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsmoroccomt103rsmpostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsmorocoomt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Mozambique MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsmozammt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsmoazammt103othercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Namibia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsnamibiamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNamibiamt103othercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Netherlands MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsnetherlandsmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsnetherlandsmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for newzealand MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsnewzealandmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsnewzealandmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for nicargua MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsnicarmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsnicarmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Nigeria MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsnigeriamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsnigeriamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Norway MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsnorwaymt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsnorwaymt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Oman MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsomanmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsomanmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Pakistan MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditspakistanmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPakistanmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Panama MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditspanamamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPanamamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Paraguay MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsparaguaymt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsparaguaymt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Peru MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsperumt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsperumt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Philipines MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsPhilipmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsphilmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for poland MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditspolandmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditspolandmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for portugal MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsportugalmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsportugalmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for qatar MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsqatarmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsqatarmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Romania MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsromaniamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsromaniamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for saudi arabia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsAsaudimt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditssuadimt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Senegal MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditssenegalmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditssenegalmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for serbia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsserbiamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsserbiamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Singapore MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditssingaporemt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditssingaporemt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Slovakia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsslovakiamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsslovakiamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for slovenia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditssloveniamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditssloveniamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for South Africa MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditssouthafricamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditssouthafricamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for South korea MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditssouthkoreamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditssouthkoreamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Spain MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsspainmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsspainmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Srilanka MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditssrilankamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditssrilankamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for sweden MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsswedenmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsswedenmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Switzerland MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsswissmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsswissmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Tanzania MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditstanzaniamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditstanzaniamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Thailand MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsThailandmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsthailandmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for T&T MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsTTmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTTmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Tunisia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsTunisiamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTunisiamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Turkey MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsturkeymt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsturkeymt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Turksislands MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsturksmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsturksmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for uganda MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsugnadamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsugandamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for UAE MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsuaemt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsuaemt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for United Kingdom MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsUKmt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsukmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for United states MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsUSMT103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUSmt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Uruguay MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsuruguaymt103postive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsuruguaymt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Vietnam MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditsvietnammt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditsvietnammt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
#
  #Scenario: Audits for Zambia MT103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditszambiamt103rspostive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditszambiamt103rsothercurrency')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[0].requestName
    #* print requestName
    #* def visarequest = response.result.audits[0].request
    #* print visarequest
    #* def visaresponse = response.result.audits[0].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
