Feature: AZERBAIJAN_MT103

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
  @positive
  Scenario: Positive flow of the transaction
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def referencenumber = "MT103AZARBAJAN34664658779" + Accno
    * print referencenumber
    * def finalMt103 = content.replaceAll("20:MT103AZARBAJAN34664658779", "20:" + referencenumber )
    * print finalMt103
    * jutil.SetData("GetAuditsazerbaijanmt103rspostive",referencenumber)
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
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
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
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
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def duplref = jutil.GetData('Duplicaterefnumber')
    * print duplref
    * def finalMt103 = content.replaceAll("20:MT103AZARBAJAN34664658779", "20:" + duplref )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EndtoEndID

  Scenario: Transaction with end to end as Empty
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll("20:MT103AZARBAJAN34664658779", "20:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_End2EndID

  Scenario: Creditor Agent tax ID as Empty
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll("/INN/7415456958", ""  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyTaxID

	@ignore
  Scenario: Creditor Bic in first line
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll("57A:/AZ21NABZ00000000137010001933", "57A:NABZAZ2CRTS"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_EMPTY_BIC_CMID

  Scenario: DebtorAccountNumber as Empty
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll(":50K:/4548454", ":50K:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_AccNumber

  Scenario: DebtorName as Empty
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "").replaceAll("840 MASSACHUSETTS ST", "").replaceAll("LAWRENCE, KS 66044, USA", "")
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_DebtorName_Address

  ## Beneficiary IBAN (28 characters)
  Scenario: To verify the  Beneficiary IBAN above 28 digit
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll("59:/AZ21NABZ00000000137010001944", "59:/AZ77VTBA0000000000123456789066"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Invalid_IBANmust28

  Scenario: To verify the  Beneficiary IBAN below 28 digit
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll("59:/AZ21NABZ00000000137010001944", "59:/AZ21NABZ00000000137010"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Invalid_IBANmust28

  Scenario: To verify the without prefix Beneficiary IBAN
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll("59:/AZ21NABZ00000000137010001944", "59:/21NABZ00000000137010001944"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Invalid_IBANmust28

  ## 6-character Clearing Member ID
  Scenario: To verify the Clearing member ID without BIK Tag
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll("/BIK/852369", "361236"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyCMID_Azerbaijan

  Scenario: To verify the without  Clearing Member ID
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll("/BIK/852369", "/BIK/"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_AZN_BICinLine1

  ## Beneficiary Tax ID as 10-digit
  Scenario: To verify the Beneficiary Tax ID as above 10 digit
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll(":77B:/INN/7415456958", ":77B:/INN/741545695801"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.TaxID_must10

  Scenario: To verify the Beneficiary Tax ID as below 10 digit
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll(":77B:/INN/7415456958", ":77B:/INN/123654789"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.TaxID_must10

  Scenario: To verify the without prefix Beneficiary Tax ID
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll(":77B:/INN/7415456958", ":77B:/7415456958"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyTaxID

  Scenario: To verify the Beneficiary Tax ID as empty
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll(":77B:/INN/7415456958", ""  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyTaxID

  Scenario: CreditorIBAN/AccountNumber as Empty
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll("59:/AZ21NABZ00000000137010001944", "59:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_CAccNumber_IBAN

  Scenario: Purpose of payment(POP)- as Empty
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll("70:/POP/Payment as agreed", "70:"  ).replaceAll("20:MT103AZARBAJAN34664658779", "20:" + Accno )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyPOP

  @ignore
  Scenario: Purpose of payment(POP)- with double slash
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll("70:/POP/Payment as agreed", "70://POP/Payment as agreed"   ).replaceAll("20:MT103AZARBAJAN34664658779", "20:" + Accno )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyPOP

  Scenario: Purpose of payment(POP)- with No slash
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll("70:/POP/Payment as agreed", "70:POP/Payment as agreed"   ).replaceAll("20:MT103AZARBAJAN34664658779", "20:" + Accno )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyPOP


  Scenario: Transaction initated for Azerbaijan country with different currency  (currency:- USD)
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def referencenumber = "MT103SFTPALBENIA" + Accno
    * print referencenumber
    * def finalMt103 = content.replaceAll("20:MT103AZARBAJAN34664658779", "20:" + referencenumber ).replaceAll(":32A:240918AZN176,89", ":32A:200408USD138.28").replaceAll(":57A:/AZ21NABZ00000000137010001933", ":57A:/IBAZAZ2XXXX")
    * print finalMt103
    * jutil.SetData("GetAuditsAzerbaijanmt103rsothercurrency",referencenumber)
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
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
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
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

  Scenario: BIC as Empty
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll("IBAZAZ2XXXX", "")
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_MissingBIC

  Scenario: Creditor Correspondent BAnk IBAN is empty
    * def content = read('classpath:visab2b/MT103_files/AZERBAIJAN.txt')
    * def finalMt103 = content.replaceAll(":57A:/AZ21NABZ00000000137010001933", ":57A:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "AZERBAIJAN.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_EMPTY_BIC_CMID
