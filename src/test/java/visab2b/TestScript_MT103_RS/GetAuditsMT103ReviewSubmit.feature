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
    * print response
    # Extract key fields safely
    * def auditIndex = response.result.audits[1]
    * def requestName = response.result.audits[1].requestName
    * def visarequest = response.result.audits[1].request
    * def visaresponse = response.result.audits[1].response
    * def responseJson = karate.fromString(visaresponse)
    * def debtorAgentBic = responseJson.debtorAgentBic
    * def responseList = responseJson.responseList
    # Print extracted details
    * print responseList
    * match responseList[0].reasonCode == "Z200"
    * match responseList[0].reasonDesc == "Payment Processing successful."

  #@Positive
  #Scenario: Audits for Albania MT103 Review Submit Transaction
     #Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* print getReferenceNumber
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits, user)
    #And request audits
    #When method POST
    #Then status 200
    #* print response
     #Safe index handling
    #* def auditIndex = response.result.audits[1]
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
     #Safe handling of response list
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse
    #* def responseJson = karate.fromString(visaresponse)
    #* print responseJson
    #* def debtorAgentBic = responseJson.debtorAgentBic
    #* print 'Debtor Agent BIC:', debtorAgentBic
     #Write and Read JSON safely
    #* def responseList = responseJson.responseList
    #* print responseList
    #* def responseList[0].reasonCode == reasonCode
    * def responseList[0].reasonDesc == resonDesc
  #Scenario: Audits for Albania mt103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* print getReferenceNumber
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* print response
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def responseList = response.result.audits[1].response
    #* print responseList
    #* def safeResponseList = responseList ? responseList : []
    #* karate.write(safeResponseList, '/home/gokulakannanm/git/VisaB2B_Core/src/test/java/visab2b/TestData/responseList.json')
    #* def responseList2 = karate.read('/home/gokulakannanm/git/VisaB2B_Core/src/test/java/visab2b/TestData/responseList.json')
    #* print responseList2
    #* def responseList1 = karate.read('responseList.json')
    #* print responseList1
  #Scenario: Audits for Algeria mt103 review submit Transaction
    # Get Audits for same currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for different currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for For Without BIC
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for For other currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for other currency USD
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for 13 Digit tax ID
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for 14 Digit tax ID
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD Currency
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
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
    #* def getReferenceNumber = jutil.GetData('GetAuditPositive')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumber
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
    # Get Audits for USD CURRENCY
    #Given url QaUrl + 'api'
    #* def user = testData.Visa_CK
    #* def getReferenceNumberothercurrency = jutil.GetData('GetAuditCrossBorder')
    #* def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
    #* getAudits.params.Payload.reference = getReferenceNumberothercurrency
    #* getAudits.params.Api.Credential = testData.Visa_CK.Credential
    #* getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    #* def audits = signsreq(getAudits,user)
    #And request audits
    #When method POST
    #Then status 200
    #* def requestName = response.result.audits[1].requestName
    #* print requestName
    #* def visarequest = response.result.audits[1].request
    #* print visarequest
    #* def visaresponse = response.result.audits[1].response
    #* print visaresponse
    #* print visaresponse.responseList[0].reasonCode
    #* print visaresponse.responseList[0].reasonDesc
    #* match requestName == "Payment"
    #* match visaresponse.responseList[0].reasonCode = "Z200"
    #* match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."


