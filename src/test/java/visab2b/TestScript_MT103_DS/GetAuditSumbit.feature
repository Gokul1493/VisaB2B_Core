Feature: GETAUDITS_FORM

Background: 
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
	 * def getReferenceNumber = jutil.GetData('GetAuditsAlbaniaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAlbaniaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Algeria form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsAlgeriaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAlgeriaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
    Scenario: Audits for Angola form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsAngolaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAngolaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
   Scenario: Audits for Antigua form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsAntiguaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAntiguaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Argentina form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsArgentinaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsArgentinaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Australia form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsAustraliaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAustraliaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
   Scenario: Audits for Austria form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsAustriaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAustriaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
    Scenario: Audits for Azerbaijan form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsAzerbaijanDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsAzerbaijanDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
    Scenario: Audits for Bahamas form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsBahamasDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBahamasDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
    Scenario: Audits for BahrainAny form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsBahrainAnyDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBahrainAnyDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
   Scenario: Audits for BahrainBHD form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsBahrainAnyDirectSubmitpostive')
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
  
  
  Scenario: Audits for Bangladesh form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsBangladeshAnyDirectSubmitpostive')
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
  
  
  
    Scenario: Audits for Belgium form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsBelgiumAnyDirectSubmitpostive')
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
  
      Scenario: Audits for Bermuda form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsBermudaAnyDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBermudaAnyDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
    Scenario: Audits for Bolivia form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsBoliviaAnyDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBoliviaAnyDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
   Scenario: Audits for BosniaandHerzegovina form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsBosniaandHerzegovinaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBosniaandHerzegovinaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Brazil form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsBrazilDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBrazilDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for BritishVirginIslands form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsBritishVirginIslandsDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBritishVirginIslandsDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  
  Scenario: Audits for Bulgaria form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsBulgariaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsBulgariaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Cambodia form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsCambodiaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCambodiaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for CanadaCAD form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsCanadaCADDirectSubmitpostiveBIC')
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
  
   # Get Audits for clearing Member ID only
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCanadaCADDirectSubmitpostiveClearingID')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
	 # Get Audits for same currency with BIC and clearing Member ID only
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsCanadaCADDirectSubmitpostiveBICandClearingId')
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
  
   # Get Audits for other Currency with BIC only
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCanadaCADDirectSubmitothercurrencyBIConly')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
   # Get Audits for other Currency with Clearing Member Id only
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCanadaCADDirectSubmitothercurrencyClearingMemberIdonly')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  
  
  Scenario: Audits for CanadaUSA form Transaction
	 # Get Audits for USA currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsCanadaUSADirectSubmitpostiveBIC')
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
  
   # Get Audits for clearing Member ID only (CC)
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCanadaUSADirectSubmitpostiveClearingID(CC)')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
    # Get Audits for clearing Member ID only (FW)
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCanadaUSADirectSubmitpostiveClearingID(FW)')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
	 # Get Audits for same currency with BIC and clearing Member ID only
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsCanadaUSADirectSubmitpostiveBICandClearingId')
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
  
   # Get Audits for other Currency with BIC only
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCanadaUSADirectSubmitothercurrencyBIConly')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
   # Get Audits for other Currency with Clearing Member Id only
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCanadaUSADirectSubmitothercurrencyClearingMemberIdonly')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for CaymanIslands form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsCaymanIslandsDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCaymanIslandsDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
   Scenario: Audits for Chile form Transaction
	 # Get Audits for same currency with 9 digit Beneficiary Tax ID
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsChileDirectSubmitpostive')
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
  
   # Get Audits for same currency with 10 digit Beneficiary Tax ID
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsChileDirectSubmitpostive')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
	 # Get Audits for other Currency with 10 digit Beneficiary Tax ID
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsChileDirectSubmitothercurrency')
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
  
   # Get Audits for other Currency without 10 digit Beneficiary Tax ID
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsChileDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  
  
   Scenario: Audits for China form Transaction
	 # Get Audits for same currency with 9 digit Beneficiary Tax ID
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsChinaDirectSubmitpostive')
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
  
   # Get Audits for with other Currency without Mandatory field
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsChinaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
	 # Get Audits for with other Currency with Mandatory fields
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsChinaDirectSubmitothercurrency')
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
  
  
    Scenario: Audits for CaymanIslands form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsCaymanIslandsDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCaymanIslandsDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
   Scenario: Audits for Colombia form Transaction
	 # Get Audits for same currency with 9 digit Beneficiary Tax ID
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsColombiaDirectSubmitpostive')
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
  
   # Get Audits for same currency with 10 digit Beneficiary Tax ID
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsColombiaDirectSubmitpostive')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
	 # Get Audits for other Currency with 10 digit Beneficiary Tax ID
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsColombiaDirectSubmitothercurrency')
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
  
   # Get Audits for other Currency without 10 digit Beneficiary Tax ID
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsColombiaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
   
   Scenario: Audits for CostaRica form Transaction
	 # Get Audits for same currency with 12 digit Beneficiary Tax ID
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsCostaRicaDirectSubmitpostive')
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
  
   # Get Audits for same currency with 13 digit Beneficiary Tax ID
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCostaRicaDirectSubmitpostive')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
	 # Get Audits for same currency with 14 digit Beneficiary Tax ID
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsCostaRicaDirectSubmitpostive')
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
  
   # Get Audits for same currency with 15 digit Beneficiary Tax ID
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCostaRicaDirectSubmitpostive')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
     # Get Audits for other Currency with 12 digit Beneficiary Tax ID
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCostaRicaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
    Scenario: Audits for CoteDivoire form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsCoteDivoireDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCoteDivoireDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
    Scenario: Audits for Croatia form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsCroatiaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCroatiaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
    Scenario: Audits for Curacao form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsCuracaoDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCuracaoDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
    Scenario: Audits for Cyprus form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsCyprusDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCyprusDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for CzechRepublic form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsCzechRepublicDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsCzechRepublicDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Denmark form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsDenmarkDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsDenmarkDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
   Scenario: Audits for DominicanRepublic form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsDominicanRepublicDirectSubmitpostive')
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
  
  # Get Audits for other Currency without 9 digit Beneficiary Tax ID
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsDominicanRepublicDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
    # Get Audits for other Currency without 9 digit Beneficiary Tax ID
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsDominicanRepublicDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  
  Scenario: Audits for Ecuador form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsEcuadorDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsEcuadorDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
   Scenario: Audits for Egypt form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsEgyptDirectSubmitpostive')
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
  
  # Get Audits for with other Currency without Mandatory field
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsEgyptDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
    # Get Audits for other Currency with Mandatory fields
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsEgyptDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for ElSalvador form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsElSalvadorDirectSubmitpostive')
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
  
  # Get Audits for with other Currency without Mandatory field
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsElSalvadorDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
   
  Scenario: Audits for Estonia form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsEstoniaDirectSubmitpostive')
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
  
  # Get Audits for with other Currency without Mandatory field
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsEstoniaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
   Scenario: Audits for Finland form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsFinlandDirectSubmitpostive')
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
  
  # Get Audits for with other Currency without Mandatory field
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsFinlandDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for France form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsFranceDirectSubmitpostive')
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
  
  # Get Audits for with other Currency without Mandatory field
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsFranceDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Georgia form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsGeorgiaDirectSubmitpostive')
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
  
  # Get Audits for with other Currency without Mandatory field
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGeorgiaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Germany form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsGermanyDirectSubmitpostive')
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
  
  # Get Audits for with other Currency without Mandatory field
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGermanyDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Ghana form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsGhanaDirectSubmitpostive')
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
  
  # Get Audits for with other Currency without Mandatory field
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGhanaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Greece form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsGreeceDirectSubmitpostive')
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
  
  # Get Audits for with other Currency without Mandatory field
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGreeceDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Guatemala form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsGuatemalaDirectSubmitpostive')
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
  
  # Get Audits for with other Currency without 9 digit Beneficiary Tax ID
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGuatemalaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  # Get Audits for with with other Currency without 9 digit Beneficiary Tax ID
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGuatemalaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Guyana form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsGuyanaDirectSubmitpostive')
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
  
  # Get Audits for with other Currency without 9 digit Beneficiary Tax ID
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGuyanaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  # Get Audits for with other Currency without 9 digit Beneficiary Tax ID
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsGuyanaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Haiti form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsHaitiDirectSubmitpostive')
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
  
  # Get Audits for with other Currency without Mandatory field
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHaitiDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  # Get Audits for with other Currency with Mandatory fields
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHaitiDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Honduras form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsHondurasDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHondurasDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
   
  Scenario: Audits for Hongkong form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsHongkongDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHongkongDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Hungary form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsHungaryDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsHungaryDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
    
    Scenario: Audits for Indonesia form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsIndonesiaDirectSubmitpostive')
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
  
  # Get Audits for with other Currency without Mandatory field
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsIndonesiaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  # Get Audits for with other Currency with Mandatory fields
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsIndonesiaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
    
  Scenario: Audits for Ireland form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsIrelandDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsIrelandDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Israel form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsIsraelDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsIsraelDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Italy form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsItalyDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsItalyDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Jamaica form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsJamaicaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsJamaicaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Japan form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsJapanDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsJJapanDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Jordan form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsJordanDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsJordanDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Kenya form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsKenyaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsKenyaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Kuwait form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsKuwaitDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsKuwaitDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Laos form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsLaosDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLaosDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Latvia form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsLatviaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLatviaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Lebanon form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsLebanonDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLebanonDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Lithuania form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsLithuaniaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLithuaniaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Luxembourg form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsLuxembourgDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsLuxembourgDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Malaysia form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsMalaysiaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMalaysiaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  
  Scenario: Audits for Malta form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsMaltaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMaltaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Mauritius form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsMauritiusDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMauritiusDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Mexico form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsMexicoDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMexicoDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
   Scenario: Audits for Mongolia form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsMongoliaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMongoliaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
   Scenario: Audits for Morocco form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsMoroccoDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsMoroccoDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
    Scenario: Audits for Nertherlands form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsNertherlandsDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNertherlandsDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  
    Scenario: Audits for NewZealand form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsNewZealandDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNewZealandDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  
    Scenario: Audits for Nicaragua form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsNicaraguaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNicaraguaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
   Scenario: Audits for Nigeria form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsNigeriaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNigeriaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Norway form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsNorwayDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsNorwayDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
   Scenario: Audits for Oman form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsOmanDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsOmanDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Pakistan form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsPakistanDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPakistanDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Panama form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsPanamaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPanamaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
   Scenario: Audits for paraguay form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsparaguayDirectSubmitpostive')
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
  
  
    Scenario: Audits for Peru form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsPeruDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPeruDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
    Scenario: Audits for Phillippines form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsPhillippinesDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPhillippinesDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
    Scenario: Audits for Poland form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsPolandDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPolandDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
    Scenario: Audits for Portugal form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsPortugalDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsPortugalDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
    Scenario: Audits for Qatar form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsQatarDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsQatarDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Romania form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsRomaniaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsRomaniaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Saudiarabia form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsSaudiarabiaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSaudiarabiaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
   Scenario: Audits for Senegal form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsSenegalDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSenegalDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
   Scenario: Audits for Serbia form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsSerbiaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSerbiaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Singapore form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsSingaporeDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSingaporeDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
   Scenario: Audits for Slovakia form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsSlovakiaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSlovakiaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
   Scenario: Audits for Slovania form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsSlovaniaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSlovaniaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for SouthAfrica form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsSouthAfricaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSouthAfricaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
   Scenario: Audits for SouthKorea form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsSouthKoreaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSouthKoreaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
   Scenario: Audits for Spain form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsSpainDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSpainDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Srilanka form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsSrilankaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSrilankaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Sweden form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsSwedenDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSwedenDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Switzerland form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsSwitzerlandDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsSwitzerlandDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for TandCIslands form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsTandCIslandsDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTandCIslandsDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Tanzania form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsTanzaniaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTanzaniaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
   Scenario: Audits for Thailand form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsThailandDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsThailandDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for TrinidadAndTobago form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsTrinidadAndTobagoDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTrinidadAndTobagoDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Tunisia form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsTunisiaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTunisiaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Turkey form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsTurkeyDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsTurkeyDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Uganda form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsUgandaDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUgandaDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Unitedarabemirates form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsUnitedarabemiratesDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUnitedarabemiratesDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Unitedkingdom form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsUnitedkingdomDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUnitedkingdomDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Unitedstates form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsUnitedstatesDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUnitedstatesDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  Scenario: Audits for Uruguay form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsUruguayDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsUruguayDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  
  Scenario: Audits for Vietnam form Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('GetAuditsVietnamDirectSubmitpostive')
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
	 * def getReferenceNumberothercurrency = jutil.GetData('GetAuditsVietnamDirectSubmitothercurrency')
 * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')
 	* getAudits.params.Payload.reference = getReferenceNumberothercurrency
	* getAudits.params.Api.Credential = testData.Visa_CK.Credential
  * getAudits.params.Api.deviceId = testData.Visa_CK.keyId
    * def audits = signsreq(getAudits,user)
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
  
  