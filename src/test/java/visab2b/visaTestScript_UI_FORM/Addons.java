package visab2b.visaTestScript_UI_FORM;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.Signature;
import java.security.spec.PKCS8EncodedKeySpec;

import org.apache.commons.codec.binary.Base32;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;
import de.taimos.totp.TOTP;
import java.util.Random;

public class Addons {
	
	// HASHMAP Utility
	
    public static final Map<String, Object> variables = new HashMap<>();
    
    // Storing the data

    public static void SetData(String tagName, Object tagValue) {
       variables.put(tagName, tagValue);
    }

    // Retrieving the Data
    public static Object GetData(String tagName) {
        return variables.get(tagName);
     }
    
    // Signature Generation
    public static String signat(String payload, String pk) {

		String pkey = pk.replaceAll("BEGIN EC PRIVATE KEY|END EC PRIVATE KEY|BEGIN PRIVATE KEY|END PRIVATE KEY|\n| |-",
				"");
		System.out.println("pKey = " + pkey);

		byte[] fromPEM = Base64.decodeBase64(pkey);
		String sg = "";
		try {
			PrivateKey privateKey = KeyFactory.getInstance("EC", "SunEC")
					.generatePrivate(new PKCS8EncodedKeySpec(fromPEM));
			Signature signature = Signature.getInstance("SHA256withECDSA", "SunEC");
			signature.initSign(privateKey);
			signature.update(payload.getBytes("UTF-8"));
			byte[] bytes = signature.sign();
			sg = java.util.Base64.getEncoder().encodeToString(bytes);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return sg;

    }
   
    // TOTP Generation
	
	public static String getTOTPCode(String secretKey) {
	    Base32 base32 = new Base32();
	    byte[] bytes = base32.decode(secretKey);
	    String hexKey = Hex.encodeHexString(bytes);
	    return TOTP.getOTP(hexKey);
	}
	// Token Number Generation
	public static String PLtoken() {
	    Random random = new Random();

	    long min = 1000000000L;   // 10 digits: 1,000,000,000
	    long max = 9999999999L;   // 10 digits: 9,999,999,999

	    long random10DigitNumber = min + (long)(random.nextDouble() * (max - min + 1));

	    return Long.toString(random10DigitNumber);
	}
// Random Email-Id Generation
	 public static String EmailId() {
	        Random random = new Random();
	        String domain = "netxdsolution.com";
	        String username = "user" + random.nextInt(1000);
	        return username + "@" + domain;
	    }
	 // SSN Number Generator
	 public static String SSNno() {
	        Random random = new Random();
	        
	        // Generate random numbers for each section of the SSN
	        int areaNumber = 100 + random.nextInt(900); // Random number between 100 and 999
	        int groupNumber = 10 + random.nextInt(90);  // Random number between 10 and 99
	        int serialNumber = 1000 + random.nextInt(9000); // Random number between 1000 and 9999
	        
	        // Format the SSN with dashes
	        String ssn = String.format("%03d-%02d-%04d", areaNumber, groupNumber, serialNumber);
	        
	        return ssn;
	    }
	 // Base64 Encode
		public static String Encode(String inp) {
			return java.util.Base64.getEncoder().encodeToString(inp.getBytes());
		}
		
		// Reference No Generation
		public static String RefNo() {
			Date d = new Date();
	        long n = d.getTime();
	        // Convert the long to a string
	        String timestamp = Long.toString(n);
			return timestamp;
		}
		
		public static String decodeBase64(String encodedString) {
	        java.util.Base64.Decoder decoder =   java.util.Base64.getDecoder();
	        byte[] decodedBytes = decoder.decode(encodedString);
	        return new String(decodedBytes);
	    }
		public static String UserDir() {
	        String dir = "";
	        try {
	            dir = System.getProperty("user.dir");
	        } catch (Exception e) {
	            System.err.println(e.getMessage());
	        }
	        return dir;

	    }
		public static Integer randomNum(int num) {
	        int randomValue = 0;
	        try {
	            Random ran = new Random();
	            randomValue = ran.nextInt(num);
	        } catch (Exception e) {
	            System.err.println(e.getMessage());
	        }

	        return randomValue;
	    }
}
