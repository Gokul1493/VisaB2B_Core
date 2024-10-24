Feature: JAMAICA_MT103

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
    * def content = read('classpath:visab2b/MT103_files/JAMAICA.txt')
    * def referencenumber = "AUTOMT103SFTPJAMAICA" + Accno
    * print referencenumber
    * def finalMt103 = content.replaceAll("20:MT10JMD202208665r7657688", "20:" + referencenumber )
    * print finalMt103
    * jutil.SetData("GetAuditsjamaicamt103rspostive",referencenumber)
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
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
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
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
    * def content = read('classpath:visab2b/MT103_files/JAMAICA.txt')
    * def duplref = jutil.GetData('Duplicaterefnumber')
    * print duplref
    * def finalMt103 = content.replaceAll("20:MT10JMD202208665r7657688", "20:" + duplref )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EndtoEndID

  Scenario: Transaction with end to end as Empty
    * def content = read('classpath:visab2b/MT103_files/JAMAICA.txt')
    * def finalMt103 = content.replaceAll("20:MT10JMD202208665r7657688", "20:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_End2EndID

  ## Beneficiary Bank Branch ID above 5-digits
  Scenario: Verify the Beneficiary Bank Branch ID above 5-digits
    * def content = read('classpath:visab2b/MT103_files/JAMAICA.txt')
    * def branchID = "/BRI/177895"
    * print branchID
    * def finalMt103 = content.replaceAll("72:/BRI/17789", "72:"  + branchID)
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * print response
    * match response.error.message contains validations.MT103_Invalid_BranchID3_5Char

  ## Beneficiary Bank Branch ID less 3-digits
  Scenario: Verify Beneficiary Bank Branch ID less 3-digits
    * def content = read('classpath:visab2b/MT103_files/JAMAICA.txt')
    * def branchID = "/BRI/17"
    * print branchID
    * def finalMt103 = content.replaceAll("72:/BRI/17789", "72:" + branchID )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * print response
    * match response.error.message contains validations.MT103_Invalid_BranchID3_5Char

  ## Beneficiary Bank Branch ID only for numeric value 5-digits
  Scenario: Verify Beneficiary Bank Branch ID only for numeric value 5-digits
    * def content = read('classpath:visab2b/MT103_files/JAMAICA.txt')
    * def branchID = "/17789"
    * print branchID
    * def finalMt103 = content.replaceAll("72:/BRI/17789", "72:" + branchID )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * print response
    * match response.error.message contains validations.BranchID

  ## Without Beneficiary Bank Branch ID
  Scenario: verify the without Beneficiary Bank Branch ID
    * def content = read('classpath:visab2b/MT103_files/JAMAICA.txt')
    * def finalMt103 = content.replaceAll("72:/BRI/17789", "72:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * print response
    * match response.error.message contains validations.BranchID

  Scenario: Creditor Bic as Empty
    * def content = read('classpath:visab2b/MT103_files/JAMAICA.txt')
    * def finalMt103 = content.replaceAll(":57A:JNCBJMKXXXX", "57A:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_CBic_CCMID

  Scenario: Creditor Bic as Invaild
    * def content = read('classpath:visab2b/MT103_files/JAMAICA.txt')
    * def finalMt103 = content.replaceAll(":57A:JNCBJMKXXXX", ":57A:ABC"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.InvalidBic

  Scenario: DebtorAccountNumber as Empty
    * def content = read('classpath:visab2b/MT103_files/JAMAICA.txt')
    * def finalMt103 = content.replaceAll(":50K:/9100910001", ":50K:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * print response
    * match response.error.message contains validations.MT103_Empty_AccNumber

  Scenario: DebtorName as Empty
    * def content = read('classpath:visab2b/MT103_files/JAMAICA.txt')
    * def finalMt103 = content.replaceAll("JIAXING INDUSTRY ", "").replaceAll("840 MASSACHUSETTS ST", "").replaceAll("LAWRENCE, KS 66044, USA", "")
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * print response
    * match response.error.message contains validations.MT103_Empty_DebtorName_Address

  Scenario: CreditorIBAN/AccountNumber as Empty
    * def content = read('classpath:visab2b/MT103_files/JAMAICA.txt')
    * def finalMt103 = content.replaceAll("59:/0000000235698741", "59:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_CAccNumber_IBAN

  Scenario: Purpose of payment(POP)- as Empty
    * def content = read('classpath:visab2b/MT103_files/JAMAICA.txt')
    * def finalMt103 = content.replaceAll("70:/POP/Testing", "70:"  ).replaceAll("20:MT10JMD202208665r7657688", "20:MT103SFTPALBENIA" + Accno )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * print response
    * match response.error.message contains validations.EmptyPOP

  Scenario: Transaction initated for Jamaica country with different currency  (currency:- USD)
    * def content = read('classpath:visab2b/MT103_files/JAMAICA.txt')
    * def referencenumber = "MT103SFTPALBENIA" + Accno
    * print referencenumber
    * def finalMt103 = content.replaceAll("20:MT10JMD202208665r7657688", "20:" + referencenumber ).replaceAll("32A:200408JMD138,28", "32A:200408USD138.28").replaceAll("70:/POP/Payment as agreed", "70:"  )
    * print finalMt103
    * jutil.SetData("GetAuditsjamaicamt103rsothercurrency",referencenumber)
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * print response
    * match response.result.transaction contains {creditDebitIndicator:'Debit'}
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_swift_file.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
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

  Scenario: Creditor Bic Less than 8 digits
    * def content = read('classpath:visab2b/MT103_files/JAMAICA.txt')
    * def finalMt103 = content.replaceAll(":57A:JNCBJMKXXXX", ":57A:ABC"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.InvalidBic

  Scenario: Creditor Bic more than 11 digits
    * def content = read('classpath:visab2b/MT103_files/JAMAICA.txt')
    * def finalMt103 = content.replaceAll(":57A:JNCBJMKXXXX", ":57A:JNCBJMKXXXXXX"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "JAMAICA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.InvalidBic