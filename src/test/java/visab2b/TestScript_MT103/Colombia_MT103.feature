Feature: COLOMBIA_MT103

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
 Scenario: Positive flow of the transaction with 10 Digit tax ID
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103SFTPCOLOMBIA" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
  * print finalMt103
  * jutil.SetData("GetAuditsColombiamt103rspostive",referencenumber)
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
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
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.result contains {message:"Summary: (1 of 1 files accepted)"},id:"1"}
	* jutil.SetData("Duplicaterefnumber",referencenumber)
	* print jutil.SetData('Duplicaterefnumber',referencenumber)
	* jutil.SetData("getAuditsReferenceNumber",referencenumber)
	
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
	
	
	## Maker user intiate the transaction
 Scenario: Positive flow of the transaction with 9 Digit tax ID
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103SFTPCOLOMBIA" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber ).replaceAll("77B:/INN/1122334455", "77B:/INN/112233445")
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
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
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.result contains {message:"Summary: (1 of 1 files accepted)"},id:"1"}
	* jutil.SetData("Duplicaterefnumber",referencenumber)
	* print jutil.SetData('Duplicaterefnumber',referencenumber)
	* jutil.SetData("getAuditsReferenceNumber",referencenumber)
	
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
	
	Scenario: Transaction initated for COLOMBIA country with different currency  (currency:- USD)
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103SFTPCOLOMBIA" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber ).replaceAll("32A:200408COP18.28", "32A:200408USD138.28").replaceAll("70:/POP/Payment as agreed COLOMBIA", "70:")
  * print finalMt103
  * jutil.SetData("GetAuditsColombiamt103rsothercurrency",referencenumber)
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
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
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.result contains {message:"Summary: (1 of 1 files accepted)"},id:"1"}
	* jutil.SetData("Duplicaterefnumber",referencenumber)
	* print jutil.SetData('Duplicaterefnumber',referencenumber)
  * jutil.SetData("getAuditsReferenceNumberothercurrency",referencenumber) 
	
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

#@ignore
Scenario: Transaction with end to end identification already exists
	* def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	* def duplref = jutil.GetData('Duplicaterefnumber')
	* print duplref
	* def finalMt103 = content.replaceAll("20:MT103COLOMBIA202401040001", "20:" + duplref )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.EndtoEndID
	#@ignore
Scenario: Transaction with end to end as Empty
	* def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	* def finalMt103 = content.replaceAll("20:MT103COLOMBIA202401040001", "20:"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_End2EndID
	#@ignore

Scenario: DebtorAccountNumber as Empty
	 * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	 * def finalMt103 = content.replaceAll("50K:/9100910001", "50K:"  )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 * match response.error.message contains validations.MT103_Empty_AccNumber
	#@ignore
Scenario: DebtorName as Empty
	* def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	* def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "").replaceAll("840 MASSACHUSETTS ST", "").replaceAll("LAWRENCE, KS 66044, USA", "")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_DebtorName_Address
	#@ignore
Scenario: Creditor Bic as Empty
	* def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	* def finalMt103 = content.replaceAll(":57A:BCTOCOBBXXX", ":57A:")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_CBic_CCMID
	#@ignore
Scenario: Creditor Bic as Invaild
	* def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	* def finalMt103 = content.replaceAll(":57A:BCTOCOBBXXX", ":57A:ABCD")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.InvalidBic
	#@ignore
	Scenario: Creditor Bic Less than 8 character
	* def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	* def finalMt103 = content.replaceAll(":57A:BCTOCOBBXXX", ":57A:BBHOBDD")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.InvalidBic
	#@ignore
	Scenario: Creditor Bic MORE THAN 11 CHARACTER
	* def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	* def finalMt103 = content.replaceAll(":57A:BCTOCOBBXXX", ":57A:BCTOCOBBXXXX")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.InvalidBic
	#@ignore

Scenario: CreditorIBAN/AccountNumber as Empty
	* def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	* def finalMt103 = content.replaceAll("59:/689007547034666", "59:"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_CAccNumber_IBAN
	
	Scenario: PhoneNumber as Empty
	* def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	* def finalMt103 = content.replaceAll("/PHN/+1-8099087766", "/PHN/"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.EmptyContactPHNO
	
	Scenario: PhoneNumber without ISD code
	* def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	* def finalMt103 = content.replaceAll("/PHN/+1-8099087766", "/PHN/8099087766"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Invalid_PhNum
	
		Scenario: Removed the /PHN/ in PhoneNumber 
	* def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	* def finalMt103 = content.replaceAll("/PHN/+1-8099087766", "//+1-8099087766"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.EmptyContactPHNO
	
	
	
	#@ignore
Scenario: Purpose of payment(POP)- as Empty
	* def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	* def finalMt103 = content.replaceAll("70:/POP/Purpose of payment	COLOMBIA", "70:"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:AUTOMT103SFTPCOLOMBIA" + Accno )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.EmptyPOP
	
	Scenario: 14-digit Beneficiary Tax ID- as Empty
	* def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	* def finalMt103 = content.replaceAll("72:/INN/1122334455", "72:/INN/"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:AUTOMT103SFTPCOLOMBIA" + Accno )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.EmptyTaxID
	
	Scenario: More than 10-digit Beneficiary Tax ID
	* def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	* def finalMt103 = content.replaceAll("72:/INN/1122334455", "72:/INN/11223344556"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:AUTOMT103SFTPCOLOMBIA" + Accno )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Invalid_TaxID9_10Num
	
	Scenario: Less than 9-digit Beneficiary Tax ID
	* def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	* def finalMt103 = content.replaceAll("72:/INN/1122334455", "72:/INN/11223344"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:AUTOMT103SFTPCOLOMBIA" + Accno )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "COLOMBIA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Invalid_TaxID9_10Num
	
 
 Scenario: Audits for Success Transaction
	 # Get Audits for same currency
	 Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumber = jutil.GetData('getAuditsReferenceNumber')
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
  # Get Audits for different currency
   Given url QaUrl + 'api'
	 * def user = testData.Visa_CK
	 * def getReferenceNumberothercurrency = jutil.GetData('getAuditsReferenceNumberothercurrency')
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
