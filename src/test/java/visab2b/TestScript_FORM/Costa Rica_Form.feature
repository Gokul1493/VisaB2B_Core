Feature: swift_file_transfer_Form_albania

Background: 
* def validation_Messages = read('classpath:visab2b/TestData/Validation.json')
* def validations = validation_Messages.Validations
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jutil = Java.type('visab2b.Drivers.Addons')
* def arg = jutil.PLtoken()
* def email = arg.slice(6,10)
* def orgName = arg.slice(5,10)
* def Accno = arg.slice(3,10)
* def country = "COSTARICA"
* print Accno

 	
 ## Maker user intiate the transaction
 Scenario: Positive flow of the transaction
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
* reqadd.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* reqadd.params.Payload.InstructedAmount.Currency = "CRC"
* reqadd.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* reqadd.params.Payload.CreditorAccount.TaxId = "012345678901"
* reqadd.params.Payload.PaymentPurpose = "Payment as Agreed"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
 And request value
 When method POST
 Then status 200
 * def requestMessage = response.result.transaction.requestMessage
 * print requestMessage
 * def referencenumber = reqadd.params.Payload.EndToEndIdentification
 * print referencenumber
 
 ## submit the transaction
  Given url QaUrl + 'api'
  * def approve = read('classpath:visab2b/Payload/form_swift_file.json')
  * print approve
  * approve.params.Api.Credential = testData.Visa_Mk.Credential
  * approve.params.Api.deviceId = testData.Visa_Mk.keyId
  * approve.params.Payload.swiftFiles[0].file = requestMessage
  * def value = signsreq(approve,user)
 And request value
 When method POST
 Then status 200
 * jutil.SetData("GetAuditPositive_Costa Rica",referencenumber)
 * jutil.SetData("Duplicaterefnumber",referencenumber)
	* print jutil.SetData('Duplicaterefnumber',referencenumber)
	
	
	
  
	### Checker user approve transaction
	## Step1 == get the transaction id
	 * def user = testData.Visa_CK
	Given url QaUrl + 'api'
	* def GettransactionID = read('classpath:visab2b/Payload/getapprove_transactionid.json')
	* GettransactionID.params.Payload.EndToEndIdentification = 	referencenumber
	* GettransactionID.params.Api.Credential = testData.Visa_CK.Credential
  * GettransactionID.params.Api.deviceId = testData.Visa_CK.keyId
  * def value = signsreq(GettransactionID,user)
	And request value
	When method POST
	Then status 200
	* def transactionID = response.result.transactions[0].id
	* print transactionID
	## Step2 == approve the payment
* def sleep = function(millis){ return java.lang.Thread.sleep(millis) }
    * eval sleep(25000)
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
   * def duplref = jutil.GetData('Duplicaterefnumber')
	 * print duplref
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
   * print reqadd
* reqadd.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* reqadd.params.Payload.InstructedAmount.Currency = "CRC"
* reqadd.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* reqadd.params.Payload.CreditorAccount.TaxId = "012345678901"
* reqadd.params.Payload.PaymentPurpose = "Payment as Agreed"
* reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.EndToEndIdentification = duplref
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 * match response.error.message contains validations.EndtoEndID
	
	   	 
Scenario: Bic as empty
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
* reqadd.params.Payload.CreditorAgent.Bic = ""
* reqadd.params.Payload.InstructedAmount.Currency = "CRC"
* reqadd.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* reqadd.params.Payload.CreditorAccount.TaxId = "012345678901"
* reqadd.params.Payload.PaymentPurpose = "Payment as Agreed"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
 And request value
 When method POST
 Then status 200
* match response.error.message contains validations.EmptyBic_CMID
 	
Scenario: Bic as Inavalid
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
* reqadd.params.Payload.CreditorAgent.Bic = "GGGGGGGGGG"
* reqadd.params.Payload.InstructedAmount.Currency = "CRC"
* reqadd.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* reqadd.params.Payload.CreditorAccount.TaxId = "012345678901"
* reqadd.params.Payload.PaymentPurpose = "Payment as Agreed"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
 And request value
 When method POST
 Then status 200
* match response.error.message contains validations.InvalidBic
	
	    	
Scenario: Currency as empty
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
* reqadd.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* reqadd.params.Payload.InstructedAmount.Currency = ""
* reqadd.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* reqadd.params.Payload.CreditorAccount.TaxId = "012345678901"
* reqadd.params.Payload.PaymentPurpose = "Payment as Agreed"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
 And request value
 When method POST
 Then status 200
