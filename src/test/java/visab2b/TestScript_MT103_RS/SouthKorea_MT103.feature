Feature: SOUTHKOREA_MT103

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
* def referencenumber = "AUTOMT103SFTPSOUTHKOREA" + Accno

 ## Maker user intiate the transaction
 Scenario: Positive flow of the transaction
  * def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
  * def referencenumber = "AUTOMT103SFTPSOUTHKOREA" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:2603001SFTPr000271254012", "20:" + referencenumber )
  * print finalMt103
  * jutil.SetData("GetAuditPositiveSouthKorea",referencenumber)
    * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
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
  * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
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
	* def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
	* def duplref = jutil.GetData('Duplicaterefnumber')
	* print duplref
	* def finalMt103 = content.replaceAll("20:2603001SFTPr000271254012", "20:" + duplref )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.EndtoEndID
	
Scenario: Transaction with end to end as Empty
	* def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
	* def finalMt103 = content.replaceAll("20:2603001SFTPr000271254012", "20:"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_End2EndID
	
Scenario: Creditor Bic as Empty
	 * def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
	 * def finalMt103 = content.replaceAll(":57A:/ANZBKRSXXXX", ":57A:"  )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 * match response.error.message contains validations.EmptyBIC_AZ
	 
	 Scenario: Creditor Bic as Invaild
	 * def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
	 * def finalMt103 = content.replaceAll(":57A:/ANZBKRSXXXX", ":57A:ABC"  )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 * match response.error.message contains validations.InvalidBic
	 
	
Scenario: DebtorAccountNumber as Empty
	 * def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
	 * def finalMt103 = content.replaceAll(":50K:/9100910001", "50K:"  )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 * match response.error.message contains validations.MT103_Empty_AccNumber
	
Scenario: DebtorName as Empty
	* def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
	* def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "").replaceAll("BOLIVIA", "")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_DebtorName_Address
	
	## Clearing Member ID as 3-digit
	
	Scenario: To verify the Clearing Member ID as above 3-digit
	* def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
	* def referencenumber = "AUTOMT103SFTPSOUTHKOREA" + Accno
  * print referencenumber
	* def finalMt103 = content.replaceAll("20:2603001SFTPr000271254012", "20:" + referencenumber ).replaceAll(":57D:/KR654", ":57D:/KR1234").replaceAll(":57A:/ANZBKRSXXXX", ":57A:/ANZBKRSX")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.CMIDLessmorethan3_SK
	
		Scenario: To verify the Clearing Member ID as below 3-digit
	* def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
	* def finalMt103 = content.replaceAll(":57D:/KR654", ":57D:/KR12").replaceAll(":57A:/ANZBKRSXXXX", ":57A:/ANZBKRSX")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.CMIDLessmorethan3_SK
	
		Scenario: To verify the Clearing Member ID without prefix
	* def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
	* def finalMt103 = content.replaceAll(":57D:/KR654", ":57D:/123").replaceAll(":57A:/ANZBKRSXXXX", ":57A:/ANZBKRSX")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.CMIDStartswithAlpha
	
	
		Scenario: To verify the without Clearing Member ID 
	* def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
	* def finalMt103 = content.replaceAll(":57D:/KR654", ":57D:").replaceAll(":57A:/ANZBKRSXXXX", ":57A:/ANZBKRSX")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.CMIDLessmorethan3_SK
	
	##Beneficiary Bank SWIFT BIC11
	
		Scenario: To verify the Beneficiary Bank SWIFT BIC as 11 digit and without BIC
	* def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
	* print referencenumber
	* def finalMt103 = content.replaceAll("20:2603001SFTPr000271254012", "20:" + referencenumber ).replaceAll(":57A:/ANZBKRSXXXX", ":57A://ANZBKRSXXXX").replaceAll(":57D:/KR654", ":57D:")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.result.transaction contains {creditDebitIndicator:'Debit'}
	
	
	
#Duplicate scenario	
	
#		Scenario: To verify the Clearing Member ID without prefix
#	* def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
#	* def finalMt103 = content.replaceAll(":57A:/ANZBKRSXXXX", ":57A:/123")
  #* print finalMt103
  #* def user = testData.Visa_Mk	
  #Given url QaUrl + 'api'
  #* def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  #* print reqadd
  #* reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  #* reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  #* reqadd.params.Payload.swiftFiles[0].file = finalMt103
  #* reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
  #* def value = signsreq(reqadd,user)
#	And request value
#	When method POST
#	Then status 200
#	* match response.error.message contains validations.MT103_Empty_DebtorName_Address
	
#	Duplicate scenario
#		Scenario: To verify the without Clearing Member ID 
#	* def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
#	* def finalMt103 = content.replaceAll(":57A:/ANZBKRSXXXX", "")
  #* print finalMt103
  #* def user = testData.Visa_Mk	
  #Given url QaUrl + 'api'
  #* def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  #* print reqadd
  #* reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  #* reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  #* reqadd.params.Payload.swiftFiles[0].file = finalMt103
  #* reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
  #* def value = signsreq(reqadd,user)
#	And request value
#	When method POST
#	Then status 200
#	* match response.error.message contains validations.MT103_Empty_DebtorName_Address
	
	
## Beneficiary Contact Phone Number
Scenario: To verify the Beneficiary Contact Phone Number as empty
		* def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
	* def finalMt103 = content.replaceAll("/PHN/+1-545648756", "")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_CCPhoneNumber
	
	
	Scenario: To verify the Beneficiary Contact Phone Number without prefix
		* def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
	* def finalMt103 = content.replaceAll("/PHN/+1-545648756", "/+1-8099087766")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_CCPhoneNumber

Scenario: CreditorIBAN/AccountNumber as Empty
	* def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
	* def finalMt103 = content.replaceAll(":59:/485278645312645", ":59:"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_CAccNumber_IBAN
	
	Scenario: Purpose of payment(POP)- as Empty
	* def content = read('classpath:visab2b/MT103_files/SERBIA.txt')
	* def finalMt103 = content.replaceAll(":70:/POP/testing SERBIA", ":70:"  ).replaceAll("20:2603001SFTPMT10RSD20220867557563662121", "20:MT103SFTPPANAMA" + Accno )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "SERBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.EmptyPOP
	
	
Scenario: Transaction initated for SouthKorea country with different currency  (currency:- USD)
  * def content = read('classpath:visab2b/MT103_files/SOUTHKOREA.txt')
  * def referencenumber = "AUTOMT103SFTPSOUTHKOREA" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:2603001SFTPr000271254012", "20:" + referencenumber ).replaceAll(":32A:240312KRW10.22", ":32A:200408USD138.28").replaceAll(":77B:/POP/purpose of payment", "70:"  )
  * print finalMt103
  * jutil.SetData("GetAuditCrossBorderSouthKorea",referencenumber)
    * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
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
  * reqadd.params.Payload.swiftFiles[0].fileName = "SOUTHKOREA.txt"
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


