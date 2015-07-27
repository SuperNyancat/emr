package com.ust.emr.dao;

import java.util.List;

import com.ust.emr.model.Medication;
import com.ust.emr.model.MedicationsAndPrescriptions;
import com.ust.emr.model.Patient;
import com.ust.emr.utilities.DataAccessException;

public interface MedicationsAndPrescriptionsDao {
	void addMedication(MedicationsAndPrescriptions medicationsAndPrescriptions);
	void addMedicine(Medication meds);
	
	MedicationsAndPrescriptions getMedsById(Long id);

	List<MedicationsAndPrescriptions> getAllMedsOfPatient(Patient patient) throws DataAccessException;
}
