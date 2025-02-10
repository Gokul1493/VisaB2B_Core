package visab2b.Drivers;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.SecureRandom;
import java.security.Signature;
import java.security.spec.ECGenParameterSpec;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.apache.commons.codec.binary.Base32;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;

import com.intuit.karate.junit5.Karate;

import de.taimos.totp.TOTP;

public class Addons {
    public static Map<String, String> variables = new HashMap<>();

    public static String SetData(String name, String value) {
    	variables.put(name, value);
        return value;
    }

    public static Object GetData(String key) {
        return variables.get(key);
    }

    static long ctr = 0;

    public static String btoa(String inp) {
        return java.util.Base64.getEncoder().encodeToString(inp.getBytes());
    }

    public static long seq() {
        if (ctr == 0) {
			ctr = System.currentTimeMillis() / 1000L;
		}
        ctr++;
        return ctr;
    }

    public static String sign(String payload, String pk) {
        String pkey = pk.replaceAll("BEGIN EC PRIVATE KEY|END EC PRIVATE KEY|BEGIN PRIVATE KEY|END PRIVATE KEY|\n| |-",
                "");

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

    public static String[] genKP() throws Exception {
        KeyPairGenerator keyGen = KeyPairGenerator.getInstance("EC", "SunEC");
        keyGen.initialize(new ECGenParameterSpec("secp256r1"), new SecureRandom());
        KeyPair kp = keyGen.generateKeyPair();

        String prs = java.util.Base64.getEncoder().encodeToString(kp.getPrivate().getEncoded());
        String pbs = "-----BEGIN PUBLIC KEY-----\n" + Base64.encodeBase64String(kp.getPublic().getEncoded())
                + "\n-----END PUBLIC KEY-----";
        return new String[]{prs, pbs};
    }

    public static String getTOTPCode(String secretKey) {
        Base32 base32 = new Base32();
        byte[] bytes = base32.decode(secretKey);
        String hexKey = Hex.encodeHexString(bytes);
        return TOTP.getOTP(hexKey);
    }

    @Karate.Test
    public void karateTest() {
        // Define your Karate tests here
    }

    public static String PLtoken() {
        Random random = new Random();

        long min = 1000000000L;   // 10 digits: 1,000,000,000
        long max = 9999999999L;   // 10 digits: 9,999,999,999

        long random10DigitNumber = min + (long)(random.nextDouble() * (max - min + 1));

        return Long.toString(random10DigitNumber);
    }

    public static String EmailId() {
        Random random = new Random();
        String domain = "netxdsolution.com";
        String username = "user" + random.nextInt(1000);
        return username + "@" + domain;
    }
    public static String SSNno() {
        Random random = new Random();

        // Generate random numbers for each section of the SSN
        int areaNumber = 100 + random.nextInt(900); // Random number between 100 and 999
        int groupNumber = 10 + random.nextInt(90);  // Random number between 10 and 99
        int serialNumber = 1000 + random.nextInt(9000); // Random number between 1000 and 9999

        // Format the SSN with dashes
        String ssn = String.format("%03d%02d%04d", areaNumber, groupNumber, serialNumber);

        return ssn;
    }


}