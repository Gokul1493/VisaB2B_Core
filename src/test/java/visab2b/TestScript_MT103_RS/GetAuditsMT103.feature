Feature: GETAUDITS_MT103RS

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
      | inputName                 |
      | GetAuditPositiveAlbania   |
      | GetAuditPositiveAlgeria   |
      | GetAuditPositiveAngola    |
      | GetAuditPositiveAntigua   |
      | GetAuditPositiveArgentina |

  #| GetAuditPositiveArmenia             |
  #| GetAuditPositiveAustralia           |
  #| GetAuditPositiveAustria             |
  #| GetAuditPositiveAzerbaijan          |
  #| GetAuditPositiveBahamas             |
  #| GetAuditPositiveBahrainANY          |
  #| GetAuditPositiveBahrainBHD          |
  #| GetAuditPositiveBangladesh          |
  #| GetAuditPositiveBelarus             |
  #| GetAuditPositiveBelgium             |
  #| GetAuditPositiveBermuda             |
  #| GetAuditPositiveBolivia             |
  #| GetAuditPositiveBosniaandHerzegovina|
  #| GetAuditPositiveBotswana            |
  #| GetAuditPositiveBrazil              |
  #| GetAuditPositiveBritishVirginIslands|
  #| GetAuditPositiveBulgaria            |
  #| GetAuditPositiveCambodia            |
  #| GetAuditPositiveCanadaCAD           |
  #| GetAuditPositiveCanadaCAD           |
  #| GetAuditPositiveCanadaUSD           |
  #| GetAuditPositiveCaymanIslands       |
  #| GetAuditPositiveChile               |
  #| GetAuditPositiveChina               |
  #| GetAuditPositiveColombia            |
  #| GetAuditPositiveCostaRica           |
  #| GetAuditPositiveCoteDivoire         |
  #| GetAuditPositiveCroatia             |
  #| GetAuditPositiveCuracao             |
  #| GetAuditPositiveCyprus              |
  #| GetAuditPositiveCzechRepublic       |
  #| GetAuditPositiveDenmark             |
  #| GetAuditPositiveDominicanRepublic   |
  #| GetAuditPositiveEcuador             |
  #| GetAuditPositiveEgypt               |
  #| GetAuditPositiveEgypt               |
  #| GetAuditPositiveEgypt               |
  #| GetAuditPositiveEgypt               |
  #| GetAuditPositiveElSalvador          |
  #| GetAuditPositiveEstonia             |
  #| GetAuditPositiveFinland             |
  #| GetAuditPositiveFrance              |
  #| GetAuditPositiveGeorgia             |
  #| GetAuditPositiveGermany             |
  #| GetAuditPositiveGhana               |
  #| GetAuditPositiveGreece              |
  #| GetAuditPositiveGuatemala           |
  #| GetAuditPositiveGuyana              |
  #| GetAuditPositiveHalti               |
  #| GetAuditPositiveHonduras            |
  #| GetAuditPositiveHongkong            |
  #| GetAuditPositiveHungary             |
  #| GetAuditPositiveIceland             |
  #| GetAuditPositiveIndonesia           |
  #| GetAuditPositiveIreland             |
  #| GetAuditPositiveIsrael              |
  #| GetAuditPositiveItaly               |
  #| GetAuditPositiveJamaica             |
  #| GetAuditPositiveJapan               |
  #| GetAuditPositiveJordan              |
  #| GetAuditPositiveKazakhstan          |
  #| GetAuditPositiveKenya               |
  #| GetAuditPositiveKuwait              |
  #| GetAuditPositiveLaos                |
  #| GetAuditPositiveLatvia              |
  #| GetAuditPositiveLebanon             |
  #| GetAuditPositiveLithuania           |
  #| GetAuditPositiveLuxembourg          |
  #| GetAuditPositiveMalaysia            |
  #| GetAuditPositiveMaldives            |
  #| GetAuditPositiveMalta               |
  #| GetAuditPositiveMauritius           |
  #| GetAuditPositiveMexico              |
  #| GetAuditPositiveMongolia            |
  #| GetAuditPositiveMorocco             |
  #| GetAuditPositiveMozambique          |
  #| GetAuditPositiveNamibia             |
  #| GetAuditPositiveNetherlands         |
  #| GetAuditPositiveNewZealand          |
  #| GetAuditPositiveNicaragua           |
  #| GetAuditPositiveNigeria             |
  #| GetAuditPositiveNorway              |
  #| GetAuditPositiveOman                |
  #| GetAuditPositivePakistan            |
  #| GetAuditPositivePanama              |
  #| GetAuditPositiveParaguay            |
  #| GetAuditPositivePeru                |
  #| GetAuditPositivePhilippines         |
  #| GetAuditPositivePoland              |
  #| GetAuditPositivePortugal            |
  #| GetAuditPositivePuertoRico          |
  #| GetAuditPositiveQatar               |
  #| GetAuditPositiveRomania             |
  #| GetAuditPositiveSaudiArabia         |
  #| GetAuditPositiveSenegal             |
  #| GetAuditPositiveSerbia              |
  #| GetAuditPositiveSingapore           |
  #| GetAuditPositiveSlovakia            |
  #| GetAuditPositiveSlovenia            |
  #| GetAuditPositiveSouthAfrica         |
  #| GetAuditPositiveSouthKorea          |
  #| GetAuditPositiveSpain               |
  #| GetAuditPositiveSriLanka            |
  #| GetAuditPositiveSweden              |
  #| GetAuditPositiveSwitzerland         |
  #| GetAuditPositiveTaiwan              |
  #| GetAuditPositiveTanzania            |
  #| GetAuditPositiveThailand            |
  #| GetAuditPositiveTrinidadandTobago   |
  #| GetAuditPositiveTunisia             |
  #| GetAuditPositiveTurkey              |
  #| GetAuditPositiveTurksandCaicosIslands |
  #| GetAuditPositiveUganda              |
  #| GetAuditPositiveUkraine             |
  #| GetAuditPositiveUnitedKingdom       |
  #| GetAuditPositiveUnitedStates        |
  #| GetAuditPositiveUruguay             |
  #| GetAuditPositiveVietnam             |
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
      | inputName                    |
      | GetAuditCrossBorderAlbania   |
      | GetAuditCrossBorderAlgeria   |
      | GetAuditCrossBorderAngola    |
      | GetAuditCrossBorderAntigua   |
      | GetAuditCrossBorderArgentina |
    #| GetAuditCrossBorderArmenia               |
    #| GetAuditCrossBorderAustralia             |
    #| GetAuditCrossBorderAustria               |
    #| GetAuditCrossBorderAzerbaijan            |
    #| GetAuditCrossBorderBahamas               |
    #| GetAuditCrossBorderBahrainBHD            |
    #| GetAuditCrossBorderBangladesh            |
    #| GetAuditCrossBorderBelarus               |
    #| GetAuditCrossBorderBelgium               |
    #| GetAuditCrossBorderBermuda               |
    #| GetAuditCrossBorderBolivia               |
    #| GetAuditCrossBorderBosniaandHerzegovina  |
    #| GetAuditCrossBorderBotswana              |
    #| GetAuditCrossBorderBrazil                |
    #| GetAuditCrossBorderBritishVirginIslands  |
    #| GetAuditCrossBorderCambodia              |
    #| GetAuditCrossBorderCanadaCAD             |
    #| GetAuditCrossBorderCaymanIslands         |
    #| GetAuditCrossBorderChile                 |
    #| GetAuditCrossBorderChina                 |
    #| GetAuditCrossBorderColombia              |
    #| GetAuditCrossBorderCoteDivoire           |
    #| GetAuditCrossBorderCroatia               |
    #| GetAuditCrossBorderCuracao               |
    #| GetAuditCrossBorderCyprus                |
    #| GetAuditCrossBorderCzechRepublic         |
    #| GetAuditCrossBorderDenmark               |
    #| GetAuditCrossBorderDominicanRepublic     |
    #| GetAuditCrossBorderEcuador               |
    #| GetAuditCrossBorderElSalvador            |
    #| GetAuditCrossBorderEstonia               |
    #| GetAuditCrossBorderFinland               |
    #| GetAuditCrossBorderFrance                |
    #| GetAuditCrossBorderGeorgia               |
    #| GetAuditCrossBorderGermany               |
    #| GetAuditCrossBorderGhana                 |
    #| GetAuditCrossBorderGreece                |
    #| GetAuditCrossBorderGuatemala             |
    #| GetAuditCrossBorderGuyana                |
    #| GetAuditCrossBorderHaiti                 |
    #| GetAuditCrossBorderHonduras              |
    #| GetAuditCrossBorderHongkong              |
    #| GetAuditCrossBorderHungary               |
    #| GetAuditCrossBorderIceland               |
    #| GetAuditCrossBorderIndonesia             |
    #| GetAuditCrossBorderIreland               |
    #| GetAuditCrossBorderIsrael                |
    #| GetAuditCrossBorderItaly                 |
    #| GetAuditCrossBorderJamaica               |
    #| GetAuditCrossBorderJapan                 |
    #| GetAuditCrossBorderJordan                |
    #| GetAuditCrossBorderKazakhstan            |
    #| GetAuditCrossBorderKenya                 |
    #| GetAuditCrossBorderKuwait                |
    #| GetAuditCrossBorderLaos                  |
    #| GetAuditCrossBorderLatvia                |
    #| GetAuditCrossBorderLebanon               |
    #| GetAuditCrossBorderLithuania             |
    #| GetAuditCrossBorderLuxembourg            |
    #| GetAuditCrossBorderMalaysia              |
    #| GetAuditCrossBorderMaldives              |
    #| GetAuditCrossBorderMalta                 |
    #| GetAuditCrossBorderMauritius             |
    #| GetAuditCrossBorderMexico                |
    #| GetAuditCrossBorderMongolia              |
    #| GetAuditCrossBorderMorocco               |
    #| GetAuditCrossBorderMozambique            |
    #| GetAuditCrossBorderNamibia               |
    #| GetAuditCrossBorderNetherlands           |
    #| GetAuditCrossBorderNewZealand            |
    #| GetAuditCrossBorderNicaragua             |
    #| GetAuditCrossBorderNigeria               |
    #| GetAuditCrossBorderNorway                |
    #| GetAuditCrossBorderOman                  |
    #| GetAuditCrossBorderPakistan              |
    #| GetAuditCrossBorderPanama                |
    #| GetAuditCrossBorderParaguay              |
    #| GetAuditCrossBorderPeru                  |
    #| GetAuditCrossBorderPhilippines           |
    #| GetAuditCrossBorderPoland                |
    #| GetAuditCrossBorderPortugal              |
    #| GetAuditCrossBorderPuertoRico            |
    #| GetAuditCrossBorderQatar                 |
    #| GetAuditCrossBorderRomania               |
    #| GetAuditCrossBorderSaudiArabia           |
    #| GetAuditCrossBorderSenegal               |
    #| GetAuditCrossBorderSerbia                |
    #| GetAuditCrossBorderSingapore             |
    #| GetAuditCrossBorderSlovakia              |
    #| GetAuditCrossBorderSlovenia              |
    #| GetAuditCrossBorderSouthAfrica           |
    #| GetAuditCrossBorderSouthKorea            |
    #| GetAuditCrossBorderSpain                 |
    #| GetAuditCrossBorderSriLanka              |
    #| GetAuditCrossBorderSweden                |
    #| GetAuditCrossBorderSwitzerland           |
    #| GetAuditCrossBorderTaiwan                |
    #| GetAuditCrossBorderTanzania              |
    #| GetAuditCrossBorderThailand              |
    #| GetAuditCrossBorderTrinidadandTobago     |
    #| GetAuditCrossBorderTunisia               |
    #| GetAuditCrossBorderTurkey                |
    #| GetAuditCrossBorderTurksandCaicosIslands |
    #| GetAuditCrossBorderUganda                |
    #| GetAuditCrossBorderUkraine               |
    #| GetAuditCrossBorderUnitedKingdom         |
    #| GetAuditCrossBorderUnitedStates          |
    #| GetAuditCrossBorderUruguay               |
    #| GetAuditCrossBorderVietnam               |
