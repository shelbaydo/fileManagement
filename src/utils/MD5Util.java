package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class MD5Util {
public static String md5(String message){
		
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			
			byte[] messageByte = md.digest(message.getBytes());
			BASE64Encoder encoder = new BASE64Encoder();
			return encoder.encode(messageByte);
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} 
		
	}
}
