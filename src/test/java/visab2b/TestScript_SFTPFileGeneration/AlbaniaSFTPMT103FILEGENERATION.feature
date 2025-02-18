Feature: Generate the Albania SFTP FILE

  Background: 
    #* def Url = "https://connectors.cbwpayments.com/visab2b/#/"
    * def sftpInfo  = read('classpath:visab2b/TestData/SftpTestData.json')
    * def testData = read('classpath:visab2b/TestData/Config.json')
    * def filepath = read('classpath:visab2b/SFTPMT103_files/SFTPALBANIA.txt')
    * def Hashutils = Java.type('visab2b.Drivers.Addons')
    * def File = Java.type('java.io.File')
    * def Files = Java.type('java.nio.file.Files')
    * def Paths = Java.type('java.nio.file.Paths')
    * def Uniquefilename =  Hashutils.PLtoken()
    * print Uniquefilename

  Scenario: Generate SFTP MT103 File for Albania
    * def templateFilePath = 'classpath:visab2b/SFTPMT103_files/SFTPALBANIA.txt'
    * def referenceNumber = "MT103SFTPALBANIA" + Uniquefilename
    * def fileContent = read(templateFilePath)
    #replacing the existing reference number with new reference number
* def fileContent = filepath.replaceAll(":20:SFTPALBANIA00001", ":20:" + referenceNumber + '1').replaceAll(":20:SFTPALBANIA00002", ":20:" + referenceNumber + '2').replaceAll(":20:SFTPALBANIA000011", ":20:" + referenceNumber + '3').replaceAll(":20:SFTPALBANIA00003", ":20:" + referenceNumber + '4').replaceAll(":20:SFTPALBANIA00004", ":20:" + referenceNumber + '5').replaceAll(":20:SFTPALBANIA00005", ":20:" + referenceNumber + '6').replaceAll(":20:SFTPALBANIA00006", ":20:" + referenceNumber + '7').replaceAll(":20:SFTPALBANIA00007", ":20:" + referenceNumber + '8').replaceAll(":20:SFTPALBANIA00008", ":20:" + referenceNumber + '9').replaceAll(":20:SFTPALBANIA00009", ":20:" + referenceNumber + '10').replaceAll(":20:SFTPALBANIA00010", ":20:" + referenceNumber + '10')
    #Change file name
    * def fileName = 'ALBANIA' + 'SFTP' + Uniquefilename + '.txt'
    * karate.write(fileContent, fileName)
    * print fileName
    * def sourcePath = sftpInfo.localSourcePath + fileName
    * print sourcePath
    * def destinationPath = sftpInfo.localDestinationPath + fileName
    * def recipientEmail = 'jsmith@gmail.com'
    * def workingDir = sftpInfo.workingDirectory
    * def filemoved = Hashutils.moveFile(sourcePath, destinationPath)
    * print 'File moved successfully!'
    #Verifying the existence of files
    * def moveFile = new java.io.File(destinationPath)
    * match moveFile.exists() == true
    #Encypting the file using the PGP key
    # Read the key from the TestData folder
    * def encryptionKeyFile = read('classpath:visab2b/TestData/XYZ-netxd.public')
    * def EncryptPGP = sftpInfo.pgpScript + sftpInfo.localDestinationPath + fileName
    * def result = karate.exec({ line: EncryptPGP, workingDir: sftpInfo.localDestinationPath })
    * match result.exitCode == 0
    * if (result.exitCode != 0) { fail 'Encryption failed. Exit code: ' + result.exitCode + ', Output: ' + result.output }
    #replaced with the above script
    #* def EncryptPGP = sftpInfo.pgpScript + ' ' + sftpInfo.localDestinationPath + fileName
    #* def result = karate.exec({ line: EncryptPGP, workingDir: sftpInfo.localDestinationPath })
    #* match result.exitCode == 0
    #* if (result.exitCode != 0) {
    #fail 'Encryption failed. Exit code: ' + result.exitCode + ', Output: ' + result.output
    #}
    * def encryptedFilePath = sftpInfo.localDestinationPath + fileName + '.asc'
    * def encryptedFile = new java.io.File(encryptedFilePath)
    * match encryptedFile.exists() == true
    * def movetosftp = 'cp ' + fileName + '.asc' + ' ' + sftpInfo.Encryptefile
    * def result = karate.exec({ line: movetosftp, workingDir: workingDir })
    * def movedfile = sftpInfo.Encryptefile + fileName + '.asc'
    * print movedfile
    * def movedfiles = new java.io.File(movedfile)
    * match movedfiles.exists() == true
    * if (encryptedFile) {       karate.log('File moved successfully, deleting original file')       new File(encryptedFilePath).delete()     }
    * if (moveFile) {       karate.log('File moved successfully, deleting original file')  new File(destinationPath).delete()     }
    * Hashutils.connect(sftpInfo.sftpUserName, sftpInfo.sftpPassword, sftpInfo.sftpIp, sftpInfo.sftpHost)
    * def movedsftpfile = Hashutils.upload(movedfile, sftpInfo.remotePath)
    * def remoteFilePath = sftpInfo.remotePath + fileName + '.asc'
    * Hashutils.disconnect()
    * if (movedfiles) { karate.log('File moved successfully, deleting original file') new File(movedfile).delete()
    #Server operations
    # Execute SSH commands
    * karate.exec('ssh sbvisa')
    * karate.exec('ssh qavisa')
    * karate.exec('cd visab2b/convert/')
    # SFTP Login
    * def sftpCommand = 'sftp netxd@18.218.61.122'
    * def sftpProcess = Runtime.getRuntime().exec(sftpCommand)
    * Thread.sleep(2000)
    * sftpProcess.getOutputStream().write("NetX@43!\n".getBytes())
    * sftpProcess.getOutputStream().flush()
    * // ... (Optional: Read SFTP session output)
    # SFTP File Transfer
    * def getCommand = 'get ' + fileName + '.asc'
    * sftpProcess.getOutputStream().write(getCommand.getBytes())
    * sftpProcess.getOutputStream().write("\n".getBytes())
    * sftpProcess.getOutputStream().flush()
    # SFTP Logout
    * sftpProcess.getOutputStream().write("exit\n".getBytes())
    * sftpProcess.getOutputStream().flush()
    # File Copy
    * def copyCommand = 'sudo cp ' + fileName + '.asc /data/bank/XYZBANK/incoming/'
    * karate.exec({ line: copyCommand }) }
    
    
    
