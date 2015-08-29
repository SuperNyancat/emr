package com.ust.emr.dao;

import java.util.List;

import org.joda.time.LocalDate;

import com.ust.emr.model.Doctor;
import com.ust.emr.model.Patient;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

public interface DoctorDao {
	
	void createDoctor(Doctor doctor);
	void updateDoctor(Doctor doctor);
	
	// getters
	Doctor getDoctorByUser(User user) throws DataAccessException;
	Doctor getDoctorByUsername(String username) throws DataAccessException;
	
	List<Doctor> getAllEnabledDoctors() throws DataAccessException;
	List<Patient> getPatientsOfDoctor(Doctor doctor) throws DataAccessException;
	List<Patient> getPatientsOfDoctorThatStartsWith(Doctor doctor,String page) throws DataAccessException;
	List<Patient> getDisabledPatients(Doctor doctor) throws DataAccessException;
	List<Doctor> getDoctorsOrderedBySpecialization() throws DataAccessException;
	List<Doctor> getDoctorsBySpecialization(String specialization) throws DataAccessException;
	
	Doctor getDoctorById(Long doctorId);
}
