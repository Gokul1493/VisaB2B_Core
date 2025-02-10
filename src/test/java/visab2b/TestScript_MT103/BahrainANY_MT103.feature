Feature: Bahrain_MT103_ANY

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

Scenario: Transaction initated for bahrain country with different currency  (currency:- USD)
  * def content = read('classpath:visab2b/MT103_files/BAHRAIN_ANY.txt')
  * def referencenumber = "MT103BHARAINSFTPANY24" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103BHARAINSFTPANY202403260001", "20:" + referencenumber )
  * print finalMt103
  * jutil.SetData("GetAuditsBahrainacmt103rspostive",referencenumber)
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "BAHRAIN_ANY.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.result.transaction contains {creditDebitIndicator:'Debit'}
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "BAHRAIN_ANY.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.result contains {message:"Summary: (1 of 1 files accepted)"},id:"1"}
	* jutil.SetData("Duplicaterefnumber",referencenumber)
	* print jutil.SetData('Duplicaterefnumber',referencenumber)

	
	* def sleep = function(millis){ java.lang.Thread.sleep(millis) }
  * eval sleep(30000)
	### Checker user approve transaction
	## Step1 == get the transaction id
	 * def user = testData.Visa_CK
	Given url QaUrl + 'api'
	* def GettransactionID = read('classpath:visab2b/Payload/getapprove_transactionid.json')
	* GettransactionID.params.Payload.EndToEndIdentification = referencenumber
	* GettransactionID.params.Api.Credential = testData.Visa_CK.Credential
  * GettransactionID.params.Api.deviceId = testData.Visa_CK.keyId
  * def value = signsreq(GettransactionID,user)
	And request value
	When method POST
	Then status 200
	* def transactionID = response.result.transactions[0].id
	* print transactionID
	## Step2 == approve the payment
	* def user = testData.Visa_CK
	Given url QaUrl + 'api'
	* def approvetrasnaction = read('classpath:visab2b/Payload/approve_payment.json')
	* approvetrasnaction.params.Payload.transactionId = transactionID
	* approvetrasnaction.params.Api.Credential = testData.Visa_CK.Credential
  * approvetrasnaction.params.Api.deviceId = testData.Visa_CK.keyId
	* def value = signsreq(approvetrasnaction,user)
	And request value
	When method POST
	Then status 200
 * match response.result.message == validations.successMessage
 

  
 

Scenario: Transaction with end to end identification already exists
	* def content = read('classpath:visab2b/MT103_files/BAHRAIN_ANY.txt')
	* def duplref = jutil.GetData('Duplicaterefnumber')
	* print duplref
	* def finalMt103 = content.replaceAll("20:MT103BHARAINSFTPANY202403260001", "20:" + duplref )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "BAHRAIN_ANY.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.EndtoEndID
	
Scenario: Transaction with end to end as Empty
	* def content = read('classpath:visab2b/MT103_files/BAHRAIN_ANY.txt')
	* def finalMt103 = content.replaceAll("20:MT103BHARAINSFTPANY202403260001", "20:"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "BAHRAIN_ANY.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_End2EndID
	
	 Scenario: Payment Purpose Code as Empty
	* def content = read('classpath:visab2b/MT103_files/BAHRAIN_ANY.txt')
	* def ppc = 
	* def finalMt103 = content.replaceAll("70:/PPC/CBP", "70:")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "BAHRAIN_ANY.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.EmptyPaymentPurposeCode
	
	Scenario: Payment Purpose Code as two character
	* def content = read('classpath:visab2b/MT103_files/BAHRAIN_ANY.txt')
	* def ppc = 
	* def finalMt103 = content.replaceAll("70:/PPC/CBP", "70:/PPC/CB")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "BAHRAIN_ANY.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Invalid_PPCBelow3

Scenario: DebtorAccountNumber as Empty
	 * def content = read('classpath:visab2b/MT103_files/BAHRAIN_BHD.txt')
	 * def finalMt103 = content.replaceAll(":50K:/9100910001", ":50K:"  )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "BAHRAIN_BHD.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 * match response.error.message contains validations.MT103_Empty_AccNumber
	
Scenario: DebtorName as Empty
	* def content = read('classpath:visab2b/MT103_files/BAHRAIN_ANY.txt')
	* def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "").replaceAll("840 MASSACHUSETTS ST,", "").replaceAll("LAWRENCE, KS 66044, USA", "")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "BAHRAIN_ANY.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_DebtorName_Address
	
Scenario: Creditor Bic as Empty
	* def content = read('classpath:visab2b/MT103_files/BAHRAIN_ANY.txt')
	* def finalMt103 = content.replaceAll(":57A:ABCIBHBMXXX", ":57A:")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "BAHRAIN_ANY.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_EMPTY_BIC_CMID
	
Scenario: Creditor Bic as Invaild
	* def content = read('classpath:visab2b/MT103_files/BAHRAIN_ANY.txt')
	* def finalMt103 = content.replaceAll(":57A:ABCIBHBMXXX", ":57A:ABCD")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "BAHRAIN_ANY.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.InvalidBic
	

Scenario: CreditorIBAN/AccountNumber as Empty
	* def content = read('classpath:visab2b/MT103_files/BAHRAIN_ANY.txt')
	* def finalMt103 = content.replaceAll("59:/BH67BMAG00001299123456", "59:"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "BAHRAIN_ANY.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_CAccNumber_IBAN
	
Scenario: Purpose of payment(POP)- as Empty
	* def content = read('classpath:visab2b/MT103_files/BAHRAIN_ANY.txt')
	* def finalMt103 = content.replaceAll("70:/PPC/CBP", "70:"  ).replaceAll("20:MT103BHARAINSFTPANY202403260001", "20:MT103SFTPALBENIA" + Accno ).replaceAll(":32A:200408BHD108.28", ":32A:200408USD138.28")
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "BAHRAIN_BHD.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.EmptyPaymentPurposeCode
