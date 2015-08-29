package com.ust.emr.util1;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
 






import org.apache.commons.codec.binary.Hex;

import com.ust.emr.model.Disease;
import com.ust.emr.model.Medicine;
 
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
	
	public String[] decrypt(String[] val){
		String[] temp = new String[val.length];
		for(int a = 0; a < val.length; a++)
			try{
				temp[a] = decrypt(val[a]);
			}
			catch(Exception e){
			temp = new String[0];
			}
		return temp;
	}
	
	public String[] encrypt(String[] val){
		String[] temp = new String[val.length];
		for(int a = 0; a < val.length; a++)
			try{
				temp[a] = encrypt(val[a]);
			}
			catch(Exception e){
			temp = new String[0];
			}
		return temp;
	}
	
	public Medicine encrypt(Medicine medicine){
		medicine.setId(medicine.getId());
		medicine.setBrandName(encrypt(medicine.getBrandName()));
		medicine.setGenericName(encrypt(medicine.getGenericName()));
		medicine.setSideEffects(encrypt(medicine.getSideEffects()));
		medicine.setUses(encrypt(medicine.getUses()));
		return medicine;
	}
	
	public Medicine decrypt(Medicine medicine){
		medicine.setId(medicine.getId());
		medicine.setBrandName(decrypt(medicine.getBrandName()));
		medicine.setGenericName(decrypt(medicine.getGenericName()));
		medicine.setSideEffects(decrypt(medicine.getSideEffects()));
		medicine.setUses(decrypt(medicine.getUses()));
		return medicine;
	}
	
	public Disease encrypt(Disease disease){
		disease.setId(disease.getId());
		disease.setDescription(encrypt(disease.getDescription()));
		disease.setName(encrypt(disease.getName()));
		disease.setStage0Desc(encrypt(disease.getStage0Desc()));
		disease.setStage1Desc(encrypt(disease.getStage1Desc()));
		disease.setStage2Desc(encrypt(disease.getStage2Desc()));
		disease.setStage3Desc(encrypt(disease.getStage3Desc()));
		disease.setStage4Desc(encrypt(disease.getStage4Desc()));
		disease.setType(encrypt(disease.getType()));
		return disease;
	}
	
	public Disease decrypt(Disease disease){
		disease.setId(disease.getId());
		disease.setDescription(decrypt(disease.getDescription()));
		disease.setName(decrypt(disease.getName()));
		disease.setStage0Desc(decrypt(disease.getStage0Desc()));
		disease.setStage1Desc(decrypt(disease.getStage1Desc()));
		disease.setStage2Desc(decrypt(disease.getStage2Desc()));
		disease.setStage3Desc(decrypt(disease.getStage3Desc()));
		disease.setStage4Desc(decrypt(disease.getStage4Desc()));
		disease.setType(decrypt(disease.getType()));
		return disease;
	}
	
	public List<Disease> decryptDiseaseList(List<Disease> diseases) {
		List<Disease> des =  new ArrayList<Disease>();
		for(int i = 0; i < diseases.size(); i++){
			des.add(decrypt(diseases.get(i)));
		}
		return des;
	}
	
	public List<Disease> encryptDiseaseList(List<Disease> diseases) {
		List<Disease> des =  new ArrayList<Disease>();
		for(int i = 0; i < diseases.size(); i++){
			des.add(encrypt(diseases.get(i)));
		}
		return des;
	}
	
	public List<Medicine> decryptMedicineList(List<Medicine> medicines) {
		List<Medicine> des =  new ArrayList<Medicine>();
		for(int i = 0; i < medicines.size(); i++){
			des.add(decrypt(medicines.get(i)));
		}
		return des;
	}
	
	public List<Medicine> encryptMedicineList(List<Medicine> medicines) {
		List<Medicine> des =  new ArrayList<Medicine>();
		for(int i = 0; i < medicines.size(); i++){
			des.add(encrypt(medicines.get(i)));;
		}
		return des;
	}
	

//	public static void main(String ...args){
//		Scanner sc = new Scanner(System.in);
//		String val = "";
//		System.out.print("Word: ");
//		val = sc.nextLine();
//		val = new encryption().encrypt(val);
//		System.out.println("Encrypt: "+val);
//		val = new encryption().decrypt(val);
//		System.out.println("decrypt: "+val);
//	}
}