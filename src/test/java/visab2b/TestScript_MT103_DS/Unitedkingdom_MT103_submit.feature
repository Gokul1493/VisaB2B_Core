Feature: UNITEDKINGDOM_MT103_direct_submit

Background: 
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jutil = Java.type('visab2b.Drivers.Addons')
* def arg = jutil.PLtoken()
* def email = arg.slice(6,10)
* def orgName = arg.slice(5,10)
* def Accno = arg.slice(3,10)
* print Accno

  #####Maker user intiate the transaction
 Scenario: Positive flow of the transaction(BIC & AccountNumber)
  * def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
  * def referencenumber = "AUTOMT103UNITEDKINGDOMSUBMIT" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + referencenumber )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.result contains {message:"Summary: (1 of 1 files accepted)"},id:"1"}
	* jutil.SetData("GetAuditsUnitedkingdomDirectSubmitpostive",referencenumber)
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
	
	
	#####Maker user intiate the transaction
 Scenario: Positive flow of the transaction(Clearing Member Id & AccountNumber)
  * def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
  * def referencenumber = "AUTOMT103UNITEDKINGDOMSUBMIT" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + referencenumber ).replaceAll(":57A:HBUKGB4BXXX", ":57A:" )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
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
	
	
	Scenario: Positive flow of the transaction(BIC & IBAN)
  * def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
  * def referencenumber = "AUTOMT103UNITEDKINGDOMSUBMIT" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + referencenumber ).replaceAll(":59:/331926819", ":59:/GB29NWBK60161331926819"  )
  * print finalMt103
  * def user = testData.Visa_Mk 
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
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


	
	#####Maker user intiate the transaction
 Scenario: Positive flow of the transaction(Clearing Member Id & IBAN)
  * def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
  * def referencenumber = "AUTOMT103UNITEDKINGDOMSUBMIT" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + referencenumber ).replaceAll(":57A:HBUKGB4BXXX", ":57A:" ).replaceAll(":59:/331926819", ":59:/GB29NWBK60161331926819" )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	
	* jutil.SetData("Duplicaterefnumber",referencenumber)
	* print jutil.SetData('Duplicaterefnumber',referencenumber)
	
	
	
	Scenario: Transaction with end to end identification already exists
	* def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
	* def duplref = jutil.GetData('Duplicaterefnumber')
	* print duplref
	* def finalMt103 = content.replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + duplref )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
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
  * def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
  * def referencenumber = "AUTOMT103UNITEDKINGDOMSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":50K:/9100910001", "50K:"  ).replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
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
  * def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
  * def referencenumber = "AUTOMT103UNITEDKINGDOMSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "").replaceAll("840 MASSACHUSETTS ST", "").replaceAll("LAWRENCE, KS 66044, USA", "").replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
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
  
  
	
	
Scenario: Creditor Bic as Invaild
  * def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
  * def referencenumber = "AUTOMT103UNITEDKINGDOMSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":57A:HBUKGB4BXXX", ":57A:ABC"  ).replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
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
  
  Scenario: Instructed currency as Empty
  * def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
  * def referencenumber = "AUTOMT103UNITEDKINGDOMSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":32A:200408GBP138,28", ":32A:200408138,28"  ).replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
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
  * def value = signsreq(reqadd,user)	
	And request value
	When method POST
	Then status 200
	* match response.result.fileAudits[0].error == "Instructed Currency must be 3 alpha."
  * match response.result.fileAudits[0].status == "FAILED"

  Scenario: Invaild or not existing debitor account
  * def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
  * def referencenumber = "AUTOMT103UNITEDKINGDOMSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":50K:/9100910001", ":50K:43234344"  ).replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
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
  * def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
  * def referencenumber = "AUTOMT103UNITEDKINGDOMSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "JIXEN"  ).replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
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
  * def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
  * def referencenumber = "AUTOMT103UNITEDKINGDOMSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll(":32A:200408GBP138,28", ":32A:200408ABC138.28"  ).replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
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
  
  
  
  Scenario: Creditor Account/IBAN  as Empty
  * def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
  * def referencenumber = "AUTOMT103UNITEDKINGDOMSUBMIT" + Accno
  * print referencenumber
	 	 * def finalMt103 = content.replaceAll("59:/331926819", "59:"  ).replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + referencenumber )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
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
  
  
  
  ### Creditor Agent Clearing Member ID
	
	Scenario: To verify the Creditor Agent Clearing Member ID more than 6 digit
	* def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
  * def referencenumber = "AUTOMT103UNITEDKINGDOMSUBMIT" + Accno
  * print referencenumber
	* def finalMt103 = content.replaceAll(":57D://SC123456", ":57D://SC1234567"  ).replaceAll(":57A:HBUKGB4BXXX", ":57A:" ).replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + referencenumber )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
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
	* match response.result.fileAudits[0].error == "Creditor Agent Clearing MemberID must be starts with SC and followed by 6 numeric digit."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
  
	
	
	Scenario: To verify the Creditor Agent Clearing Member ID less than 6 digit
	* def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
  * def referencenumber = "AUTOMT103UNITEDKINGDOMSUBMIT" + Accno
  * print referencenumber
	* def finalMt103 = content.replaceAll(":57D://SC123456", ":57D://SC12345"  ).replaceAll(":57A:HBUKGB4BXXX", ":57A:" ).replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + referencenumber )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
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
	* match response.result.fileAudits[0].error == "Creditor Agent Clearing MemberID must be starts with SC and followed by 6 numeric digit."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
  
	
	
	Scenario: To verify the without prefix Creditor Agent Clearing Member ID 
	* def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
  * def referencenumber = "AUTOMT103UNITEDKINGDOMSUBMIT" + Accno
  * print referencenumber
	* def finalMt103 = content.replaceAll(":57D://SC123456", ":57D:123456").replaceAll(":57A:HBUKGB4BXXX", ":57A:" ).replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + referencenumber )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
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
	* match response.result.fileAudits[0].error == "Creditor Agent Clearing MemberID must start with 2 Alpha."
  * match response.result.fileAudits[0].status == "FAILED"
  * match response.result.fileAudits[0].reference == referencenumber
  
  
  
  
  ## Maker user intiate the transaction
 Scenario: Initiating the transaction with other currency than UNITEDKINGDOM
  * def content = read('classpath:visab2b/MT103_files/UNITEDKINGDOM.txt')
  * def referencenumber = "AUTOMT103UNITEDKINGDOMSUBMIT" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:2603001SFTPMT10GBP202208662378910112", "20:" + referencenumber ).replaceAll(":57D://SC123456", ":57D:" ).replaceAll("59:/331926819", "59:ACCNO7098765433"  ).replaceAll(":32A:200408GBP138,28", ":32A:200408USD138,28")
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "UNITEDKINGDOM.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.result contains {message:"Summary: (1 of 1 files accepted)"},id:"1"}
	* jutil.SetData("GetAuditsUnitedkingdomDirectSubmitothercurrency",referencenumber)
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

