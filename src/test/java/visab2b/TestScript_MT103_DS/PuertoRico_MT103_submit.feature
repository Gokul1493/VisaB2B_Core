Feature: PuertoRico_MT103

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
  * def content = read('classpath:visab2b/MT103_files/PuertoRico.txt')
  * def referencenumber = "Autopuerto001" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll(":20:Autopuerto001", ":20:" + referencenumber )
  * print finalMt103
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "PUERTORICO.txt"
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
	* print response
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


Scenario: Transaction with end to end identification already exists
	* def content = read('classpath:visab2b/MT103_files/PUERTORICO.txt')
	* def duplref = jutil.GetData('Duplicaterefnumber')
	* print duplref
	* def finalMt103 = content.replaceAll(":20:Autopuerto001", ":20:" + duplref )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "PUERTORICO.txt"
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
	 * def content = read('classpath:visab2b/MT103_files/PUERTORICO.txt')
	 * def referencenumber = "Autopuerto001" + Accno
  * print referencenumber
	 * def finalMt103 = content.replaceAll(":57A:FBPRPRSJXXX", ""  ).replaceAll(":20:Autopuerto001", ":20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "PUERTORICO.txt"
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
	 * def content = read('classpath:visab2b/MT103_files/PUERTORICO.txt')
	 * def referencenumber = "Autopuerto001" + Accno
  * print referencenumber
	 * def finalMt103 = content.replaceAll(":57A:FBPRPRSJXXX", ":57A:ABC"  ).replaceAll(":20:Autopuerto001", ":20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "PUERTORICO.txt"
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
	 * def content = read('classpath:visab2b/MT103_files/PUERTORICO.txt')
	 * def referencenumber = "Autopuerto001" + Accno
  * print referencenumber
	 * def finalMt103 = content.replaceAll(":50K:9100910001", ""  ).replaceAll(":20:Autopuerto001", ":20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "PUERTORICO.txt"
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
	* def content = read('classpath:visab2b/MT103_files/PUERTORICO.txt')
	* def referencenumber = "Autopuerto001" + Accno
  * print referencenumber
	* def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "PUERTORICO.txt"
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
  * def content = read('classpath:visab2b/MT103_files/PUERTORICO.txt')
  * def referencenumber = "AUTOMT103SFTPALBENIA" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":32A:240529USD10", ":32A:200408138.28"  ).replaceAll(":20:Autopuerto001", ":20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "PUERTORICO.txt"
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

Scenario: CreditorIBAN/AccountNumber as Empty
	* def content = read('classpath:visab2b/MT103_files/PUERTORICO.txt')
		* def referencenumber = "Autopuerto001" + Accno
  * print referencenumber
	* def finalMt103 = content.replaceAll("59:45648754546874", ""  ).replaceAll(":20:Autopuerto001", ":20:" + referencenumber )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "PUERTORICO.txt"
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
	

  
Scenario: Transaction initated for angola country with different currency  (currency:- USD)
  * def content = read('classpath:visab2b/MT103_files/PUERTORICO.txt')
  * def referencenumber = "MT103SFTPPuertoRico" + Accno
  * print referencenumber
* def finalMt103 = content.replaceAll(":20:Autopuerto001", ":20:" + referencenumber ).replaceAll(":32A:240529USD10", ":32A:200408USD138.28")
  * print finalMt103
	* def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "PUERTORICO.txt"
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
 * match response.result.message == "Approved successfully"