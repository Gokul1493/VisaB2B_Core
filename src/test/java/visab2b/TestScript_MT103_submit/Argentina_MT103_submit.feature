Feature: ARGENTINA_MT103

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jutil = Java.type('visab2b.Drivers.Addons')
* def arg = jutil.PLtoken()
* def email = arg.slice(6,10)
* def orgName = arg.slice(5,10)
* def Accno = arg.slice(3,10)
* print Accno

 # Maker user intiate the transaction
 Scenario: Positive flow of the transaction
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber )
  * print finalMt103
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.result contains {message:"Summary: (1 of 1 files accepted)"},id:"1"}
	* jutil.SetData("GetAuditsArgentinaDirectSubmitpostive",referencenumber)
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
	* match response.result.message == "Approved successfully"


 ##Account number above the 22 digit
 Scenario: To verify Beneficiary Account number above the 22 digit
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll(":59:/1234567891234554232312", ":59:/65698745265874526854534654675676" ).replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber)
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* print response
	
	 	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Creditor AccountNumber must be 22-numeric."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
## Account number less the 22 digit
 Scenario: To verify Beneficiary Account number less the 22 digit
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll(":59:/1234567891234554232312", ":59:/65698745265874526854" ).replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* print response

	 	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Creditor AccountNumber must be 22-numeric."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber

 ##Account number in alphanumeric the 22 digits
 Scenario: To verify Beneficiary Account number in alphanumeric 22 digit
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll(":59:/1234567891234554232312", ":59:/6ARG98745265874526854").replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* print response

	 	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Creditor AccountNumber must be 22-numeric."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber

# 10-digit Beneficiary Tax ID
 Scenario: To verify Beneficiary Tax ID below 11-digit 
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
  * def taxId = '/INN/1122334455'
  * print taxId
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll("72:/INN/11223344556", "72:" + taxId )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* print response
	
		 	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Creditor TaxId must be 11-numeric."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber

# 12-digit Beneficiary Tax ID
 Scenario: To verify Beneficiary Tax ID above 11-digit 
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
  * def taxId = '/INN/111122334455'
  * print taxId
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll("72:/INN/11223344556", "72:" + taxId )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* print response

	 	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Creditor TaxId must be 11-numeric."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber

#  Beneficiary Tax ID as empty
 Scenario: To verify Beneficiary Tax ID as empty
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll("72:/INN/11223344556", "72:"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* print response

	 	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Parameter 'CreditorTaxID' cannot be null."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber

#  Without tag name in Beneficiary Tax ID 
 Scenario: To verify without TAG name in Beneficiary Tax ID 
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
  * def taxId = '/111122334455'
  * print taxId
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll("72:/INN/11223344556", "72:" + taxId )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* print response

	 	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Parameter 'CreditorTaxID' cannot be null."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber

#  Without tag name in phone number
 Scenario: To verify without TAG name in phone number 
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
  * def phoneNo = '/+1-8099087766'
  * print phoneNo
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll("/PHN/+1-8099087766", + phoneNo )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* print response

	 	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Parameter 'CreditorContactPhoneNumber' cannot be null."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber

#  Without proper format in phone number
 Scenario: To verify without proper format phone number
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
  * def phoneNo = '/PHN/8099087766'
  * print phoneNo
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll("/PHN/+1-8099087766", + phoneNo )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* print response

	 	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Parameter 'CreditorContactPhoneNumber' cannot be null."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber

#  phone number field as empty
 Scenario: To verify phone number field as empty
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll("/PHN/+1-8099087766", ""  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* print response

	 	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Parameter 'CreditorContactPhoneNumber' cannot be null."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber

Scenario: Transaction with end to end identification already exists
	* def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	* def duplref = jutil.GetData('Duplicaterefnumber')
	* print duplref
	* def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + duplref )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	
		### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = duplref
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Transaction with end to end identification already exists"
	* match response.result.fileAudits[0].reference == duplref
* match response.result.fileAudits[0].status == "FAILED"
	
	
Scenario: Creditor Bic as Empty
	 * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	   * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
	 * def finalMt103 = content.replaceAll(":57A:NACNARBAXXX", ":57A:"  ).replaceAll(":20:MT103ARGENTINA3465872", ":20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
     * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 
	
		### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "CreditorAgentBic/CreditorAgentClearingMemberID is cannot be empty"
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
	 
	  Scenario: Creditor Bic as Invaild
	 * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	   * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
	 * def finalMt103 = content.replaceAll(":57A:NACNARBAXXX", ":57A:ABC"  ).replaceAll(":20:MT103ARGENTINA3465872", ":20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 
	 	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Creditor BIC invalid."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
Scenario: DebtorAccountNumber as Empty
	 * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	   * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
	 * def finalMt103 = content.replaceAll(":50K:/9100910001", "50K:"  ).replaceAll(":20:MT103ARGENTINA3465872", ":20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200

	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Parameter 'DebtorAccountNumber' cannot be null."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
Scenario: DebtorName as Empty
	* def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	  * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
	* def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "").replaceAll("840 MASSACHUSETTS ST", "").replaceAll("LAWRENCE, KS 66044, USA", "").replaceAll(":20:MT103ARGENTINA3465872", ":20:" + referencenumber )
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200

	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Parameter 'DebtorName' cannot be null."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
	Scenario: Instructed currency as Empty
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPALBENIA" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":32A:200408ARS138.28", ":32A:200408138.28"  ).replaceAll(":20:MT103ARGENTINA3465872", ":20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	
	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Instructed Currency must be 3 alpha."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber

  Scenario: Invaild or not existing debitor account
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPALBENIA" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":50K:/9100910001", ":50K:43234344"  ).replaceAll(":20:MT103ARGENTINA3465872", ":20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	
	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Contains invalid/non-existent account"
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
   Scenario: Company name and account number does not match
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPALBENIA" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "JIXEN"  ).replaceAll(":20:MT103ARGENTINA3465872", ":20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	
	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Company name doesn't match"
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
    Scenario: Invaild currency
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPALBENIA" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":32A:200408ARS138.28", ":32A:200408ABC138.28"  ).replaceAll(":20:MT103ARGENTINA3465872", ":20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	
	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Invalid Currency"
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber



Scenario: CreditorIBAN/AccountNumber as Empty
	* def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	  * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
	* def finalMt103 = content.replaceAll(":59:/1234567891234554232312", ""  ).replaceAll(":20:MT103ARGENTINA3465872", ":20:" + referencenumber )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200

	### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "CreditorAccountNumber/CreditorIBAN is cannot be empty"
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
Scenario: Purpose of payment(POP)- as Empty
	* def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	  * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
	* def finalMt103 = content.replaceAll("70:/POP/Payment as agreed for Argentina", "70:"  ).replaceAll(":20:MT103ARGENTINA3465872", ":20:" + referencenumber )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	
		### match audit error message in UI	
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/audit_files.json')
	* print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.reference = referencenumber
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
		* print response
	* match response.result.fileAudits[0].error == "Parameter 'PaymentPurpose' cannot be null."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
	
Scenario: Transaction initated for Argentina country with different currency  (currency:- USD)
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "MT103SFTPARGENTINA" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll(":32A:200408ARS138.28", ":32A:200408USD138.28").replaceAll("70:/POP/Payment as agreed for Argentina", "70:"  )
  * print finalMt103
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.result contains {message:"Summary: (1 of 1 files accepted)"},id:"1"}
	* jutil.SetData("GetAuditsArgentinaDirectSubmitothercurrency",referencenumber)
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
 * match response.result.message == "Approved successfully"