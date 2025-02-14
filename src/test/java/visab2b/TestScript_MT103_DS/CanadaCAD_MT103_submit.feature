Feature: CANADACAD_MT103_submit

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jutil = Java.type('visab2b.Drivers.Addons')
* def arg = jutil.PLtoken()
* def email = arg.slice(6,10)
* def orgName = arg.slice(5,10)
* def Accno = arg.slice(3,10)
* print Accno

  #######Maker user intiate the transaction
 Scenario: Transaction initated for CANADACAD currency with BIC only
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber ).replaceAll(":57D://CC123456789", ":57D://AC12345678"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.result contains {message:"Summary: (1 of 1 files accepted)"},id:"1"}
	* jutil.SetData("GetAuditsCanadaCADDirectSubmitpostiveBIC",referencenumber)
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
 Scenario: Transaction initated for CANADACAD currency with clearing Member ID only
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber ).replaceAll(":57A:ACFXCAW1XXX", ":57A:"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.result contains {message:"Summary: (1 of 1 files accepted)"},id:"1"}
	* jutil.SetData("GetAuditsCanadaCADDirectSubmitpostiveClearingID",referencenumber)
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
 Scenario: Transaction initated for CANADACAD currency with BIC and clearing Member ID only
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.result contains {message:"Summary: (1 of 1 files accepted)"},id:"1"}
	* jutil.SetData("GetAuditsCanadaCADDirectSubmitpostiveBICandClearingId",referencenumber)
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
 Scenario: Initiate the transaction with other Currency with BIC only
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber ).replaceAll(":57D://CC123456789", ":57D://").replaceAll("59:/68539007034666", "59:/7098765433"  ).replaceAll(":32A:200408CAD18.28", ":32A:200408ALL138.28")
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	#* match response.result contains {message:"Summary: (1 of 1 files accepted)"},id:"1"}
	* jutil.SetData("GetAuditsCanadaCADDirectSubmitothercurrencyBIConly",referencenumber)
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
	
	
	Scenario: Initiate the transaction with other Currency with Clearing Member Id only
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber ).replaceAll(":57A:ACFXCAW1XXX", ":57A:"  ).replaceAll("59:/68539007034666", "59:/7098765433"  ).replaceAll(":32A:200408CAD18.28", ":32A:200408ALL138.28")
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	#* match response.result contains {message:"Summary: (1 of 1 files accepted)"},id:"1"}
	* jutil.SetData("GetAuditsCanadaCADDirectSubmitothercurrencyClearingMemberIdonly",referencenumber)
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
	* def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
	* def duplref = jutil.GetData('Duplicaterefnumber')
	* print duplref
	* def finalMt103 = content.replaceAll("20:MT103CANADACAD20243103001", "20:" + duplref )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
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
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":50K:/9100910001", "50K:"  ).replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
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
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "").replaceAll("840 MASSACHUSETTS ST", "").replaceAll("LAWRENCE, KS 66044, USA", "").replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
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
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":50K:/9100910001", ":50K:43234344"  ).replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
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
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "JIXEN"  ).replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
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
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":32A:200408CAD18.28", ":32A:200408ABC138.28"  ).replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber ).replaceAll(":70:/POP/purpose of payment COMBODIA", ":70:/PPC/CBP")
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
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
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
	 * def finalMt103 = content.replaceAll("57A:ACFXCAW1XXX", "57A:"  ).replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
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
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("57A:ACFXCAW1XXX", "57A:ABC"  ).replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
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
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("57A:ACFXCAW1XXX", "57A:ABCIBHB"  ).replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
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
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":57A:ACFXCAW1XXX", "57A:ACFXCAW1XXXV"  ).replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
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
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("59:/68539007034666", "59:"  ).replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
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
  
  
  Scenario: Beneficiary Transit Code  as Empty
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":57D://CC123456789", ":57D://"  ).replaceAll("::57A:ACFXCAW1XXX", "::57A:"  ).replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
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
  
  
  Scenario: Removed the CC infront of Beneficiary Transit Code 
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":57D://CC123456789", ":57D://123456789"  ).replaceAll("::57A:ACFXCAW1XXX", "::57A:"  ).replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
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
  
  Scenario: WRONG Beneficiary Transit Code 
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":57D://CC123456789", ":57D://AC123456789"  ).replaceAll("::57A:ACFXCAW1XXX", "::57A:"  ).replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
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
  
  Scenario:  Beneficiary Transit Code more than 9 digit
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":57D://CC123456789", ":57D://AC1234567891"  ).replaceAll("::57A:ACFXCAW1XXX", "::57A:"  ).replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
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
  
  
  Scenario:  Beneficiary Transit Code less than 9 digit
  * def content = read('classpath:visab2b/MT103_files/CANADACAD.txt')
  * def referencenumber = "AUTOMT103CANADACADSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":57D://CC123456789", ":57D://AC12345678"  ).replaceAll("::57A:ACFXCAW1XXX", "::57A:"  ).replaceAll("20:MT103CANADACAD20243103001", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "CANADACAD.txt"
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
  
   

  
  
  
 
  