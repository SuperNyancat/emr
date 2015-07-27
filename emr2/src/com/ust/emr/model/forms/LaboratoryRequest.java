package com.ust.emr.model.forms;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.ust.emr.model.Comment;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;

@Entity
@Table(name = "form_laboratory_request")
public class LaboratoryRequest {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;
	private String bedNumber;
	private String admissionNumber;
	private String hospitalNumber;
	private String diagnosis;
	private String specimen;

	// column 1
	private String[] hematology;
	private String[] urineExamination;
	private String[] stoolExamination;
	private String[] cultureOnly;
	private String[] sensitivityTestOnly;
	private String[] cultureAndSensitivity;
	private String[] mtbBactec;
	private String[] stainingProcedures;
	private String[] others;

	// col 2
	private String[] clinicalChemistry;
	private String[] urineChemistry;
	private String urineChemDuration;
	private String[] transudateAndExudate;
	private String[] specialBloodChemistry;

	// col 3
	private String[] coagulationTests;
	private String[] latexOrRoutineTests;
	private String[] tumorMarkers;
	private String[] hepatitisMarkers;
	private String[] anemiaPanel;
	private String[] reproductiveTests;
	private String[] prohibitedDrugTesting;
	private String[] polymerseChainReaction;

	// col4
	private String[] autoimmuneTests;
	private String[] endocrineTests;
	private String[] electrophoresis;
	private String[] flowCytometry;
	private String[] infectiousDiseases;

	private String othersTextArea;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@ManyToOne
	@JoinColumn(name = "patient_id", nullable = false)
	public Patient getPatient() {
		return patient;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "revisionHistory_id")
	public RevisionHistory getRevisionHistory() {
		return revisionHistory;
	}

	@Column(name = "bedNumber")
	public String getBedNumber() {
		return bedNumber;
	}

	@Column(name = "admissionNumber")
	public String getAdmissionNumber() {
		return admissionNumber;
	}

	@Column(name = "hospitalNumber")
	public String getHospitalNumber() {
		return hospitalNumber;
	}

	@Column(name = "diagnosis")
	public String getDiagnosis() {
		return diagnosis;
	}

	@Column(name = "specimen")
	public String getSpecimen() {
		return specimen;
	}

	@Column(name = "hematology")
	public String[] getHematology() {
		return hematology;
	}

	@Column(name = "urineExamination")
	public String[] getUrineExamination() {
		return urineExamination;
	}

	@Column(name = "stoolExamination")
	public String[] getStoolExamination() {
		return stoolExamination;
	}

	@Column(name = "cultureOnly")
	public String[] getCultureOnly() {
		return cultureOnly;
	}

	@Column(name = "sensitivityTestOnly")
	public String[] getSensitivityTestOnly() {
		return sensitivityTestOnly;
	}

	@Column(name = "cultureAndSensitivity")
	public String[] getCultureAndSensitivity() {
		return cultureAndSensitivity;
	}

	@Column(name = "mtbBactec")
	public String[] getMtbBactec() {
		return mtbBactec;
	}

	@Column(name = "stainingProcedures")
	public String[] getStainingProcedures() {
		return stainingProcedures;
	}

	@Column(name = "others")
	public String[] getOthers() {
		return others;
	}

	@Column(name = "clinicalChemistry")
	public String[] getClinicalChemistry() {
		return clinicalChemistry;
	}

	@Column(name = "urineChemistry")
	public String[] getUrineChemistry() {
		return urineChemistry;
	}

	@Column(name = "urineChemDuration")
	public String getUrineChemDuration() {
		return urineChemDuration;
	}

	@Column(name = "transudateAndExudate")
	public String[] getTransudateAndExudate() {
		return transudateAndExudate;
	}

	@Column(name = "specialBloodChemistry")
	public String[] getSpecialBloodChemistry() {
		return specialBloodChemistry;
	}

	@Column(name = "coagulationTests")
	public String[] getCoagulationTests() {
		return coagulationTests;
	}

	@Column(name = "latexOrRoutineTests")
	public String[] getLatexOrRoutineTests() {
		return latexOrRoutineTests;
	}

	@Column(name = "tumorMarkers")
	public String[] getTumorMarkers() {
		return tumorMarkers;
	}

	@Column(name = "hepatitisMarkers")
	public String[] getHepatitisMarkers() {
		return hepatitisMarkers;
	}

	@Column(name = "anemiaPanel")
	public String[] getAnemiaPanel() {
		return anemiaPanel;
	}

	@Column(name = "reproductiveTests")
	public String[] getReproductiveTests() {
		return reproductiveTests;
	}

	@Column(name = "prohibitedDrugTesting")
	public String[] getProhibitedDrugTesting() {
		return prohibitedDrugTesting;
	}

	@Column(name = "polymerseChainReaction")
	public String[] getPolymerseChainReaction() {
		return polymerseChainReaction;
	}

