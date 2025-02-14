Feature: swift_file_transfer_Form_Azerbaijan

  Background: 
    * def validation_Messages = read('classpath:visab2b/TestData/Validation.json')
    * def validations = validation_Messages.Validations
    * def testData = read('classpath:visab2b/TestData/Config.json')
    * def jutil = Java.type('visab2b.Drivers.Addons')
    * def arg = jutil.PLtoken()
    * def email = arg.slice(6,10)
    * def orgName = arg.slice(5,10)
    * def Accno = arg.slice(3,10)
    * def country = "AZERBAIJAN"
    * print Accno

  ## Maker user intiate the transaction
  @positive
  Scenario: Positive flow of the transaction
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "AZN"
    * reqadd.params.Payload.CreditorAccount.Iban = "AZ21NABZ00000000137010001944"
    * reqadd.params.Payload.CreditorAgent.CreditorAgentIBAN = "AZ21NABZ00000000137010001945"
    * reqadd.params.Payload.CreditorAgent.Bic = "ACABAZ22XXX"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Payload.CreditorAccount.TaxId = "1223344466"
    * reqadd.params.Payload.CreditorAgent.ClearingMemberId = "852369"
    * reqadd.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001947"
    * reqadd.params.Payload.CreditorAgentTaxID = "8525827419"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * print response
    * def requestMessage = response.result.transaction.requestMessage
    * print requestMessage
    * def referencenumber = reqadd.params.Payload.EndToEndIdentification
    * print referencenumber
    ### submit the transaction
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
    * jutil.SetData("GetAuditsAzerbaijanformpostive",referencenumber)
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
    * def content = read('classpath:visab2b/MT103_files/ALBANIA.txt')
    * def duplref = jutil.GetData('Duplicaterefnumber')
    * print duplref
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "AZN"
    * reqadd.params.Payload.CreditorAccount.Iban = "AZ21NABZ00000000137010001944"
    * reqadd.params.Payload.CreditorAgent.CreditorAgentIBAN = "AZ21NABZ00000000137010001945"
    * reqadd.params.Payload.CreditorAgent.Bic = "ACABAZ22XXX"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Payload.CreditorAccount.TaxId = "1223344466"
    * reqadd.params.Payload.CreditorAgent.ClearingMemberId = "123456"
    * reqadd.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001947"
    * reqadd.params.Payload.CreditorAgentTaxID = "8525827419"
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
    * reqadd.params.Payload.InstructedAmount.Currency = "AZN"
    * reqadd.params.Payload.CreditorAccount.Iban = "AZ21NABZ00000000137010001944"
    * reqadd.params.Payload.CreditorAgent.CreditorAgentIBAN = "AZ21NABZ00000000137010001945"
    * reqadd.params.Payload.CreditorAgent.Bic = ""
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Payload.CreditorAccount.TaxId = "1223344466"
    * reqadd.params.Payload.CreditorAgent.ClearingMemberId = "AZ123456"
    * reqadd.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001947"
    * reqadd.params.Payload.CreditorAgentTaxID = "8525827419"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyBIC_AZ

  Scenario: BIC as Invaild
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "AZN"
    * reqadd.params.Payload.CreditorAccount.Iban = "AZ21NABZ00000000137010001944"
    * reqadd.params.Payload.CreditorAgent.CreditorAgentIBAN = "AZ21NABZ00000000137010001945"
    * reqadd.params.Payload.CreditorAgent.Bic = "ACABAZ22XXX8456"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Payload.CreditorAccount.TaxId = "1223344466"
    * reqadd.params.Payload.CreditorAgent.ClearingMemberId = "123456"
    * reqadd.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001947"
    * reqadd.params.Payload.CreditorAgentTaxID = "8525827419"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.InvalidBic

  Scenario: Iban as empty
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "AZN"
    * reqadd.params.Payload.CreditorAccount.Iban = ""
    * reqadd.params.Payload.CreditorAgent.CreditorAgentIBAN = "AZ21NABZ00000000137010001945"
    * reqadd.params.Payload.CreditorAgent.Bic = "ACABAZ22XXX"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Payload.CreditorAccount.TaxId = "1223344466"
    * reqadd.params.Payload.CreditorAgent.ClearingMemberId = "123456"
    * reqadd.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001947"
    * reqadd.params.Payload.CreditorAgentTaxID = "8525827419"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyIban_AccNumber

  Scenario: TaxID as Empty
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "AZN"
    * reqadd.params.Payload.CreditorAccount.Iban = "AZ21NABZ00000000137010001944"
    * reqadd.params.Payload.CreditorAgent.CreditorAgentIBAN = "AZ21NABZ00000000137010001945"
    * reqadd.params.Payload.CreditorAgent.Bic = "ACABAZ22XXX"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Payload.CreditorAccount.TaxId = ""
    * reqadd.params.Payload.CreditorAgent.ClearingMemberId = "123456"
    * reqadd.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001947"
    * reqadd.params.Payload.CreditorAgentTaxID = "8525827419"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyTaxID

  Scenario: TaxID as below 10 digit
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "AZN"
    * reqadd.params.Payload.CreditorAccount.Iban = "AZ21NABZ00000000137010001944"
    * reqadd.params.Payload.CreditorAgent.CreditorAgentIBAN = "AZ21NABZ00000000137010001945"
    * reqadd.params.Payload.CreditorAgent.Bic = "ACABAZ22XXX"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Payload.CreditorAccount.TaxId = "122334446"
    * reqadd.params.Payload.CreditorAgent.ClearingMemberId = "123456"
    * reqadd.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001947"
    * reqadd.params.Payload.CreditorAgentTaxID = "8525827419"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.TaxID_must10

  Scenario: ClearingMemberId ID as empty
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "AZN"
    * reqadd.params.Payload.CreditorAccount.Iban = "AZ21NABZ00000000137010001944"
    * reqadd.params.Payload.CreditorAgent.CreditorAgentIBAN = "AZ21NABZ00000000137010001945"
    * reqadd.params.Payload.CreditorAgent.Bic = "ACABAZ22XXX"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Payload.CreditorAccount.TaxId = "1223344466"
    * reqadd.params.Payload.CreditorAgent.ClearingMemberId = ""
    * reqadd.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001947"
    * reqadd.params.Payload.CreditorAgentTaxID = "8525827419"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyCMID_Azerbaijan

  Scenario: ClearingMemberId  as above 6 digit
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "AZN"
    * reqadd.params.Payload.CreditorAccount.Iban = "AZ21NABZ00000000137010001944"
    * reqadd.params.Payload.CreditorAgent.CreditorAgentIBAN = "AZ21NABZ00000000137010001945"
    * reqadd.params.Payload.CreditorAgent.Bic = "ACABAZ22XXX"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Payload.CreditorAccount.TaxId = "1223344466"
    * reqadd.params.Payload.CreditorAgent.ClearingMemberId = "12345685"
    * reqadd.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001947"
    * reqadd.params.Payload.CreditorAgentTaxID = "8525827419"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.CMID_Azerbhaijan

  Scenario: ClearingMemberId  as below 6 digit
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "AZN"
    * reqadd.params.Payload.CreditorAccount.Iban = "AZ21NABZ00000000137010001944"
    * reqadd.params.Payload.CreditorAgent.CreditorAgentIBAN = "AZ21NABZ00000000137010001945"
    * reqadd.params.Payload.CreditorAgent.Bic = "ACABAZ22XXX"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Payload.CreditorAccount.TaxId = "1223344466"
    * reqadd.params.Payload.CreditorAgent.ClearingMemberId = "85236"
    * reqadd.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001947"
    * reqadd.params.Payload.CreditorAgentTaxID = "8525827419"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.CMID_Azerbhaijan

  Scenario: POP as null value
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "AZN"
    * reqadd.params.Payload.CreditorAccount.Iban = "AZ21NABZ00000000137010001944"
    * reqadd.params.Payload.CreditorAgent.CreditorAgentIBAN = "AZ21NABZ00000000137010001945"
    * reqadd.params.Payload.CreditorAgent.Bic = "ACABAZ22XXX"
    * reqadd.params.Payload.PaymentPurpose = ""
    * reqadd.params.Payload.CreditorAccount.TaxId = "1223344466"
    * reqadd.params.Payload.CreditorAgent.ClearingMemberId = "123456"
    * reqadd.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001947"
    * reqadd.params.Payload.CreditorAgentTaxID = "8525827419"
    * reqadd.params.Api.Credential = testData.Visa_Mk.Credential
    * reqadd.params.Api.deviceId = testData.Visa_Mk.keyId
    * def value = signsreq(reqadd,user)
    And request value
    When method POST
    Then status 200
    * match response.error.message contains validations.EmptyPOP

  ## Maker user intiate the transaction
  @negative
  Scenario: Transaction initiated cross border currency
    * def user = testData.Visa_Mk
    Given url QaUrl + 'api'
    * def reqadd = read('classpath:visab2b/Payload/form_Review_transaction.json')
    * reqadd.params.Payload.InstructedAmount.Currency = "USD"
    * reqadd.params.Payload.CreditorAccount.Iban = "AZ21NABZ00000000137010001944"
    * reqadd.params.Payload.CreditorAccount.AccountNumber = "852234O9399393"
    * reqadd.params.Payload.CreditorAgent.CreditorAgentIBAN = "AZ21NABZ00000000137010001945"
    * reqadd.params.Payload.CreditorAgent.Bic = "ACABAZ22XXX"
    * reqadd.params.Payload.PaymentPurpose = "purpose of the Payment"
    * reqadd.params.Payload.CreditorAccount.TaxId = "1223344466"
    * reqadd.params.Payload.CreditorAgent.ClearingMemberId = "AZ123456"
    * reqadd.params.Payload.CreditorAgentIBAN = "AZ21NABZ00000000137010001947"
    * reqadd.params.Payload.CreditorAgentTaxID = "8525827419"
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
    ### submit the transaction
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
    * jutil.SetData("GetAuditsAzerbaijanFormothercurrency",referencenumber)
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
