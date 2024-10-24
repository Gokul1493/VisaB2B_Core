Feature: Add_OpsChecker_User
Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* def arg = jUtil.PLtoken()
* def email = arg.slice(6,10)
* def orgName = arg.slice(5,10)
* def Accno = arg.slice(3,10)
* print Accno


 Scenario: Creating new admin user
  * def user = testData.Visa
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/add_ITadminuser_ui.json')
  * reqadd.params.Api.Credential = testData.Visa.Credential
  * reqadd.params.Api.deviceId = testData.Visa.keyId
  * reqadd.params.Payload.role = "OPS_CHECKER"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.result == {}