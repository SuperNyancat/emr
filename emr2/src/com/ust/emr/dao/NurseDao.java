package com.ust.emr.dao;

import java.util.List;

import com.ust.emr.model.Nurse;
import com.ust.emr.model.Patient;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

public interface NurseDao {
	void createNurse(Nurse nurse);
	void updateNurse(Nurse nurse);
	
	Nurse getNurseByUser(User user);
	Nurse getNurseById(Long id);
	
	List<Patient> viewAllPatients() throws DataAccessException; // nurse only
	
	
}
