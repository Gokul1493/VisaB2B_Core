@parallel=false
Feature: Test the Visab2b transactions For Albania Country

  Background: 
    * def Url = "https://connectors.cbwpayments.com/visab2b/#/"
    * def req = read('classpath:TestPayload/Login.json')
    #* print req
    * def testData = read('classpath:Testdata/config.json')
    * def Hashutils = Java.type('visaTestScript.Addons')
    * def Credentails = read('classpath:Testdata/credentials.json')
    * def loginObect = read('classpath:Objectrepository/LoginUiObject.json')
    * def userdir = Hashutils.UserDir()
    #* print testData
    * configure driver = { type: 'chrome',addOptions: ["--remote-allow-origins=*"] }
    * configure ssl = false
    * configure readTimeout = 50000

  Scenario: Generate MT103 File for Albania
    * def filepath = read('classpath:Testdata/algeria_MT.txt')
    * def TOKENUM = Hashutils.randomNum(99999999)
    * def CURRENCY = '240101' + 'DZD' + '1000'
    * def BICCODE = 'ASDFDZ90'
    * print 'TOKEN NUM:',TOKENUM
    * def modifiedvalue = filepath.replace('{TOKENUM}', TOKENUM)
    * Driver.SetData("ReferenceNo",TOKENUM)
    * def modifiedvalue1 = modifiedvalue.replace('CURRENCY', CURRENCY)
    * def modifiedvalue2 = modifiedvalue1.replace('BICCODE', BICCODE)
    * def fileName = 'MT103' + 'DZD' + '.txt'
    * karate.write(modifiedvalue2,fileName)

  @maker
  Scenario: Login into Visab2b maker
    Given driver 'about:blank'
    And maximize()
    # Open the login page
    * driver Url + "login"
    * delay(2000)
    * reload()
    * delay(2000)
    # Enter username and password
    * waitFor(loginObect.login.userNamefield).input(Credentails.UserName)
    * waitFor(loginObect.login.passwordField).input(Credentails.PassWord)
    * waitFor(loginObect.login.loginButton).click()
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
    #* waitFor('/html/body/app-root/html/body/div[2]/div/div/app-payment/div[2]/mat-tab-group/div/mat-tab-body[1]/div/app-swift-file/div/div/form/mat-card/mat-card-content/div/input').click()
    * highlight('input[name=upload]')
    * def fileName = 'MT103' + 'DZD' + '.txt'
    * def path = 'file:/' + userdir + '/target/' + fileName
    * print 'FILE PATH: ' + path
    * driver.inputFile("input[name=upload]",path)
    #* waitFor('input[name=upload]').input('file:/' + userdir + 'MT103'+ "ALL" +'.txt')
    * delay(8000)
    * waitFor('{span}REVIEW').click()
    * delay(4000)
    * waitFor('{span}SUBMIT').click()
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
    * reload()
    * delay(2000)
    # Enter username and password
    * waitFor(loginObect.login.userNamefield).input(Credentails.CheckerUserName)
    * waitFor(loginObect.login.passwordField).input(Credentails.PassWord)
    * delay(2000)
    * waitFor(loginObect.login.loginButton).click()
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

  #* waitFor("/html/body/app-root/html/body/div[2]/div/div/app-approved-transaction/div[2]/mat-tab-group/div/mat-tab-body[1]/div/app-approve-txn/div[2]/mat-table/mat-row[1]/mat-cell[7]/a/i").click()
  #* delay(2000)
  #* waitFor('/html/body/app-root/html/body/div[2]/div/div/app-transaction-detail/div[12]/button[1]').click()
  #* delay(2000)
  #* waitFor('{}Audit').click()
  #* delay(2000)
  #* waitFor("/html/body/app-root/html/body/div[2]/div/div/app-audit-list/div/mat-tab-group/mat-tab-header/div[2]/div/div/div[2]/div[1]/div").click()
  #* delay(2000)
  @Response
  Scenario: validate response
    Given driver 'about:blank'
    And maximize()
    # Open the login page
    * driver Url + "login"
    * delay(2000)
    * reload()
    * delay(2000)
    * waitFor(loginObect.login.userNamefield).input(Credentails.CheckerUserName)
    * waitFor(loginObect.login.passwordField).input(Credentails.PassWord)
    * delay(2000)
    * waitFor(loginObect.login.loginButton).click()
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
    * highlight('{}EndToEnd ID')
    * waitFor('{}EndToEnd ID').click()
    * def Rnumb = '' + Driver.GetData("ReferenceNo")
    * print 'Ref:',Rnumb
    * waitFor('{}EndToEnd ID').input('' + Rnumb + '')
    * delay(10000)
    * waitFor('/html/body/app-root/html/body/div[2]/div/div/app-audit-list/div/mat-tab-group/div/mat-tab-body[2]/div/app-visa-audit/div[1]/div/mat-accordion/mat-expansion-panel/div/div/form/button[1]/span').click()
    * delay(8000)
    * screenshot()
    * def xpath = '/html/body/app-root/html/body/div[2]/div/div/app-audit-list/div/mat-tab-group/div/mat-tab-body[2]/div/app-visa-audit/div[2]/mat-table/mat-row[1]/mat-cell[3]'
    * def actualText = waitFor(xpath).getText()
    * print actualText
    * def expectedText = ' Payment '
    * match actualText == expectedText
