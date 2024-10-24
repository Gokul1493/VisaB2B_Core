Feature: swift_file_transfer_Form_Argentina

Background: 
* def validation_Messages = read('classpath:visab2b/TestData/Validation.json')
* def validations = validation_Messages.Validations
* def testData = read('classpath:visab2b/TestData/Config.json')
* def jutil = Java.type('visab2b.Drivers.Addons')
* def arg = jutil.PLtoken()
* def email = arg.slice(6,10)
* def orgName = arg.slice(5,10)
* def Accno = arg.slice(3,10)
* def country = "ARGENTINA"
* print Accno

 # Maker user intiate the transaction
 Scenario: Positive flow of the transaction
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
 * reqadd.params.Payload.InstructedAmount.Currency = "ARS"
 * reqadd.params.Payload.CreditorAccount.AccountNumber = "9098765432345678987654"
 * reqadd.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
 * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
 * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
 * reqadd.params.Payload.CreditorAccount.TaxId = "89765432123"
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
  * jutil.SetData("GetAuditsArgentinaformpostive",referencenumber)
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
 * reqadd.params.Payload.InstructedAmount.Currency = "ARS"
 * reqadd.params.Payload.CreditorAccount.AccountNumber = "9098765432345678987654"
 * reqadd.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
 * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
 * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
 * reqadd.params.Payload.CreditorAccount.TaxId = "89765432123"
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.EndToEndIdentification = duplref
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 * match response.error.message contains validations.EndtoEndID
	 
 Scenario: BIC as empty
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
 * reqadd.params.Payload.InstructedAmount.Currency = "ARS"
 * reqadd.params.Payload.CreditorAccount.AccountNumber = "9098765432345678987654"
 * reqadd.params.Payload.CreditorAgent.Bic = ""
 * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
 * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
 * reqadd.params.Payload.CreditorAccount.TaxId = "89765432123"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
  And request value
  When method POST
  Then status 200
	* match response.error.message contains validations.EmptyBic_CMID
	 
	Scenario: BIC as Invaild
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
 * reqadd.params.Payload.InstructedAmount.Currency = "ARS"
 * reqadd.params.Payload.CreditorAccount.AccountNumber = "9098765432345678987654"
 * reqadd.params.Payload.CreditorAgent.Bic = "ABCD"
 * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
 * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
 * reqadd.params.Payload.CreditorAccount.TaxId = "89765432123"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
  And request value
  When method POST
  Then status 200
* match response.error.message contains validations.InvalidBic	 

Scenario: Account Number as empty
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
 * reqadd.params.Payload.InstructedAmount.Currency = "ARS"
 * reqadd.params.Payload.CreditorAccount.AccountNumber = ""
 * reqadd.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
 * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
 * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
 * reqadd.params.Payload.CreditorAccount.TaxId = "89765432123"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
  And request value
  When method POST
  Then status 200
  * match response.error.message contains validations.EmptyIban_AccNumber

Scenario: Account Number below 22 digits
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
 * reqadd.params.Payload.InstructedAmount.Currency = "ARS"
 * reqadd.params.Payload.CreditorAccount.AccountNumber = "9098765432987654"
 * reqadd.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
 * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
 * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
 * reqadd.params.Payload.CreditorAccount.TaxId = "89765432123"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
  And request value
  When method POST
  Then status 200
 * match response.error.message contains validations.Accno_must22
  
  
  Scenario: Account Number above 22 digits
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
 * reqadd.params.Payload.InstructedAmount.Currency = "ARS"
 * reqadd.params.Payload.CreditorAccount.AccountNumber = "9098765432343434343434334987654"
 * reqadd.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
 * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
 * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
 * reqadd.params.Payload.CreditorAccount.TaxId = "89765432123"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
  And request value
  When method POST
  Then status 200
 * match response.error.message contains validations.Accno_must22
  
  