	@Column(name = "autoimmuneTests")
	public String[] getAutoimmuneTests() {
		return autoimmuneTests;
	}

	@Column(name = "endocrineTests")
	public String[] getEndocrineTests() {
		return endocrineTests;
	}

	@Column(name = "electrophoresis")
	public String[] getElectrophoresis() {
		return electrophoresis;
	}

	@Column(name = "flowCytometry")
	public String[] getFlowCytometry() {
		return flowCytometry;
	}

	@Column(name = "infectiousDiseases")
	public String[] getInfectiousDiseases() {
		return infectiousDiseases;
	}

	@Column(name = "othersTextArea")
	public String getOthersTextArea() {
		return othersTextArea;
	}

	/**
	 * SETTERS
	 * */

	public void setId(Long id) {
		this.id = id;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public void setRevisionHistory(RevisionHistory revisionHistory) {
		this.revisionHistory = revisionHistory;
	}

	public void setBedNumber(String bedNumber) {
		this.bedNumber = bedNumber;
	}

	public void setAdmissionNumber(String admissionNumber) {
		this.admissionNumber = admissionNumber;
	}

	public void setHospitalNumber(String hospitalNumber) {
		this.hospitalNumber = hospitalNumber;
	}

	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}

	public void setSpecimen(String specimen) {
		this.specimen = specimen;
	}

	public void setHematology(String[] hematology) {
		this.hematology = hematology;
	}

	public void setUrineExamination(String[] urineExamination) {
		this.urineExamination = urineExamination;
	}

	public void setStoolExamination(String[] stoolExamination) {
		this.stoolExamination = stoolExamination;
	}

	public void setCultureOnly(String[] cultureOnly) {
		this.cultureOnly = cultureOnly;
	}

	public void setSensitivityTestOnly(String[] sensitivityTestOnly) {
		this.sensitivityTestOnly = sensitivityTestOnly;
	}

	public void setCultureAndSensitivity(String[] cultureAndSensitivity) {
		this.cultureAndSensitivity = cultureAndSensitivity;
	}

	public void setMtbBactec(String[] mtbBactec) {
		this.mtbBactec = mtbBactec;
	}

	public void setStainingProcedures(String[] stainingProcedures) {
		this.stainingProcedures = stainingProcedures;
	}

	public void setOthers(String[] others) {
		this.others = others;
	}

	public void setClinicalChemistry(String[] clinicalChemistry) {
		this.clinicalChemistry = clinicalChemistry;
	}

	public void setUrineChemistry(String[] urineChemistry) {
		this.urineChemistry = urineChemistry;
	}

	public void setUrineChemDuration(String urineChemDuration) {
		this.urineChemDuration = urineChemDuration;
	}

	public void setTransudateAndExudate(String[] transudateAndExudate) {
		this.transudateAndExudate = transudateAndExudate;
	}

	public void setSpecialBloodChemistry(String[] specialBloodChemistry) {
		this.specialBloodChemistry = specialBloodChemistry;
	}

	public void setCoagulationTests(String[] coagulationTests) {
		this.coagulationTests = coagulationTests;
	}

	public void setLatexOrRoutineTests(String[] latexOrRoutineTests) {
		this.latexOrRoutineTests = latexOrRoutineTests;
	}

	public void setTumorMarkers(String[] tumorMarkers) {
		this.tumorMarkers = tumorMarkers;
	}

	public void setHepatitisMarkers(String[] hepatitisMarkers) {
		this.hepatitisMarkers = hepatitisMarkers;
	}

	public void setAnemiaPanel(String[] anemiaPanel) {
		this.anemiaPanel = anemiaPanel;
	}

	public void setReproductiveTests(String[] reproductiveTests) {
		this.reproductiveTests = reproductiveTests;
	}

	public void setProhibitedDrugTesting(String[] prohibitedDrugTesting) {
		this.prohibitedDrugTesting = prohibitedDrugTesting;
	}

	public void setPolymerseChainReaction(String[] polymerseChainReaction) {
		this.polymerseChainReaction = polymerseChainReaction;
	}

	public void setAutoimmuneTests(String[] autoimmuneTests) {
		this.autoimmuneTests = autoimmuneTests;
	}

	public void setEndocrineTests(String[] endocrineTests) {
		this.endocrineTests = endocrineTests;
	}

	public void setElectrophoresis(String[] electrophoresis) {
		this.electrophoresis = electrophoresis;
	}

	public void setFlowCytometry(String[] flowCytometry) {
		this.flowCytometry = flowCytometry;
	}

	public void setInfectiousDiseases(String[] infectiousDiseases) {
		this.infectiousDiseases = infectiousDiseases;
	}

	public void setOthersTextArea(String othersTextArea) {
		this.othersTextArea = othersTextArea;
	}

}
