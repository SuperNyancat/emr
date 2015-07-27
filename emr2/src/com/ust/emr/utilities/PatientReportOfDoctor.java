package com.ust.emr.utilities;

import com.ust.emr.model.Diagnosis;
import com.ust.emr.model.Patient;

public class PatientReportOfDoctor {
	public Patient patient;
	public Diagnosis diagnosis;
	public Patient getPatient() {
		return patient;
	}
	public Diagnosis getDiagnosis() {
		return diagnosis;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	public void setDiagnosis(Diagnosis diagnosis) {
		this.diagnosis = diagnosis;
	}
	
	
}
