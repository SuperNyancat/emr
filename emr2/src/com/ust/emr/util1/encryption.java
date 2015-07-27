package com.ust.emr.util1;
import java.io.UnsupportedEncodingException;
import java.util.Scanner;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
 


import org.apache.commons.codec.binary.Hex;
 
public class encryption {
	public static SecretKeySpec generateMySQLAESKey(final String key, final String encoding) {
		try {
			final byte[] finalKey = new byte[16];
			int i = 0;
			for(byte b : key.getBytes(encoding))
				finalKey[i++%16] ^= b;			
			return new SecretKeySpec(finalKey, "AES");
		} catch(UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
	}
	public String encrypt(String val){
		try{
			final Cipher encryptCipher = Cipher.getInstance("AES");
			encryptCipher.init(Cipher.ENCRYPT_MODE, generateMySQLAESKey("yo mama so fat i miss four episode", "UTF-8"));
			return  new String(Hex.encodeHex(encryptCipher.doFinal(val.getBytes("UTF-8")))); 
		}
		catch(Exception e){
			e.printStackTrace();
			return "";
		}
	}
	
	public String decrypt(String val){
		try{
			final Cipher decryptCipher = Cipher.getInstance("AES");	        				
			decryptCipher.init(Cipher.DECRYPT_MODE, generateMySQLAESKey("yo mama so fat i miss four episode", "UTF-8"));
			return new String(decryptCipher.doFinal(Hex.decodeHex(val.toCharArray())));
		}
		catch(Exception e){
			e.printStackTrace();
			return "";
		}
	}
	public static void main(String ...args){
		Scanner sc = new Scanner(System.in);
		String val = "";
		System.out.print("Word: ");
		val = sc.nextLine();
		val = new encryption().encrypt(val);
		System.out.println("Encrypt: "+val);
		val = new encryption().decrypt(val);
		System.out.println("decrypt: "+val);
	}
}