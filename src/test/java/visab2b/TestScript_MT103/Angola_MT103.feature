Feature: ANGOLA_MT103

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
    * def content = read('classpath:visab2b/MT103_files/ANGOLA.txt')
    * def referencenumber = "AUTOMT103SFTPANGOLA" + Accno
    * print referencenumber
    * def finalMt103 = content.replaceAll("20:MT103ANGOLA34565656567", "20:" + referencenumber )
    * print finalMt103
    * jutil.SetData("GetAuditsAngolamt103RSpostive",referencenumber)
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
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
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
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
    * match response.result.message == validations.successMessage

  Scenario: Transaction with end to end identification already exists
    * def content = read('classpath:visab2b/MT103_files/ANGOLA.txt')
    * def duplref = jutil.GetData('Duplicaterefnumber')
    * print duplref
    * def finalMt103 = content.replaceAll("20:MT103ANGOLA34565656567", "20:" + duplref )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EndtoEndID

  Scenario: Transaction with end to end as Empty
    * def content = read('classpath:visab2b/MT103_files/ANGOLA.txt')
    * def finalMt103 = content.replaceAll("20:MT103ANGOLA34565656567", "20:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_End2EndID

  Scenario: Creditor Bic as Empty
    * def content = read('classpath:visab2b/MT103_files/ANGOLA.txt')
    * def finalMt103 = content.replaceAll(":57A:BCCBAOLUXXX", "57A:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error contains {"message":"CreditorAgentBic/CreditorAgentClearingMemberID is cannot be empty",data:null}

  Scenario: Creditor Bic as Invaild
    * def content = read('classpath:visab2b/MT103_files/ANGOLA.txt')
    * def finalMt103 = content.replaceAll(":57A:BCCBAOLUXXX", ":57A:ABC"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.InvalidBic

  Scenario: DebtorAccountNumber as Empty
    * def content = read('classpath:visab2b/MT103_files/ANGOLA.txt')
    * def finalMt103 = content.replaceAll(":50K:/9100910001", "50K:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_AccNumber

  Scenario: DebtorName as Empty
    * def content = read('classpath:visab2b/MT103_files/ANGOLA.txt')
    * def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "").replaceAll("840 MASSACHUSETTS ST", "").replaceAll("LAWRENCE, KS 66044, USA", "")
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_DebtorName_Address

  Scenario: Creditor Bic as Empty
    * def content = read('classpath:visab2b/MT103_files/ANGOLA.txt')
    * def finalMt103 = content.replaceAll(":57A:BCCBAOLUXXX", ":57A:")
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_CBic_CCMID

  Scenario: CreditorIBAN/AccountNumber as Empty
    * def content = read('classpath:visab2b/MT103_files/ANGOLA.txt')
    * def finalMt103 = content.replaceAll("59:/AO06004400006729503010102", "59:"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_CAccNumber_IBAN

  Scenario: Purpose of payment(POP)- as Empty
    * def content = read('classpath:visab2b/MT103_files/ANGOLA.txt')
    * def finalMt103 = content.replaceAll(":72:/POP/Purpose of Paymentfor Angola", ":72:"  ).replaceAll("20:MT103ANGOLA34565656567", "20:MT103ANGOLA34565656567" + Accno )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyPOP

  Scenario: Purpose of payment(POP)- without slash
    * def content = read('classpath:visab2b/MT103_files/ANGOLA.txt')
    * def finalMt103 = content.replaceAll("72:/POP/Purpose of Paymentfor Angola", "72:POP/Purpose of Paymentfor Angola"  ).replaceAll("20:MT103ALGERIA2024001", "20:MT103ALGERIA2024001" + Accno )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyPOP

  @ignore
  Scenario: Purpose of payment(POP)- with double  slash
    * def content = read('classpath:visab2b/MT103_files/ANGOLA.txt')
    * def finalMt103 = content.replaceAll("72:/POP/Purpose of Paymentfor Angola", "72://POP/Purpose of Paymentfor Angola"  ).replaceAll("20:MT103ALGERIA2024001", "20:MT103ALGERIA2024001" + Accno )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyPOP

  Scenario: Transaction initated for albania country with different currency  (currency:- USD)
    * def content = read('classpath:visab2b/MT103_files/ANGOLA.txt')
    * def referencenumber = "MT103SFTPANGOLA" + Accno
    * print referencenumber
    * def finalMt103 = content.replaceAll("20:MT103ANGOLA34565656567", "20:" + referencenumber ).replaceAll(":32A:200408AOA138.28", ":32A:200408USD138.28").replaceAll("72:/POP/Payment as agreed", "72:"  )
    * print finalMt103
    * jutil.SetData("GetAuditsAngolamt103rsothercurrency",referencenumber)
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
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
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
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
    * def content = read('classpath:visab2b/MT103_files/ANGOLA.txt')
    * def finalMt103 = content.replaceAll(":32A:200408AOA138.28", ":32A:200408138.28"  )
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error contains {"message":"Instructed Currency must be 3 alpha.",data:null}

  @ignore
  Scenario: DebtorName as 90 percent match
    * def content = read('classpath:visab2b/MT103_files/ANGOLA.txt')
    * def finalMt103 = content.replaceAll("JIAXING INDUSTRY", "JIAXING INDUS")
    * print finalMt103
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/MT103_Review_transaction.json')
    * print reqadd
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.swiftFiles[0].file = finalMt103
    * reqadd.params.Payload.swiftFiles[0].fileName = "ANGOLA.txt"
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.MT103_Empty_DebtorName_Address