Scenario: Phone number as empty
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
 * reqadd.params.Payload.InstructedAmount.Currency = "ARS"
 * reqadd.params.Payload.CreditorAccount.AccountNumber = "9098765432345678987654"
 * reqadd.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
 * reqadd.params.Payload.CreditorAccount.PhoneNumber = ""
 * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
 * reqadd.params.Payload.CreditorAccount.TaxId = "89765432123"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
  And request value
  When method POST
  Then status 200
 * match response.error.message contains validations.EmptyContactPHNO
 
 
 Scenario: Phone number invaild format
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
 * reqadd.params.Payload.InstructedAmount.Currency = "ARS"
 * reqadd.params.Payload.CreditorAccount.AccountNumber = "9098765432345678987654"
 * reqadd.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
 * reqadd.params.Payload.CreditorAccount.PhoneNumber = "09087766"
 * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
 * reqadd.params.Payload.CreditorAccount.TaxId = "89765432123"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
  And request value
  When method POST
  Then status 200
 * match response.error.message contains validations.InvalidMobileNumber
 
 Scenario: POP as null value
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
 * reqadd.params.Payload.InstructedAmount.Currency = "ARS"
 * reqadd.params.Payload.CreditorAccount.AccountNumber = "9098765432345678987654"
 * reqadd.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
 * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
 * reqadd.params.Payload.PaymentPurpose = ""
 * reqadd.params.Payload.CreditorAccount.TaxId = "89765432123"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
  And request value
  When method POST
  Then status 200
 * match response.error.message contains validations.EmptyPOP
 
 Scenario: Currency as empty
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
 * reqadd.params.Payload.InstructedAmount.Currency = ""
 * reqadd.params.Payload.CreditorAccount.AccountNumber = "9098765432345678987654"
 * reqadd.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
 * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
 * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
 * reqadd.params.Payload.CreditorAccount.TaxId = "89765432123"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
  And request value
  When method POST
  Then status 200
 * match response.error.message contains validations.emptyCurrency
 
 
Scenario: Tax ID with Empty
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
 * reqadd.params.Payload.InstructedAmount.Currency = "ARS"
 * reqadd.params.Payload.CreditorAccount.AccountNumber = "9098765432345678987654"
 * reqadd.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
 * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
 * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
 * reqadd.params.Payload.CreditorAccount.TaxId = ""
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
  And request value
  When method POST
  Then status 200
* match response.error.message contains validations.EmptyTaxID
  
  
Scenario: Tax ID below 11 digits 
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
 * reqadd.params.Payload.InstructedAmount.Currency = "ARS"
 * reqadd.params.Payload.CreditorAccount.AccountNumber = "9098765432345678987654"
 * reqadd.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
 * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
 * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
 * reqadd.params.Payload.CreditorAccount.TaxId = "8976543"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
  And request value
  When method POST
  Then status 200
 * match response.error.message contains validations.TaxID_must11
  
  
Scenario: Tax ID above 11 digits  
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
 * reqadd.params.Payload.InstructedAmount.Currency = "ARS"
 * reqadd.params.Payload.CreditorAccount.AccountNumber = "9098765432345678987654"
 * reqadd.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
 * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
 * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
 * reqadd.params.Payload.CreditorAccount.TaxId = "897632232323543"
 * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
 * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
 * def value = signsreq(reqadd,user)
  And request value
  When method POST
  Then status 200
 * match response.error.message contains validations.TaxID_must11
  
  
  
  Scenario: Transaction intiated for albania country with different currrency
 * def user = testData.Visa_Mk
 Given url QaUrl + 'api'
 * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
 * reqadd.params.Payload.InstructedAmount.Currency = "XCD"
 * reqadd.params.Payload.CreditorAccount.AccountNumber = "9098765432345678987654"
 * reqadd.params.Payload.CreditorAgent.Bic = "NACNARBAXXX"
 * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
 * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
 * reqadd.params.Payload.CreditorAccount.TaxId = "89765432123"
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
 
 # submit the transaction
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
 * jutil.SetData("GetAuditsArgentinaFormothercurrency",referencenumber)
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
  
  
	 

	 