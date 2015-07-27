package com.ust.emr.dao;

import java.util.List;

import com.ust.emr.model.Disease;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Medicine;
import com.ust.emr.model.Nurse;
import com.ust.emr.utilities.DataAccessException;

public interface AdminDao {
	// only enabled ones will be fetched
	List<Doctor> searchDoctors(String name, String specialization) throws DataAccessException;
	List<Nurse> searchNurses(String string) throws DataAccessException;	
	
	List<Doctor> getAllEnabledDoctors() throws DataAccessException;
	List<Nurse> getAllEnabledNurses() throws DataAccessException;
	List<Doctor> getAllDisabledDoctors() throws DataAccessException;
	List<Nurse> getAllDisabledNurses() throws DataAccessException;
	
	
	/**
	 * MEDICINE AND DISEASE
	 * */
	
	void AddMedicine(Medicine medicine);
	void AddDisease(Disease disease);
	
	Medicine getMedicineById(Long id);
	Disease getDiseaseById(Long id);
	
	List<Medicine> searchMedicine(String genericName, String brandName) throws DataAccessException;
	List<Medicine> getAllMedicines() throws DataAccessException;
	List<Disease> getAllDiseases()throws DataAccessException;
	List<Disease> searchDisease(String name) throws DataAccessException;
	
	void updateDisease(Disease disease);
	void updateMedicine(Medicine medicine);
	
	
}