#
  #Scenario: Generate SFTP MT103 File for Albania
    #* def filepath = read('classpath:visab2b/SFTPMT103_files/SFTPALBANIA.txt')
    #* def referencenumber = "MT103SFTPALBANIA" + Uniquefilename
    #* def finalMt103 = filepath.replaceAll(":20:SFTPALBANIA00001", ":20:" + referencenumber +'1' ).replaceAll(":20:SFTPALBANIA00002", ":20:" + referencenumber +'2' ).replaceAll(":20:SFTPALBANIA000011", ":20:" + referencenumber +'3').replaceAll(":20:SFTPALBANIA00003", ":20:" + referencenumber +'4').replaceAll(":20:SFTPALBANIA00004", ":20:" + referencenumber +'5').replaceAll(":20:SFTPALBANIA00005", ":20:" + referencenumber +'6').replaceAll(":20:SFTPALBANIA00006", ":20:" + referencenumber +'7').replaceAll(":20:SFTPALBANIA00007", ":20:" + referencenumber +'8').replaceAll(":20:SFTPALBANIA00008", ":20:" + referencenumber +'9').replaceAll(":20:SFTPALBANIA00009", ":20:" + referencenumber +'10').replaceAll(":20:SFTPALBANIA00010", ":20:" + referencenumber +'10')
    #* def fileName = 'ALBANIA' + 'SFTP'+ Uniquefilename + '.txt'
    #* karate.write(finalMt103,fileName)
    #* print fileName
    #* def sourcePath = sftpInfo.localSourcePath +fileName
    #* def destinationPath = sftpInfo.localDestinationPath +fileName
    #* def recipientEmail = 'jsmith@gmail.com'
    #* def workingDir = sftpInfo.workingDirectory
    #* def filemoved = Hashutils.moveFile(sourcePath, destinationPath)
    #* print 'File moved successfully!'
    # *  if (filemoved) karate.log('File moved successfully, deleting original file')
    # * if (filemoved) new File(sourcePath).delete()
    # * def encryptPGP = 'sh classpath:src/test/java/EncryptPGP.sh' + recipientEmail + ' ' + destinationPath
    #* def moveFile = new java.io.File(destinationPath)
    #* match moveFile.exists() == true
    #* def EncryptPGP = sftpInfo.pgpScript +' ' +  sftpInfo.localDestinationPath +fileName
    # * karate.exec(EncryptPGP)
    #* def result = karate.exec({ line: EncryptPGP, workingDir: sftpInfo.localDestinationPath })
    # Check if the exit value is 0 (success)
    #* def encryptedFilePath = sftpInfo.localDestinationPath +fileName+'.asc'
    #* def encryptedFile = new java.io.File(encryptedFilePath)
    #* match encryptedFile.exists() == true
    # *  if (encryptedFile) karate.log('File moved successfully, deleting original file')
    # * if (encryptedFile) new File(encryptedFilePath).delete()
    #* def movetosftp = 'cp ' +fileName+'.asc' +' ' +sftpInfo.Encryptefile
    #* def result = karate.exec({ line: movetosftp, workingDir: workingDir })
    #* def movedfile = sftpInfo.Encryptefile +fileName+'.asc'
    #* print movedfile
    #* def movedfiles = new java.io.File(movedfile)
    #* match movedfiles.exists() == true
    #* if (encryptedFile) karate.log('File moved successfully, deleting original file')
    #* if (encryptedFile) new File(encryptedFilePath).delete()
    #* if (moveFile) karate.log('File moved successfully, deleting original file')
    #* if (moveFile) new File(destinationPath).delete()
    # Move the local folder to SFTP
    #* Hashutils.connect(sftpInfo.sftpUserName, sftpInfo.sftpPassword, sftpInfo.sftpIp, sftpInfo.sftpHost )
    #* def movedsftpfile = Hashutils.upload(movedfile,sftpInfo.remotePath)
    #* def remoteFilePath = sftpInfo.remotePath +fileName+'.asc'
    #* Hashutils.disconnect()
    #		*  Hashutils.connect(sftpInfo.sftpUserName, sftpInfo.sftpPassword, sftpInfo.sftpIp, sftpInfo.sftpHost )
    #		*  def movedsftpfile = Hashutils.upload(movedfile,sftpInfo.remotePath)
    #*  Hashutils.delete(remoteFilePath)
    #		*  Hashutils.disconnect()
    #* if (movedfiles) karate.log('File moved successfully, deleting original file')
    #* if (movedfiles) new File(movedfile).delete()
