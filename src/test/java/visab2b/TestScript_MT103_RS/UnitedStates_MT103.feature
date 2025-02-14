Feature: UNITEDSTATES_MT103

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

 ## Maker user intiate the transaction
 Scenario: Positive flow of the transaction
  * def content = read('classpath:visab2b/MT103_files/UNITEDSTATES.txt')
  * def referencenumber = "AUTOMT103SFTPUNITEDSTATES" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:2603001SFTPMT10US4234535435465654625212", "20:" + referencenumber )
  * print finalMt103
  * jutil.SetData("GetAuditPositiveUnitedStates",referencenumber)
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
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
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
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
	* def content = read('classpath:visab2b/MT103_files/UNITEDSTATES.txt')
	* def duplref = jutil.GetData('Duplicaterefnumber')
	* print duplref
	* def finalMt103 = content.replaceAll("20:2603001SFTPMT10US4234535435465654625212", "20:" + duplref )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.EndtoEndID
	
Scenario: Transaction with end to end as Empty
	* def content = read('classpath:visab2b/MT103_files/UNITEDSTATES.txt')
	* def finalMt103 = content.replaceAll("20:2603001SFTPMT10US4234535435465654625212", "20:"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_End2EndID
	
Scenario: Creditor Bic as Empty
	 * def content = read('classpath:visab2b/MT103_files/UNITEDSTATES.txt')
	 * def finalMt103 = content.replaceAll(":57A:USBKUS44XXX", ":57A:"  ).replaceAll(":57D:FW123456789", ""  )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 * match response.error.message contains validations.MT103_Empty_CBic_CCMID
	 
	 Scenario: Creditor Bic as Invaild
	 * def content = read('classpath:visab2b/MT103_files/UNITEDSTATES.txt')
	 * def finalMt103 = content.replaceAll(":57A:USBKUS44XXX", ":57A:ABC"  ).replaceAll(":57D:FW123456789", ""  )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 * match response.error.message contains validations.InvalidBic
	 
	
Scenario: DebtorAccountNumber as Empty
	 * def content = read('classpath:visab2b/MT103_files/UNITEDSTATES.txt')
	 * def finalMt103 = content.replaceAll(":50K:/9100910001", "50K:"  )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 * match response.error.message contains validations.MT103_Empty_AccNumber
	
Scenario: DebtorName as Empty
	* def content = read('classpath:visab2b/MT103_files/UNITEDSTATES.txt')
	* def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "").replaceAll("840 MASSACHUSETTS ST", "").replaceAll("LAWRENCE, KS 66044, USA", "")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_DebtorName_Address
	

Scenario: CreditorIBAN/AccountNumber as Empty
	* def content = read('classpath:visab2b/MT103_files/UNITEDSTATES.txt')
	* def finalMt103 = content.replaceAll(":59:/232243546575638476867869", ":59:"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_CAccNumber_IBAN
	
	### Creditor Agent Clearing Member ID
	
	Scenario: To verify the Creditor Agent Clearing Member ID above 9 digit
	* def content = read('classpath:visab2b/MT103_files/UNITEDSTATES.txt')
	* def finalMt103 = content.replaceAll(":57A:USBKUS44XXX", ":57A:"  ).replaceAll(":57D:FW123456789", ":57D:FW1234567890"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.CMIDStartswithAlpha_US
	
	
	Scenario: To verify the Creditor Agent Clearing Member ID below 9 digit
	* def content = read('classpath:visab2b/MT103_files/UNITEDSTATES.txt')
	* def finalMt103 = content.replaceAll(":57A:USBKUS44XXX", ":57A:"  ).replaceAll(":57D:FW123456789", ":57D:FW12345678"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.CMIDStartswithAlpha_US
	
	
	Scenario: To verify the without prefix Creditor Agent Clearing Member ID 
	* def content = read('classpath:visab2b/MT103_files/UNITEDSTATES.txt')
	* def finalMt103 = content.replaceAll(":57A:USBKUS44XXX", ":57A:"  ).replaceAll(":57D:FW123456789", ":57D:123456789"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_CMID_Start2Alpha
	
	
	Scenario: To verify the without Creditor Agent Clearing Member ID  
	* def content = read('classpath:visab2b/MT103_files/UNITEDSTATES.txt')
	* def finalMt103 = content.replaceAll(":57A:USBKUS44XXX", ":57A:"  ).replaceAll(":57D:FW123456789", ":57D:"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_CBic_CCMID
	
	
Scenario: Transaction initated for UnitedStates country with different currency  (currency:- USD)
  * def content = read('classpath:visab2b/MT103_files/UNITEDSTATES.txt')
  * def referencenumber = "AUTOMT103SFTPUNITEDSTATES" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:2603001SFTPMT10US4234535435465654625212", "20:" + referencenumber ).replaceAll(":32A:200408USD138,28", ":32A:200408USD138.28")
  * print finalMt103
  * jutil.SetData("GetAuditCrossBorderUnitedStates",referencenumber)
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
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
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
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
	
	Scenario: Creditor Bic less than 8 digits
	 * def content = read('classpath:visab2b/MT103_files/UNITEDSTATES.txt')
	 * def finalMt103 = content.replaceAll(":57A:USBKUS44XXX", ":57A:ABC"  ).replaceAll(":57D://FW123456789", ""  )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 * match response.error.message contains validations.InvalidBic
	 
	 Scenario: Creditor Bic more than 11 digits
	 * def content = read('classpath:visab2b/MT103_files/UNITEDSTATES.txt')
	 * def finalMt103 = content.replaceAll(":57A:USBKUS44XXX", ":57A:USBKUS44XXXXX"  ).replaceAll(":57D://FW123456789", ""  )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDSTATES.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 * match response.error.message contains validations.InvalidBic


