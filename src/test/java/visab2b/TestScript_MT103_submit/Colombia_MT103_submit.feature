Feature: COLOMBIA_MT103_submit

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jutil = Java.type('visab2b.Drivers.Addons')
* def arg = jutil.PLtoken()
* def email = arg.slice(6,10)
* def orgName = arg.slice(5,10)
* def Accno = arg.slice(3,10)
* print Accno

  #######Maker user intiate the transaction
 Scenario: Transaction initated for COLOMBIA currency with 9 digit Beneficiary Tax ID
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
  * print finalMt103
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
	* jutil.SetData("GetAuditsColombiaDirectSubmitpostive",referencenumber)
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
	* match response.result.message == "Approved successfully"
	
	#######Maker user intiate the transaction
 Scenario: Transaction initated for COLOMBIA currency with 10 digit Beneficiary Tax ID
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber ).replaceAll(":77B:/INN/112233445", ":77B:/INN/1122334455" )
  * print finalMt103
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
	* jutil.SetData("GetAuditsColombiaDirectSubmitpostive",referencenumber)
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
	* match response.result.message == "Approved successfully"
	
	#### Maker user intiate the transaction
 Scenario: Initiate the transaction with other Currency with 10 digit Beneficiary Tax ID
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber ).replaceAll(":70:/POP/payment of purpose COLOMBIA", ":70:").replaceAll(":77B:/INN/112233445", ":77B:/INN/1122334455" ).replaceAll("59:/689007547034666", "59:/7098765433"  ).replaceAll(":32A:200408COP18.28", ":32A:200408ALL138.28")
  * print finalMt103
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
	#* match response.result contains {message:"Summary: (1 of 1 files accepted)"},id:"1"}
	* jutil.SetData("GetAuditsColombiaDirectSubmitothercurrency",referencenumber)
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
	* match response.result.message == "Approved successfully"
	
	#### Maker user intiate the transaction
 Scenario: Initiate the transaction with other Currency without 10 digit Beneficiary Tax ID
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber ).replaceAll(":70:/POP/payment of purpose COLOMBIA", ":70:").replaceAll(":77B:/INN/112233445", ":77B:/INN/1122334455" ).replaceAll("59:/689007547034666", "59:/7098765433"  ).replaceAll(":32A:200408COP18.28", ":32A:200408ALL138.28")
  * print finalMt103
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
	#* match response.result contains {message:"Summary: (1 of 1 files accepted)"},id:"1"}
	* jutil.SetData("GetAuditsColombiaDirectSubmitothercurrency",referencenumber)
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
	* match response.result.message == "Approved successfully"
	
	Scenario: Transaction with end to end identification already exists
	* def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
	* def duplref = jutil.GetData('Duplicaterefnumber')
	* print duplref
	* def finalMt103 = content.replaceAll("20:MT103COLOMBIA202401040001", "20:" + duplref )
  * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "Transaction with end to end identification already exists"
	* match response.result.fileAudits[0].reference == duplref
* match response.result.fileAudits[0].status == "FAILED"
	

  
  Scenario: DebtorAccountNumber as Empty
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":50K:/9100910001", "50K:"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
   * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "Parameter 'DebtorAccountNumber' cannot be null."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
    Scenario: DebtorAccountName as Empty
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "").replaceAll("840 MASSACHUSETTS ST", "").replaceAll("LAWRENCE, KS 66044, USA", "").replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
   * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "Parameter 'DebtorName' cannot be null."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
  Scenario: Invaild or not existing debitor account
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "MT103BHARAINSFTPANY202403260001" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":50K:/9100910001", ":50K:43234344"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
   * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "Contains invalid/non-existent account"
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
  
  Scenario: Company name and account number does not match
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103BHARAINSFTPANYSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "JIXEN"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
   * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "Company name doesn't match"
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
  
  Scenario: Invaild currency
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103BHARAINSFTPANYSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":32A:200408COP18.28", ":32A:200408ABC138.28"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber ).replaceAll(":70:/POP/Payment as agreed COLOMBIA", ":70:/PPC/CBP")
   * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "Invalid Currency"
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
  Scenario: Creditor Bic as Empty
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
	 * def finalMt103 = content.replaceAll("57A:BCTOCOBBXXX", "57A:"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
   * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "CreditorAgentBic/CreditorAgentClearingMemberID is cannot be empty"
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
	
	
Scenario: Creditor Bic as Invaild
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("57A:BCTOCOBBXXX", "57A:ABC"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
   * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "Creditor BIC invalid."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
  
   
  
  Scenario: Creditor Bic less than 8 character
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("57A:BCTOCOBBXXX", "57A:ABCIBHB"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
   * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "Creditor BIC invalid."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
  Scenario: Creditor Bic More than 11 character
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":57A:BCTOCOBBXXX", "57A:BCTOCOBBXXXV"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
   * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "CreditorAgentBic/CreditorAgentClearingMemberID is cannot be empty"
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
  Scenario: Creditor Account/IBAN  as Empty
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("59:/689007547034666", "59:"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
   * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "CreditorAccountNumber/CreditorIBAN is cannot be empty"
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
    Scenario:  Beneficiary ID as Empty
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("77B:/INN/1122334455", "77B:/INN/"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
   * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "Parameter 'CreditorTaxID' cannot be null."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
  
  Scenario:  Beneficiary ID more than 10 digit
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("72:/INN/112233445", "72:/INN/11223344556"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
   * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "Creditor TaxId must be 9 or 10-numeric."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
  Scenario:  Beneficiary ID less than 9 digit
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":77B:/INN/112233445", "77B:/INN/11223344"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
   * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "Creditor TaxId must be 9 or 10-numeric."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
  Scenario:  Phone number as Empty
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("/PHN/+1-8099087766", "/PHN/"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
   * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "Parameter 'CreditorContactPhoneNumber' cannot be null."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
  Scenario:  Phone number without ISD code
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("/PHN/+1-8099087766", "/PHN/8099087766"  ).replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
   * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "Creditor Contact Phone Number must be starts with + and followed by dialing code,- and numeric digits."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
  

  
    
  
  Scenario: Payment Purpose  as Empty
  * def content = read('classpath:visab2b/MT103_files/COLOMBIA.txt')
  * def referencenumber = "AUTOMT103COLOMBIASUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":70:/POP/payment of purpose COLOMBIA", ":70:").replaceAll("20:MT103COLOMBIA202401040001", "20:" + referencenumber )
   * print finalMt103
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
	* match response.result contains {message:"Summary: (0 of 1 files accepted)"},id:"1"}
	
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
	* match response.result.fileAudits[0].error == "Parameter 'PaymentPurpose' cannot be null."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  

  
  
 
  