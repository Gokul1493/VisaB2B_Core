Feature: AddCompany
Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jUtil = Java.type('visab2b.Drivers.Addons')
* def arg = jUtil.PLtoken()
* def email = arg.slice(6,10)
* def orgName = arg.slice(5,10)
* def Accno = arg.slice(3,10)
* print Accno

 Scenario: Creating a new company
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/add_company_ui.json')
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
  * match response.result contains{message:"Company added successfully"}
  * def companyid = response.result.id
  * print companyid  