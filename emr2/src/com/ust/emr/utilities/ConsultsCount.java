package com.ust.emr.utilities;

import com.ust.emr.model.Diagnosis;
import com.ust.emr.model.Patient;

public class ConsultsCount {
	public int yearCount;
	public int[] count = new int[12];
	public Patient patient;
	public Diagnosis diagnosis;

	public int getYearCount() {
		return yearCount;
	}

	public int[] getCount() {
		return count;
	}

	public Patient getPatient() {
		return patient;
	}

	public Diagnosis getDiagnosis() {
		return diagnosis;
	}

	public void setYearCount(int yearCount) {
		this.yearCount = yearCount;
	}

	public void setCount(int[] count) {
		this.count = count;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public void setDiagnosis(Diagnosis diagnosis) {
		this.diagnosis = diagnosis;
	}

}
