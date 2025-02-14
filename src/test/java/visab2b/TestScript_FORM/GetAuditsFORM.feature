Feature: GETAUDITS_FORM

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
    * url QaUrl + 'api'
    * def user = testData.Visa_CK
    * def getAudits = read('classpath:visab2b/Payload/GetAudits.json')

  Scenario Outline: Get Audits for Own Countries
    * def inputName = "<inputName>"
    * def getReferenceNumber = jutil.GetData(inputName)
    * print 'Fetching data for:', inputName
    * print 'Retrieved Reference:', getReferenceNumber
    # Assert that getReferenceNumber is NOT null or empty
    * match getReferenceNumber != null
    * match getReferenceNumber != ""
    * call read('classpath:visab2b/Audits/GetAudit_RS.feature') { reference: '#(getReferenceNumber)' }

    Examples: 
      | inputName                                      |
      | GetAuditPositive_Albania                       |
      | GetAuditPositive_Algeria                       |
      | GetAuditPositive_Angola                        |
      | GetAuditPositive_Antigua                       |
      | GetAuditPositive_Argentina                     |
      #| GetAuditPositive_Armenia                       |
      #| GetAuditPositive_Australia                     |
      #| GetAuditPositive_Austria                       |
      #| GetAuditPositive_Azerbaijan                    |
      #| GetAuditPositive_Bahamas                       |
      #| GetAuditPositive_Bahrain(Any Currency)         |
      #| GetAuditPositive_Bahrain(BHD)                  |
      #| GetAuditPositive_Bangladesh                    |
      #| GetAuditPositive_Belarus                       |
      #| GetAuditPositive_Belgium                       |
      #| GetAuditPositive_Bermuda                       |
      #| GetAuditPositive_Bolivia                       |
      #| GetAuditPositive_Bosnia and Herzegovina        |
      #| GetAuditPositive_botswana                      |
      #| GetAuditPositive_Brazil                        |
      #| GetAuditPositive_British Virgin Islands        |
      #| GetAuditPositive_Bulgaria                      |
      #| GetAuditPositive_Cambodia                      |
      #| GetAuditPositive_Canada(CAD)                   |
      #| GetAuditPositive_Canada(CAD)clearingmemberid   |
      #| GetAuditPositive_Canada(USD)                   |
      #| GetAuditPositive_Cayman Islands                |
      #| GetAuditPositive_Chile                         |
      #| GetAuditPositive_China                         |
      #| GetAuditPositive_Colombia                      |
      #| GetAuditPositive_Costa Rica                    |
      #| GetAuditPositive_Cote Divoire                  |
      #| GetAuditPositive_Croatia                       |
      #| GetAuditPositive_Curacao                       |
      #| GetAuditPositive_Cyprus                        |
      #| GetAuditPositive_Czech Republic                |
      #| GetAuditPositive_Denmark                       |
      #| GetAuditPositive_Dominican Republic            |
      #| GetAuditPositive_Ecuador                       |
      #| GetAuditPositive_Egypt                         |
      #| GetAuditPositive_El Salvador                   |
      #| GetAuditPositive_Estonia                       |
      #| GetAuditPositive_Finland                       |
      #| GetAuditPositive_France                        |
      #| GetAuditPositive_Georgia                       |
      #| GetAuditPositive_Germany                       |
      #| GetAuditPositive_Ghana                         |
      #| GetAuditPositive_Greece                        |
      #| GetAuditPositive_Guatemala                     |
      #| GetAuditPositive_Guyana                        |
      #| GetAuditPositive_Haiti                         |
      #| GetAuditPositive_Honduras                      |
      #| GetAuditPositive_Hong Kong                     |
      #| GetAuditPositive_Hungary                       |
      #| GetAuditPositive_Iceland                       |
      #| GetAuditPositive_Indonesia                     |
      #| GetAuditPositive_Ireland                       |
      #| GetAuditPositive_Israel                        |
      #| GetAuditPositive_Italy                         |
      #| GetAuditPositive_Jamaica                       |
      #| GetAuditPositive_Japan                         |
      #| GetAuditPositive_Jordan                        |
      #| GetAuditPositive_Kazakhstan                    |
      #| GetAuditPositive_Kenya                         |
      #| GetAuditPositive_Kuwait                        |
      #| GetAuditPositive_Laos                          |
      #| GetAuditPositive_Latvia                        |
      #| GetAuditPositive_Lebanon                       |
      #| GetAuditPositive_Lithuania                     |
      #| GetAuditPositive_Luxembourg                    |
      #| GetAuditPositive_Malaysia                      |
      #| GetAuditPositive_Maldives                      |
      #| GetAuditPositive_Malta                         |
      #| GetAuditPositive_Mauritius                     |
      #| GetAuditPositive_Mexico                        |
      #| GetAuditPositive_Mongolia                      |
      #| GetAuditPositive_Morocco                       |
      #| GetAuditPositive_Mozambique                    |
      #| GetAuditPositive_Namibia                       |
      #| GetAuditPositive_Netherlands                   |
      #| GetAuditPositive_New Zealand                   |
      #| GetAuditPositive_New Zealandinclearingmemberid |
      #| GetAuditPositive_Nicaragua                     |
      #| GetAuditPositive_Nigeria                       |
      #| GetAuditPositive_Norway                        |
      #| GetAuditPositive_Oman                          |
      #| GetAuditPositive_Pakistan                      |
      #| GetAuditPositive_Panama                        |
      #| GetAuditPositive_Paraguay                      |
      #| GetAuditPositive_Peru                          |
      #| GetAuditPositive_Philippines                   |
      #| GetAuditPositive_Poland                        |
      #| GetAuditPositive_Portugal                      |
      #| GetAuditPositive_PuertoRico                    |
      #| GetAuditPositive_Qatar                         |
      #| GetAuditPositive_Romania                       |
      #| GetAuditPositive_Saudi Arabia                  |
      #| GetAuditPositive_Senegal                       |
      #| GetAuditPositive_Serbia                        |
      #| GetAuditPositive_Singapore                     |
      #| GetAuditPositive_Slovakia                      |
      #| GetAuditPositive_Slovenia                      |
      #| GetAuditPositive_South Africa                  |
      #| GetAuditPositive_South Korea                   |
      #| GetAuditPositive_Spain                         |
      #| GetAuditPositive_Sri Lanka                     |
      #| GetAuditPositive_Sweden                        |
      #| GetAuditPositive_Switzerland                   |
      #| GetAuditPositive_Taiwan                        |
      #| GetAuditPositive_Tanzania                      |
      #| GetAuditPositive_Thailand                      |
      #| GetAuditPositive_Trinidad and Tobago           |
      #| GetAuditPositive_Tunisia                       |
      #| GetAuditPositive_Turkey                        |
      #| GetAuditPositive_Turks and Caicos Islands      |
      #| GetAuditPositive_Uganda                        |
      #| GetAuditPositive_Ukraine                       |
      #| GetAuditPositive_United Arab Emirates          |
      #| GetAuditPositive_United Kingdom                |
      #| GetAuditPositive_United States                 |
      #| GetAuditPositive_Uruguay                       |
      #| GetAuditPositive_Vietnam                       |
      #| GetAuditPositive_Zambia                        |

  Scenario Outline: Get Audits for Cross Border Currency
    * def inputName = "<inputName>"
    * def getReferenceNumber = jutil.GetData(inputName)
    * print 'Fetching data for:', inputName
    * print 'Retrieved Reference:', getReferenceNumber
    # Assert that getReferenceNumber is NOT null or empty
    * match getReferenceNumber != null
    * match getReferenceNumber != ""
    * call read('classpath:visab2b/Audits/GetAudit_RS.feature') { reference: '#(getReferenceNumber)' }

    Examples: 
      | inputName                                    |
      | GetAuditCrossBorder_Albania                  |
      | GetAuditCrossBorder_Algeria                  |
      | GetAuditCrossBorder_Angola                   |
      | GetAuditCrossBorder_Antigua                  |
      | GetAuditCrossBorder_Argentina                |
      #| GetAuditCrossBorder_Armenia                  |
      #| GetAuditCrossBorder_Australia                |
      #| GetAuditCrossBorder_Austria                  |
      #| GetAuditCrossBorder_Azerbaijan               |
      #| GetAuditCrossBorder_Bahamas                  |
      #| GetAuditCrossBorder_Bahrain(Any Currency)    |
      #| GetAuditCrossBorder_Bangladesh               |
      #| GetAuditCrossBorder_Belarus                  |
      #| GetAuditCrossBorder_Belgium                  |
      #| GetAuditCrossBorder_Bermuda                  |
      #| GetAuditCrossBorder_Bolivia                  |
      #| GetAuditCrossBorder_Bosnia and Herzegovina   |
      #| GetAuditCrossBorder_botswana                 |
      #| GetAuditCrossBorder_Brazil                   |
      #| GetAuditCrossBorder_British Virgin Islands   |
      #| GetAuditCrossBorder_Bulgaria                 |
      #| GetAuditCrossBorder_Cambodia                 |
      #| GetAuditCrossBorder_Canada(CAD)              |
      #| GetAuditCrossBorder_Cayman Islands           |
      #| GetAuditCrossBorder_Chile                    |
      #| GetAuditCrossBorder_China                    |
      #| GetAuditCrossBorder_Colombia                 |
      #| GetAuditCrossBorder_Costa Rica               |
      #| GetAuditCrossBorder_Cote Divoire             |
      #| GetAuditCrossBorder_Croatia                  |
      #| GetAuditCrossBorder_Curacao                  |
      #| GetAuditCrossBorder_Cyprus                   |
      #| GetAuditCrossBorder_Czech Republic           |
      #| GetAuditCrossBorder_Denmark                  |
      #| GetAuditCrossBorder_Dominican Republic       |
      #| GetAuditCrossBorder_Ecuador                  |
      #| GetAuditCrossBorder_Egypt                    |
      #| GetAuditCrossBorder_El Salvador              |
      #| GetAuditCrossBorder_Estonia                  |
      #| GetAuditCrossBorder_Finland                  |
      #| GetAuditCrossBorder_France                   |
      #| GetAuditCrossBorder_Georgia                  |
      #| GetAuditCrossBorder_Ghana                    |
      #| GetAuditCrossBorder_Greece                   |
      #| GetAuditCrossBorder_Guyana                   |
      #| GetAuditCrossBorder_Haiti                    |
      #| GetAuditCrossBorder_Honduras                 |
      #| GetAuditCrossBorder_Hong Kong                |
      #| GetAuditCrossBorder_Hungary                  |
      #| GetAuditCrossBorder_Iceland                  |
      #| GetAuditCrossBorder_Indonesia                |
      #| GetAuditCrossBorder_Ireland                  |
      #| GetAuditCrossBorder_Israel                   |
      #| GetAuditCrossBorder_Italy                    |
      #| GetAuditCrossBorder_Jamaica                  |
      #| GetAuditCrossBorder_Japan                    |
      #| GetAuditCrossBorder_Jordan                   |
      #| GetAuditCrossBorder_Kazakhstan               |
      #| GetAuditCrossBorder_Kenya                    |
      #| GetAuditCrossBorder_Kuwait                   |
      #| GetAuditCrossBorder_Laos                     |
      #| GetAuditCrossBorder_Latvia                   |
      #| GetAuditCrossBorder_Lebanon                  |
      #| GetAuditCrossBorder_Lithuania                |
      #| GetAuditCrossBorder_Luxembourg               |
      #| GetAuditCrossBorder_Malaysia                 |
      #| GetAuditCrossBorder_Maldives                 |
      #| GetAuditCrossBorder_Malta                    |
      #| GetAuditCrossBorder_Mauritius                |
      #| GetAuditCrossBorder_Mexico                   |
      #| GetAuditCrossBorder_Mongolia                 |
      #| GetAuditCrossBorder_Morocco                  |
      #| GetAuditCrossBorder_Mozambique               |
      #| GetAuditCrossBorder_Namibia                  |
      #| GetAuditCrossBorder_Netherlands              |
      #| GetAuditCrossBorder_New Zealand              |
      #| GetAuditCrossBorder_Nicaragua                |
      #| GetAuditCrossBorder_Nigeria                  |
      #| GetAuditCrossBorder_Norway                   |
      #| GetAuditCrossBorder_Oman                     |
      #| GetAuditCrossBorder_Pakistan                 |
      #| GetAuditCrossBorder_Panama                   |
      #| GetAuditCrossBorder_Paraguay                 |
      #| GetAuditCrossBorder_Peru                     |
      #| GetAuditCrossBorder_Philippines              |
      #| GetAuditCrossBorder_Poland                   |
      #| GetAuditCrossBorder_Portugal                 |
      #| GetAuditCrossBorder_PuertoRico               |
      #| GetAuditCrossBorder_Qatar                    |
      #| GetAuditCrossBorder_Romania                  |
      #| GetAuditCrossBorder_Saudi Arabia             |
      #| GetAuditCrossBorder_Senegal                  |
      #| GetAuditCrossBorder_Serbia                   |
      #| GetAuditCrossBorder_Singapore                |
      #| GetAuditCrossBorder_Slovakia                 |
      #| GetAuditCrossBorder_Slovenia                 |
      #| GetAuditCrossBorder_South Africa             |
      #| GetAuditCrossBorder_South Korea              |
      #| GetAuditCrossBorder_Spain                    |
      #| GetAuditCrossBorder_Sri Lanka                |
      #| GetAuditCrossBorder_Sweden                   |
      #| GetAuditCrossBorder_Switzerland              |
      #| GetAuditCrossBorder_Taiwan                   |
      #| GetAuditCrossBorder_Tanzania                 |
      #| GetAuditCrossBorder_Thailand                 |
      #| GetAuditCrossBorder_Trinidad and Tobago      |
      #| GetAuditCrossBorder_Tunisia                  |
      #| GetAuditCrossBorder_Turkey                   |
      #| GetAuditCrossBorder_Turks and Caicos Islands |
      #| GetAuditCrossBorder_Uganda                   |
      #| GetAuditCrossBorder_Ukraine                  |
      #| GetAuditCrossBorder_United Arab Emirates     |
      #| GetAuditCrossBorder_United Kingdom           |
      #| GetAuditCrossBorder_United States            |
      #| GetAuditCrossBorder_Uruguay                  |
      #| GetAuditCrossBorder_Vietnam                  |
      #| GetAuditCrossBorder_Zambia                   |
