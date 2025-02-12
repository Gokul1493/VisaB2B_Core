Feature: MONGOLIA_MT103

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
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def referencenumber = "AUTOMT103SFTPMONGOLIA" + Accno
    * print referencenumber
    * def finalMt103 = content.replaceAll("20:2603001SFTPMT103MONGOLIA456324564657", "20:" + referencenumber )
    * print finalMt103
    * jutil.SetData("GetAuditsmongoliamt103rspostive",referencenumber)
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
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
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
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

  ## Beneficiary Branch Name below length 3
  Scenario: To verify Beneficiary Branch Name below length 3
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def branchName = "/BBB/AS"
    * print branchName
    * def finalMt103 = content.replaceAll("72:/BBB/Joe Smith", "72:" + branchName )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Invalid_BranchNameMin3

  ## without Beneficiary Branch Name
  Scenario: To verify without the Beneficiary Branch Name
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def branchName = ""
    * print branchName
    * def finalMt103 = content.replaceAll("72:/BBB/Joe Smith", "72:" + branchName )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.BranchName

  ## without prefix Beneficiary Branch Name
  Scenario: To verify without the Beneficiary Branch Name
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def branchName = "/WER"
    * print branchName
    * def finalMt103 = content.replaceAll("72:/BBB/Joe Smith", "72:" + branchName )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.BranchName

  Scenario: Transaction with end to end identification already exists
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def duplref = jutil.GetData('Duplicaterefnumber')
    * print duplref
    * def finalMt103 = content.replaceAll("20:2603001SFTPMT103MONGOLIA456324564657", "20:" + duplref )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EndtoEndID

  Scenario: Transaction with end to end as Empty
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def finalMt103 = content.replaceAll("20:2603001SFTPMT103MONGOLIA456324564657", "20:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_End2EndID

  Scenario: Creditor Bic as Empty
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def finalMt103 = content.replaceAll(":57A:BOMUMNUBXXX", ":57A:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_CBic_CCMID

  Scenario: Creditor Bic as Invaild
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def finalMt103 = content.replaceAll(":57A:BOMUMNUBXXX", ":57A:ABC"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.InvalidBic

  Scenario: DebtorAccountNumber as Empty
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def finalMt103 = content.replaceAll(":50K:/9100910001", ":50K:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_AccNumber

  Scenario: DebtorName as Empty
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "").replaceAll("840 MASSACHUSETTS ST", "").replaceAll("LAWRENCE, KS 66044, USA", "")
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_DebtorName_Address

  Scenario: CreditorIBAN/AccountNumber as Empty
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def finalMt103 = content.replaceAll(":59:/451258741254578452", ":59:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_CAccNumber_IBAN

  Scenario: Purpose of payment(POP)- as Empty
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def finalMt103 = content.replaceAll(":70:/POP/VO23461", ":70:"  ).replaceAll("20:2603001SFTPMT103MONGOLIA456324564657", "20:MT103SFTPMONGOLIA" + Accno )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyPOP

  ## minimum 3 character for Purpose of payment
  Scenario: To verify the minimum 3 character for Purpose of payment
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def finalMt103 = content.replaceAll(":70:/POP/VO23461", ":70:"  ).replaceAll("20:2603001SFTPMT103MONGOLIA456324564657", "20:MT103SFTPMONGOLIA" + Accno )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyPOP

  ## maximum 3 character for Purpose of payment
  Scenario: To verify maximum 3 character for Purpose of payment
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def finalMt103 = content.replaceAll(":70:/POP/VO23461", ":70:/POP/ASDFGHJ"  ).replaceAll("20:2603001SFTPMT103MONGOLIA456324564657", "20:MT103SFTPMONGOLIA" + Accno )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Mongolia_POP

  Scenario: Transaction initated for Mongolia country with different currency  (currency:- USD)
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def referencenumber = "MT103SFTPMALTA" + Accno
    * print referencenumber
    * def finalMt103 = content.replaceAll("20:2603001SFTPMT103MONGOLIA456324564657", "20:" + referencenumber ).replaceAll(":32A:200408MNT138.28", ":32A:200408USD138.28").replaceAll("70:/POP/Testing", "70:"  )
    * print finalMt103
    * jutil.SetData("GetAuditsmongoliamt103rsothercurrency",referencenumber)
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
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
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
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

  Scenario: Creditor Bic less than 8 digits
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def finalMt103 = content.replaceAll(":57A:BOMUMNUBXXX", ":57A:ABC"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.InvalidBic

  Scenario: Creditor Bic more than 11 digits
    * def content = read('classpath:visab2b/MT103_files/MONGOLIA.txt')
    * def finalMt103 = content.replaceAll(":57A:BOMUMNUBXXX", ":57A:BOMUMNUBXXXXX"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "MONGOLIA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.InvalidBic
