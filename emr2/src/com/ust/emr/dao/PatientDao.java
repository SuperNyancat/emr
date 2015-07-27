package com.ust.emr.dao;

import java.util.List;

import com.ust.emr.model.Archives;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Patient;
import com.ust.emr.utilities.DataAccessException;

public interface PatientDao {
	void createPatientOfDoctor(Doctor doctor, Patient patient);
	void createPatient(Patient patient);
	void update(Patient patient);
	
//	List<Patient> getPatientsWithSameSymptoms();
	
	Patient getPatientById(Long id);
	Patient getPatientByEmail(String email);
	
	List<Patient> searchPatients(String name) throws DataAccessException;
	
}
