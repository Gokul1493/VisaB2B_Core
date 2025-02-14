Feature: ARGENTINA_MT103

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
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPARGENTINA" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber )
  * print finalMt103
  * jutil.SetData("GetAuditPositiveArgentina",referencenumber)
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
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
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
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


## Account number above the 22 digit
 Scenario: To verify Beneficiary Account number above the 22 digit
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "/65698745265874526854534654675676"
  * print referencenumber
  * def finalMt103 = content.replaceAll(":59:/1234567891234554232312", ":59:" + referencenumber )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
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
	* match response.error.message contains validations.MT103_AccNo_22Num
	

## Account number less the 22 digit
 Scenario: To verify Beneficiary Account number less the 22 digit
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "/65698745265874526854"
  * print referencenumber
  * def finalMt103 = content.replaceAll(":59:/1234567891234554232312", ":59:" + referencenumber )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
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
	* match response.error.message contains validations.MT103_AccNo_22Num

## Account number in alphanumeric the 22 digit
 Scenario: To verify Beneficiary Account number in alphanumeric 22 digit
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "/65698745265874526854"
  * print referencenumber
  * def finalMt103 = content.replaceAll(":59:/1234567891234554232312", ":59:" + referencenumber )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
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
	* match response.error.message contains validations.MT103_AccNo_22Num

## 10-digit Beneficiary Tax ID
 Scenario: To verify Beneficiary Tax ID below 11-digit 
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPALGERIA" + Accno
  * print referencenumber
  * def taxId = '/INN/1122334455'
  * print taxId
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll("72:/INN/11223344556", "72:" + taxId )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
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
	* match response.error.message contains validations.MT103_Invalid_TaxID11Num
	
	

## 12-digit Beneficiary Tax ID
 Scenario: To verify Beneficiary Tax ID above 11-digit 
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPALGERIA" + Accno
  * print referencenumber
  * def taxId = '/INN/111122334455'
  * print taxId
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll("72:/INN/11223344556", "72:" + taxId )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
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
	* match response.error.message contains validations.MT103_Invalid_TaxID11Num

##  Beneficiary Tax ID as empty
 Scenario: To verify Beneficiary Tax ID as empty
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPALGERIA" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll("72:/INN/11223344556", "72:"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
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
	* match response.error.message contains validations.EmptyTaxID


##  Without tag name in Beneficiary Tax ID 
 Scenario: To verify without TAG name in Beneficiary Tax ID 
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPALGERIA" + Accno
  * print referencenumber
  * def taxId = '/111122334455'
  * print taxId
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll("72:/INN/11223344556", "72:" + taxId )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
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
	* match response.error.message contains validations.EmptyTaxID


##  Without tag name in phone number
 Scenario: To verify without TAG name in phone number 
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPALGERIA" + Accno
  * print referencenumber
  * def phoneNo = '/+1-8099087766'
  * print phoneNo
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll("/PHN/+1-8099087766", + phoneNo )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
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
	* match response.error.message contains validations.EmptyContactPHNO

##  Without proper format in phone number
 Scenario: To verify without proper format phone number
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPALGERIA" + Accno
  * print referencenumber
  * def phoneNo = '/PHN/8099087766'
  * print phoneNo
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll("/PHN/+1-8099087766", + phoneNo )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
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
	* match response.error.message contains validations.EmptyContactPHNO


##  phone number field as empty
 Scenario: To verify phone number field as empty
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "AUTOMT103SFTPALGERIA" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll("/PHN/+1-8099087766", ""  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
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
	* match response.error.message contains validations.EmptyContactPHNO


Scenario: Transaction with end to end identification already exists
	* def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	* def duplref = jutil.GetData('Duplicaterefnumber')
	* print duplref
	* def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + duplref )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.EndtoEndID
	
Scenario: Transaction with end to end as Empty
	* def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	* def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_End2EndID
	
