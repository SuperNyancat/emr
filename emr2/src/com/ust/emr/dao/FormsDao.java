package com.ust.emr.dao;

import java.util.List;

import org.joda.time.LocalDate;

import com.ust.emr.model.Archives;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Patient;
import com.ust.emr.utilities.DataAccessException;

public interface FormsDao<T> {
	void createForm(T object);
	void updateForm(T object);
	void deleteForm(T object);
	
	T getFormByPatient(String name, Patient patient);
	T getFormById(String name, Long id);
	T getFormByDate(String name, LocalDate date, Patient patient);
	T getFirstForm(String name, Patient patient);
	
	List<T> getAllForms(String name, Patient patient) throws DataAccessException;
	List<T> getPreviousTwo(String entityName, Patient patient) throws DataAccessException;
	
	// specifically for appointments
	List<T> getLatestForms(String name, int max, Doctor doctor) throws DataAccessException;
	
	
	// depends on date
	List<T> getFormsByDate(String name, LocalDate date) throws DataAccessException;
	List<T> getFormsByDateModified(String name, Patient patient, int year, int month) throws DataAccessException;
	//List<Object> getFormsByDate(String name, LocalDate date, Patient patient) throws DataAccessException;
	
	
	// images
	T getImageInArchive(String name, Archives archives);
	List<T> getAllImagesInArchive(String name, Archives archives) throws DataAccessException;
	List<T> getAllFormsAscending(String name, Patient patient)
			throws DataAccessException;
	List<T> getImagesByFileName(String name, String fileName, Archives archive) throws DataAccessException;
	
	
}
