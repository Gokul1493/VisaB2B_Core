Feature: Login Page

  Background: 
    * def Url = "https://connectors.cbwpayments.com/visab2b/#/"
    #* def req = read('classpath:TestPayload/Login.json')
    #* print req
    * def testData = read('classpath:Testdata/config.json')
    * def Hashutils = Java.type('visaTestScript.Addons')
    #* print testData
    * configure driver = { type: 'chrome',addOptions: ["--remote-allow-origins=*"] }
    * configure ssl = false
    * configure readTimeout = 50000

  @maker
  Scenario: Successful Login
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
