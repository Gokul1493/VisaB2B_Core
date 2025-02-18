Feature: Test the Visab2b transactions For Albania Country

  Background: 
    * def Url = "https://connectors.cbwpayments.com/visab2b/#/"
    * def req = read('classpath:TestPayload/Login.json')
    #* print req
    * def testData = read('classpath:Testdata/config.json')
    #* print testData
    * configure driver = { type: 'chrome',addOptions: ["--remote-allow-origins=*"] }
    * configure ssl = false
    * configure readTimeout = 50000
    * def Random = Java.type('java.util.Random')
    * def random = new Random()
    * def randomNumber = String((new Random()).nextInt(100000) + 1)
    * print 'Random Number:', randomNumber
    * def randomNumberFromColom = Driver.GetData("ReferenceNo")
    * print randomNumberFromColom

  @maker
  Scenario: Login into Visab2b maker
    Given driver 'about:blank'
    And maximize()
    # Open the login page
    * driver Url + "login"
    * delay(2000)
    # Enter username and password
    * waitFor('input[id=j_username]').input("ajai.v+102@netxd.com")
    * waitFor('input[name=password]').input("Test@1234")
    * waitFor('button[class=md-button1]').click()
    * delay(2000)
    # Generate and enter TOTP
    * def totp = Driver.getTOTPCode(Gauth)
    * print 'Generated TOTP: ' + totp
    * waitFor('input[name=otp]').input(totp)
    # Click the login button
    * driver.click(".md-button1")
    * delay(5000)
    #Navigate to payment and perform "Form" Transactions
    When click("{}Payment")
    * delay(5000)
    * waitFor("{}FORM").click()
    * delay(2000)
    #Select country and currency
    * waitFor("{span}Country").click()
    * delay(2000)
    * waitFor('{}CO - Colombia').click()
    * delay(2000)
    * waitFor('{span}Instructed Currency').click()
    * waitFor('{}COP').click()
    * delay(2000)
    * waitFor('{span}Check').click()
    #Select company
    * waitFor('{span}Select Company').click()
    #* scroll('{}//*[@id="mat-select-4-panel"]).click()
    * waitFor('{span}TESTING INC').click()
    * delay(2000)
    #Beneficiary details
    #* waitFor('//input[@id='mat-input-0']').input("NICK")
    * waitFor('{span}Beneficiary Name').click()
    * waitFor('{span}Beneficiary Name').input("COLOM")
    * delay(2000)
    * waitFor('{span}Beneficiary Bic').click()
    * waitFor('{span}Beneficiary Bic').input("ASDFCO50")
    * waitFor('{span}Beneficiary Account Number').click()
    * waitFor('{span}Beneficiary Account Number').input("54687896765")
    * waitFor('{span}Beneficiary Contact Phone Number').click()
    * waitFor('{span}Beneficiary Contact Phone Number').input("+1-2468798")
    * waitFor('{span}Beneficiary TaxId').click()
    * waitFor('{span}Beneficiary TaxId').input("123123654")
    * waitFor('{span}Beneficiary Address').click()
    * waitFor('{span}Beneficiary Address').input("Colom street")
    * delay(2000)
    #Transaction details
    * waitFor('{span}Reference Number').click()
    * waitFor('{span}Reference Number').input(randomNumber)
    * Driver.SetData("ReferenceNo",randomNumber)
    * waitFor('{span}Purpose').click()
    * waitFor('{span}Purpose').input("POP")
    * waitFor('{span}Instructed Amount').click()
    * waitFor('{span}Instructed Amount').input("1000")
    * delay(2000)
    * waitFor('{span}Review').click()
    * delay(5000)
    * waitFor('{span}SUBMIT').click()
    * delay(4000)
    #* def referenceID =
    #* match response.result contains{Summary: (1 of 1 files accepted)"}
    #* def expectedText = 'Summary: (1 of 1 files accepted)'
    #* def actualText = karate.xpath('{//div[contains(text(), "Summary: (1 of 1 files accepted)")]}/text()')
    #* match actualText == expectedText
    * delay(2000)
    #logout
    * waitFor('{}ajai.v+102@netxd.com').click()
    * delay(2000)
    * waitFor('{}Logout').click()

  @checker
  Scenario: Login into Visab2b maker
    Given driver 'about:blank'
    And maximize()
    # Open the login page
    * driver Url + "login"
    * delay(2000)
    # Enter username and password
    * waitFor('input[id=j_username]').input("ajai.c+1@netxd.com")
    * waitFor('input[name=password]').input("xZWqTiEc")
    * delay(2000)
    * waitFor('button[class=md-button1]').click()
    * delay(2000)
    # Generate and enter TOTP
    * def totp = Driver.getTOTPCode(Cguath)
    * print 'Generated TOTP: ' + totp
    * waitFor('input[name=otp]').input(totp)
    # Click the login button
    * driver.click(".md-button1")
    * delay(5000)
    * waitFor('{}Approve').click()
    * delay(2000)
    * waitFor("/html/body/app-root/html/body/div[2]/div/div/app-approved-transaction/div[2]/mat-tab-group/div/mat-tab-body[1]/div/app-approve-txn/div[2]/mat-table/mat-row[1]/mat-cell[7]/a/i").click()
    * delay(2000)
    * waitFor('/html/body/app-root/html/body/div[2]/div/div/app-transaction-detail/div[12]/button[1]').click()
    * delay(2000)
    * waitFor('{}Audit').click()
    * delay(2000)
    * waitFor("/html/body/app-root/html/body/div[2]/div/div/app-audit-list/div/mat-tab-group/mat-tab-header/div[2]/div/div/div[2]/div[1]/div").click()
    * delay(2000)

  @Response
  Scenario: validate response
    Given driver 'about:blank'
    And maximize()
    # Open the login page
    * driver Url + "login"
    * delay(2000)
    * waitFor('input[id=j_username]').input("ajai.c+1@netxd.com")
    * waitFor('input[name=password]').input("xZWqTiEc")
    * delay(2000)
    * waitFor('button[class=md-button1]').click()
    * delay(2000)
    # Generate and enter TOTP
    * def totp = Driver.getTOTPCode(Cguath)
    * print 'Generated TOTP: ' + totp
    * waitFor('input[name=otp]').input(totp)
    # Click the login button
    * driver.click(".md-button1")
    * delay(5000)
    * waitFor('{}Audit').click()
    * delay(8000)
    * waitFor("/html/body/app-root/html/body/div[2]/div/div/app-audit-list/div/mat-tab-group/mat-tab-header/div[2]/div/div/div[2]/div[1]/div").click()
    * delay(8000)
    * waitFor('{}Filter').click()
    * delay(10000)
    * waitFor('{}EndToEnd ID').click()
    * waitFor('{}EndToEnd ID').input(randomNumberFromColom)
    * delay(10000)
    * waitFor('/html/body/app-root/html/body/div[2]/div/div/app-audit-list/div/mat-tab-group/div/mat-tab-body[2]/div/app-visa-audit/div[1]/div/mat-accordion/mat-expansion-panel/div/div/form/button[1]/span').click()
    * delay(8000)
    * def xpath = '/html/body/app-root/html/body/div[2]/div/div/app-audit-list/div/mat-tab-group/div/mat-tab-body[2]/div/app-visa-audit/div[2]/mat-table/mat-row[1]/mat-cell[3]'
    * def actualText = waitFor(xpath).getText()
    * print actualText
    * def expectedText = ' Payment '
    * match actualText == expectedText