Scenario: Creditor Bic as Empty
	 * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	 * def finalMt103 = content.replaceAll(":57A:NACNARBAXXX", "57A:"  )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 * match response.error.message contains validations.MT103_Empty_CBic_CCMID
	 
	 Scenario: Creditor Bic as Invaild
	 * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	 * def finalMt103 = content.replaceAll(":57A:NACNARBAXXX", ":57A:ABC"  )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 * match response.error.message contains validations.InvalidBic
	 
	
Scenario: DebtorAccountNumber as Empty
	 * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	 * def finalMt103 = content.replaceAll(":50K:/9100910001", ":50K:"  )
   * print finalMt103
   * def user = testData.Visa_Mk
   Given url QaUrl + 'api'
   * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
   * print reqadd
   * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
   * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
   * reqadd.params.Payload.swiftFiles[0].file = finalMt103
   * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
   * def value = signsreq(reqadd,user)
	 And request value
	 When method POST
	 Then status 200
	 * match response.error.message contains validations.MT103_Empty_AccNumber
	
Scenario: DebtorName as Empty
	* def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	* def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "")
  * print finalMt103
  * def user = testData.Visa_Mk	
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_unmatch_CompName
	

Scenario: CreditorIBAN/AccountNumber as Empty
	* def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	* def finalMt103 = content.replaceAll("59:/1234567891234554232312", "59:"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_CAccNumber_IBAN
	
Scenario: Purpose of payment(POP)- as Empty
	* def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	* def finalMt103 = content.replaceAll("70:/POP/Payment as agreed for Argentina", "70:"  ).replaceAll("20:AUTOMT103SFTPALBENIA", "20:MT103SFTPALBENIA" + Accno )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.EmptyPOP
	
	@ignore
	Scenario: Purpose of payment(POP)- starting with double slash
	* def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	* def finalMt103 = content.replaceAll("70:/POP/Payment as agreed for Argentina", "70://POP/Payment as agreed for Argentina"  ).replaceAll("20:AUTOMT103SFTPALBENIA", "20:MT103SFTPALBENIA" + Accno )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.EmptyPOP
	
	Scenario: Purpose of payment(POP)- with no slash
	* def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	* def finalMt103 = content.replaceAll("70:/POP/Payment as agreed for Argentina", "70:POP/Payment as agreed for Argentina"  ).replaceAll("20:AUTOMT103SFTPALBENIA", "20:MT103SFTPALBENIA" + Accno )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.EmptyPOP
	
	
Scenario: Transaction initated for Argentina country with different currency  (currency:- USD)
  * def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  * def referencenumber = "MT103SFTPALBENIA" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll(":32A:200408ARS138.28", ":32A:200408USD138.28").replaceAll("70:/POP/Payment as agreed", "70:"  )
  * print finalMt103
  * jutil.SetData("GetAuditCrossBorderArgentina",referencenumber)
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
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
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
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
 
 Scenario: Currency as Empty
	* def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
	* def finalMt103 = content.replaceAll("32A:200408ARS138.28", "32A:200408138.28"  )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Invalid_CurMin3Alpha
	
	Scenario: Debtor company with 90 percent 
	* def content = read('classpath:visab2b/MT103_files/ARGENTINA.txt')
  *	def referencenumber = "MT103ARGENTINA3465872" + Accno
  * print referencenumber
  * def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "JIAXING INDUST"  ).replaceAll("20:MT103ARGENTINA3465872", "20:" + referencenumber ).replaceAll("59:/1234567891234554232312", "59:" )
  * print finalMt103
  * def user = testData.Visa_Mk
  Given url QaUrl + 'api'
  * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
  * print reqadd
  * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
  * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
  * reqadd.params.Payload.swiftFiles[0].file = finalMt103
  * reqadd.params.Payload.swiftFiles[0].fileName = "ARGENTINA.txt"
  * def value = signsreq(reqadd,user)
	And request value
	When method POST
	Then status 200
	* match response.error.message contains validations.MT103_Empty_CAccNumber_IBAN
	

