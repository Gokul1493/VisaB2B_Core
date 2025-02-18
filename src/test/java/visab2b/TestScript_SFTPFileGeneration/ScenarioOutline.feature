Feature: Generate SFTP Files for Different Countries

  # Background: Common setup for all scenarios
  Background:
    * def Url = "https://connectors.cbwpayments.com/visab2b/#/" 
    * def sftpInfo = read('classpath:visab2b/TestData/SftpTestData.json') 
    * def testData = read('classpath:visab2b/TestData/Config.json')
    * def Hashutils = Java.type('visab2b.Drivers.Addons')
    * def File = Java.type('java.io.File')
    * def Files = Java.type('java.nio.file.Files')
    * def Paths = Java.type('java.nio.file.Paths')

  # Scenario Outline: Define the test template with placeholders
  Scenario Outline: Generate SFTP File for <Country>
    Given a country code <CountryCode>
    And a template file path <TemplateFilePath>
    When the SFTP file is generated
    Then the file should be created successfully
    And the file should be encrypted successfully
    And the encrypted file should be moved to the SFTP server

    # Examples: Define the data for each scenario execution
    Examples:
      | CountryCode | TemplateFilePath                      |
      | Albania     | classpath:visab2b/SFTPMT103_files/SFTPALBANIA.txt |
      | Germany     | classpath:visab2b/SFTPMT103_files/SFTPGERMANY.txt | 
      | France      | classpath:visab2b/SFTPMT103_files/SFTPFRANCE.txt  |

    # Definitions: Implement the steps for each scenario
    Definitions:
      Given a country code <CountryCode>
        * def countryCode = <CountryCode> # Store the country code in a variable

      And a template file path <TemplateFilePath>
        * def templateFilePath = <TemplateFilePath> # Store the template file path

      When the SFTP file is generated
        * def Uniquefilename = Hashutils.PLtoken() # Generate a unique filename
        * def referenceNumber = "MT103SFTP" + countryCode + Uniquefilename 
        * def fileContent = read(templateFilePath) # Read the template file content
        * def fileContent = """
          ${fileContent}
          """.replaceAll(":20:SFTPALBANIA00001", ":20:" + referenceNumber + '1') 
          # Replace Albania placeholders with dynamic country-specific placeholders 
          # ... (other replacements)
        * def fileName = countryCode + 'SFTP' + Uniquefilename + '.txt'
        * karate.write(fileContent, fileName) # Write the modified file content to a new file
        * print fileName
        * def sourcePath = sftpInfo.localSourcePath + fileName
        * def destinationPath = sftpInfo.localDestinationPath + fileName
        * def filemoved = Hashutils.moveFile(sourcePath, destinationPath) 
        * print 'File moved successfully!'

      Then the file should be created successfully
        * def moveFile = new java.io.File(destinationPath)
        * match moveFile.exists() == true # Verify if the file exists in the destination path

      And the file should be encrypted successfully
        * def EncryptPGP = sftpInfo.pgpScript + ' ' + sftpInfo.localDestinationPath + fileName
        * def result = karate.exec({ line: EncryptPGP, workingDir: sftpInfo.localDestinationPath })
        * match result.exitCode == 0 
        * if (result.exitCode != 0) { 
          fail 'Encryption failed. Exit code: ' + result.exitCode + ', Output: ' + result.output 
        }
        * def encryptedFilePath = sftpInfo.localDestinationPath + fileName + '.asc'
        * def encryptedFile = new java.io.File(encryptedFilePath)
        * match encryptedFile.exists() == true # Verify if the encrypted file exists

      And the encrypted file should be moved to the SFTP server
        * def movetosftp = 'cp ' + fileName + '.asc' + ' ' + sftpInfo.Encryptefile
        * def result = karate.exec({ line: movetosftp, workingDir: workingDir })
        * def movedfile = sftpInfo.Encryptefile + fileName + '.asc'
        * print movedfile
        * def movedfiles = new java.io.File(movedfile)
        * match movedfiles.exists() == true
        * Hashutils.connect(sftpInfo.sftpUserName, sftpInfo.sftpPassword, sftpInfo.sftpIp, sftpInfo.sftpHost)
        * def movedsftpfile = Hashutils.upload(movedfile, sftpInfo.remotePath)
        * def remoteFilePath = sftpInfo.remotePath + fileName + '.asc'
        * Hashutils.disconnect()
        * if (encryptedFile) { 
          karate.log('File moved successfully, deleting original file') 
          new File(encryptedFilePath).delete() 
        }
        * if (moveFile) { 
          karate.log('File moved successfully, deleting original file') 
          new File(destinationPath).delete() 
        }
        * if (movedfiles) { 
          karate.log('File moved successfully, deleting original file') 
          new File(movedfile).delete() 
        }