* match response.error.message contains validations.emptyCurrency
	
	   	 
Scenario: PaymentPurpose as empty
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
* reqadd.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* reqadd.params.Payload.InstructedAmount.Currency = "CRC"
* reqadd.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* reqadd.params.Payload.CreditorAccount.TaxId = "012345678901"
* reqadd.params.Payload.PaymentPurpose = ""
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
 And request value
 When method POST
 Then status 200
 * match response.error.message contains validations.EmptyPOP
	 	
Scenario: Contact Phone Number as empty
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
* reqadd.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* reqadd.params.Payload.InstructedAmount.Currency = "CRC"
* reqadd.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* reqadd.params.Payload.CreditorAccount.PhoneNumber = ""
* reqadd.params.Payload.CreditorAccount.TaxId = "012345678901"
* reqadd.params.Payload.PaymentPurpose = "Payment as Agreed"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
 And request value
 When method POST
 Then status 200
* match response.error contains {message:"Parameter 'CreditorContactPhoneNumber' cannot be null.",data:null}
	
	
 	
Scenario: Tax ID as empty
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
* reqadd.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* reqadd.params.Payload.InstructedAmount.Currency = "CRC"
* reqadd.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* reqadd.params.Payload.CreditorAccount.TaxId = ""
* reqadd.params.Payload.PaymentPurpose = "Payment as Agreed"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
 And request value
 When method POST
 Then status 200
* match response.error contains {message:"Parameter 'CreditorTaxID' cannot be null.",data:null}
	
	
		
Scenario: using 11 digit of Tax ID
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
* reqadd.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* reqadd.params.Payload.InstructedAmount.Currency = "CRC"
* reqadd.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* reqadd.params.Payload.CreditorAccount.TaxId = "12345678901"
* reqadd.params.Payload.PaymentPurpose = "Payment as Agreed"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
 And request value
 When method POST
 Then status 200
* match response.error contains {message:"Creditor TaxId must be 12 to 15-numeric.",data:null}
	
	
Scenario: using 16 digit of Tax ID
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
* reqadd.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* reqadd.params.Payload.InstructedAmount.Currency = "CRC"
* reqadd.params.Payload.CreditorAccount.Iban = "CR05015202001026284066"
* reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* reqadd.params.Payload.CreditorAccount.TaxId = "1234567890112345"
* reqadd.params.Payload.PaymentPurpose = "Payment as Agreed"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
 And request value
 When method POST
* match response.error contains {message:"Creditor TaxId must be 12 to 15-numeric.",data:null}
	
	
	
	Scenario: Positive flow with other currency
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
* reqadd.params.Payload.CreditorAgent.Bic = "BCCRCRSJXXX"
* reqadd.params.Payload.InstructedAmount.Currency = "USD"
* reqadd.params.Payload.CreditorAccount.AccountNumber = "5800021000011130000102"
* reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
* reqadd.params.Payload.CreditorAccount.TaxId = "012345678901"
* reqadd.params.Payload.PaymentPurpose = "Payment as Agreed"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
 And request value
 When method POST
 Then status 200
 * def requestMessage = response.result.transaction.requestMessage
 * print requestMessage
 * def referencenumber = reqadd.params.Payload.EndToEndIdentification
 * print referencenumber
 
 ## submit the transaction
  Given url QaUrl + 'api'
  * def approve = read('classpath:visab2b/Payload/form_swift_file.json')
  * print approve
  * approve.params.Api.Credential = testData.Visa_Mk.Credential
  * approve.params.Api.deviceId = testData.Visa_Mk.keyId
  * approve.params.Payload.swiftFiles[0].file = requestMessage
  * def value = signsreq(approve,user)
 And request value
 When method POST
 Then status 200
 * jutil.SetData("GetAuditCrossBorder_Costa Rica",referencenumber)
 * jutil.SetData("Duplicaterefnumber",referencenumber)
	* print jutil.SetData('Duplicaterefnumber',referencenumber)
	
	
	
  
	### Checker user approve transaction
	## Step1 == get the transaction id
	 * def user = testData.Visa_CK
	Given url QaUrl + 'api'
	* def GettransactionID = read('classpath:visab2b/Payload/getapprove_transactionid.json')
	* GettransactionID.params.Payload.EndToEndIdentification = 	referencenumber
	* GettransactionID.params.Api.Credential = testData.Visa_CK.Credential
  * GettransactionID.params.Api.deviceId = testData.Visa_CK.keyId
  * def value = signsreq(GettransactionID,user)
	And request value
	When method POST
	Then status 200
	* def transactionID = response.result.transactions[0].id
	* print transactionID
	## Step2 == approve the payment
* def sleep = function(millis){ return java.lang.Thread.sleep(millis) }
    * eval sleep(25000)
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
	
	
