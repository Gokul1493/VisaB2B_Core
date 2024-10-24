Feature: swift_file_transfer_Form_Algeria

  Background: 
    * def validation_Messages = read('classpath:visab2b/TestData/Validation.json')
    * def validations = validation_Messages.Validations
    * def testData = read('classpath:visab2b/TestData/Config.json')
    * def validation_Messages = read('classpath:visab2b/TestData/Validation.json')
    * def validations = validation_Messages.Validations
    * def jutil = Java.type('visab2b.Drivers.Addons')
    * def arg = jutil.PLtoken()
    * def email = arg.slice(6,10)
    * def orgName = arg.slice(5,10)
    * def Accno = arg.slice(3,10)
    * def country = "ALGERIA"
    * print Accno

  # Maker user intiate the transaction
  @positive
  Scenario: Positive flow of the transaction
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "DZD"
    * reqadd.params.Payload.CreditorAccount.AccountNumber = "ALGERIAACCNO37436437"
    * reqadd.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
    * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
    * reqadd.params.Payload.CreditorAccount.ContactName = "joven Albert"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
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
    * jutil.SetData("GetauditsAlgeriaformsamecurrency",referencenumber)
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

  ## Maker user intiate the transaction
  @positive
  Scenario: Transaction initiated for algeria country with different currency
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "BHD"
    * reqadd.params.Payload.CreditorAccount.AccountNumber = "ALGERIAACCNO37436437"
    * reqadd.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
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
    * jutil.SetData("GetauditsAlgeriaformothercurrency",referencenumber)
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

  @negative
  Scenario: Transaction with end to end identification already exists
    * def duplref = jutil.GetData('Duplicaterefnumber')
    * print duplref
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * print reqadd
    * reqadd.params.Payload.InstructedAmount.Currency = "ALL"
    * reqadd.params.Payload.CreditorAccount.Iban = "AL47212110090000000235698741"
    * reqadd.params.Payload.CreditorAgent.Bic = "PUPPALTRXXX"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * reqadd.params.Payload.EndToEndIdentification = duplref
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EndtoEndID

  @negative
  Scenario: BIC as empty
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "DZD"
    * reqadd.params.Payload.CreditorAccount.AccountNumber = "ALGERIAACCNO37436437"
    * reqadd.params.Payload.CreditorAgent.Bic = ""
    * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
    * reqadd.params.Payload.CreditorAccount.ContactName = "joven Albert"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyBic_CMID

  @negative
  Scenario: BIC as Invaild
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "DZD"
    * reqadd.params.Payload.CreditorAccount.AccountNumber = "ALGERIAACCNO37436437"
    * reqadd.params.Payload.CreditorAgent.Bic = "ABC"
    * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
    * reqadd.params.Payload.CreditorAccount.ContactName = "joven Albert"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.InvalidBic

  @negative
  Scenario: Account Number as empty
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "DZD"
    * reqadd.params.Payload.CreditorAccount.AccountNumber = ""
    * reqadd.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
    * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
    * reqadd.params.Payload.CreditorAccount.ContactName = "joven Albert"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyIban_AccNumber

  @negative
  Scenario: Account Number below 20 digit
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "DZD"
    * reqadd.params.Payload.CreditorAccount.AccountNumber = "ALGERIAACCNO374"
    * reqadd.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
    * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
    * reqadd.params.Payload.CreditorAccount.ContactName = "joven Albert"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.LessmoreACCNO_Algeria

  @negative
  Scenario: Account Number above 20 digit
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "DZD"
    * reqadd.params.Payload.CreditorAccount.AccountNumber = "ALGERIAAC45645656555CNO374"
    * reqadd.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
    * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
    * reqadd.params.Payload.CreditorAccount.ContactName = "joven Albert"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.LessmoreACCNO_Algeria

  @negative
  Scenario: Phone number as empty
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "DZD"
    * reqadd.params.Payload.CreditorAccount.AccountNumber = "ALGERIAACCNO37436437"
    * reqadd.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
    * reqadd.params.Payload.CreditorAccount.PhoneNumber = ""
    * reqadd.params.Payload.CreditorAccount.ContactName = "joven Albert"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyContactPHNO

  @negative
  Scenario: Phone number invaild format
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "DZD"
    * reqadd.params.Payload.CreditorAccount.AccountNumber = "ALGERIAACCNO37436437"
    * reqadd.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
    * reqadd.params.Payload.CreditorAccount.PhoneNumber = "434343434"
    * reqadd.params.Payload.CreditorAccount.ContactName = "joven Albert"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.InvalidMobileNumber

  @negative
  Scenario: Contact name as empty
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "DZD"
    * reqadd.params.Payload.CreditorAccount.AccountNumber = "ALGERIAACCNO37436437"
    * reqadd.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
    * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
    * reqadd.params.Payload.CreditorAccount.ContactName = ""
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyContactname

  @negative
  Scenario: Currency as empty
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = ""
    * reqadd.params.Payload.CreditorAccount.AccountNumber = "ALGERIAACCNO37436437"
    * reqadd.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
    * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
    * reqadd.params.Payload.CreditorAccount.ContactName = "joven Albert"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.emptyCurrency

  @negative
  Scenario: Purpose of Payment as empty
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "DZD"
    * reqadd.params.Payload.CreditorAccount.AccountNumber = "ALGERIAACCNO37436437"
    * reqadd.params.Payload.CreditorAgent.Bic = "BALGDZAPXXX"
    * reqadd.params.Payload.CreditorAccount.PhoneNumber = "+1-8099087766"
    * reqadd.params.Payload.CreditorAccount.ContactName = "joven Albert"
    * reqadd.params.Payload.PaymentPurpose = ""
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyPOP
