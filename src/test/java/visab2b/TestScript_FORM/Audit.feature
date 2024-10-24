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
  * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
  
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
  * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
  
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
  * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
  
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
  * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
  
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
  * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
  
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
  * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
  
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
  * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
  
  
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
  * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
  
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
  * match visaresponse.responseList[0].reasonDesc = " Payment Processing successful."
  