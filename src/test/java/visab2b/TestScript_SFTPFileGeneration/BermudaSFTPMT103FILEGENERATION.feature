
Feature: Generate the Bermuda SFTP FILE

  Background: 
    * def Url = "https://connectors.cbwpayments.com/visab2b/#/"
 
    * def sftpInfo  = read('classpath:visab2b/TestData/SftpTestData.json')
    * def testData = read('classpath:visab2b/TestData/Config.json')
    * def Hashutils = Java.type('visab2b.Drivers.Addons')
    
   
    * def File = Java.type('java.io.File')
    * def Files = Java.type('java.nio.file.Files')
    * def Paths = Java.type('java.nio.file.Paths')


    * def Uniquefilename =  Hashutils.PLtoken()
    * print Uniquefilename
 
    

  Scenario: Generate SFTP MT103 File for Bermuda
    * def filepath = read('classpath:visab2b/SFTPMT103_files/SFTPBERMUDA.txt')
    * def referencenumber = "MT103SFTPBERMUDA" + Uniquefilename
    * def finalMt103 = filepath.replaceAll(":20:SFTPBERMUDA0001", ":20:" + referencenumber +'1' ).replaceAll(":20:SFTPBERMUDA0002", ":20:" + referencenumber +'2' ).replaceAll(":20:SFTPBERMUDA0003", ":20:" + referencenumber +'3').replaceAll(":20:SFTPBERMUDA0004", ":20:" + referencenumber +'4').replaceAll(":20:SFTPBERMUDA0005", ":20:" + referencenumber +'5').replaceAll(":20:SFTPBERMUDA0006", ":20:" + referencenumber +'6').replaceAll(":20:SFTPBERMUDA0007", ":20:" + referencenumber +'7').replaceAll(":20:SFTPBERMUDA0008", ":20:" + referencenumber +'8').replaceAll(":20:SFTPBERMUDA0009", ":20:" + referencenumber +'9')
    * def fileName = 'BERMUDA' + 'SFTP'+ Uniquefilename + '.txt'
    * karate.write(finalMt103,fileName)
    * print fileName
    * def sourcePath = sftpInfo.localSourcePath +fileName
    * def destinationPath = sftpInfo.localDestinationPath +fileName
    * def recipientEmail = 'gc.boopathi@bankcbw.org'
    * def workingDir = sftpInfo.workingDirectory
    * def filemoved = Hashutils.moveFile(sourcePath, destinationPath)
    * print 'File moved successfully!'
    # *  if (filemoved) karate.log('File moved successfully, deleting original file')
    # * if (filemoved) new File(sourcePath).delete()
    # * def encryptPGP = 'sh classpath:src/test/java/EncryptPGP.sh' + recipientEmail + ' ' + destinationPath
    * def moveFile = new java.io.File(destinationPath)
    * match moveFile.exists() == true
    * def EncryptPGP = sftpInfo.pgpScript +' ' +  sftpInfo.localDestinationPath +fileName
    # * karate.exec(EncryptPGP)
    * def result = karate.exec({ line: EncryptPGP, workingDir: sftpInfo.localDestinationPath })
     # Check if the exit value is 0 (success)
    *  def encryptedFilePath = sftpInfo.localDestinationPath +fileName+'.asc'
    * def encryptedFile = new java.io.File(encryptedFilePath)
    * match encryptedFile.exists() == true
  
    # *  if (encryptedFile) karate.log('File moved successfully, deleting original file')
   # * if (encryptedFile) new File(encryptedFilePath).delete()
    * def movetosftp = 'cp ' +fileName+'.asc' +' ' +sftpInfo.Encryptefile
    * def result = karate.exec({ line: movetosftp, workingDir: workingDir })
    * def movedfile = sftpInfo.Encryptefile +fileName+'.asc'
    * print movedfile
    * def movedfiles = new java.io.File(movedfile)
    * match movedfiles.exists() == true
  
		* if (encryptedFile) karate.log('File moved successfully, deleting original file')
		* if (encryptedFile) new File(encryptedFilePath).delete()
		* if (moveFile) karate.log('File moved successfully, deleting original file')
		* if (moveFile) new File(destinationPath).delete()
		# Move the local folder to SFTP
		*  Hashutils.connect(sftpInfo.sftpUserName, sftpInfo.sftpPassword, sftpInfo.sftpIp, sftpInfo.sftpHost )
		*  def movedsftpfile = Hashutils.upload(movedfile,sftpInfo.remotePath)
		* def remoteFilePath = sftpInfo.remotePath +fileName+'.asc'
	
		*  Hashutils.disconnect()
#		*  Hashutils.connect(sftpInfo.sftpUserName, sftpInfo.sftpPassword, sftpInfo.sftpIp, sftpInfo.sftpHost )
#		*  def movedsftpfile = Hashutils.upload(movedfile,sftpInfo.remotePath)
    #*  Hashutils.delete(remoteFilePath)
#		*  Hashutils.disconnect()
		* if (movedfiles) karate.log('File moved successfully, deleting original file')
		 * if (movedfiles) new File(movedfile).delete()
		
