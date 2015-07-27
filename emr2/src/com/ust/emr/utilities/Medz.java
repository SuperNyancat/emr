package com.ust.emr.utilities;

import java.util.List;

import com.ust.emr.model.Medication;

public class Medz {
	private List<Medication> medications;

	public Medz(List<Medication> medz2) {
		this.medications = medz2;
	}

	public List<Medication> getMedications() {
		return medications;
	}

	public void setMedications(List<Medication> medz) {
		this.medications = medz;
	}
	
	
}
