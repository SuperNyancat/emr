package com.ust.emr.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.controller.patient.ReportsTabController;
import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Diagnosis;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Patient;
import com.ust.emr.model.history.HistoryUpdate;
import com.ust.emr.utilities.AnnualPatientReport;
import com.ust.emr.utilities.ConsultsCount;
import com.ust.emr.utilities.DataAccessException;
import com.ust.emr.utilities.DiagnosisStatistics;
import com.ust.emr.utilities.PatientReportOfDoctor;

@Controller
public class DoctorReportsController {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private FormsDao<Diagnosis> diagnosisDao;
	
	@Autowired
	private FormsDao<HistoryUpdate> histoUpdateDao;
	
	private String[] diseases = {"Rheumatoid Arthritis", "Systemic Lupus Erythematosus", "Ankylosing Spondylitis",
			"Psoriatic arthritis", "Systemic Sclerosis"};
	
	@RequestMapping(value = "/view_doctor_reports.it")
	public String viewreports(HttpSession session, Model model, @RequestParam("y") String y) {
		System.err.println("doctor reports controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Doctor doctor = null;
		try {
			int year = 0;
			if(y.equals("now")) {
				year = LocalDate.now().getYear();
			} else {
				year = Integer.parseInt(y);
			}
			
			doctor = doctorDao.getDoctorByUsername(username);
			model.addAttribute("doctor", doctor);
			model.addAttribute("year", year);
			model.addAttribute("patientCount", getMonthlyPatientCount(year, doctor));
			model.addAttribute("diagnosisReport", getDiagnosisReport(year, doctor));
			initializeDateLists();
			model.addAttribute("patientReport", getPatientReport(year,doctor));
			initializeDateLists();
		} catch (DataAccessException e) {
			model.addAttribute("errorMessagePatientCount", e.getMessage());
		}
		
		try {
			List<Patient> disabledPatients = doctorDao.getDisabledPatients(doctor);
			model.addAttribute("disabledPatients", disabledPatients);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessageDisabledPatients", e.getMessage());
		}
		
		return "doctor/doctor-reports";
	}
	
	

	/**
	 * patient count
	 * */
	
	private Map<String, Integer> getMonthlyPatientCount(int year, Doctor doctor) throws DataAccessException {
		 Map<String, Integer> monthlyPatientCount = new LinkedHashMap<>();
		 ReportsTabController patientReport = new ReportsTabController();
		 int month = 1; 
		 int[] count = new int[12];
	 	
		 for (Patient p: doctorDao.getPatientsOfDoctor(doctor)) {
			LocalDate date = p.getPersonInfo().getRevisionHistory().getDateCreated();
			if (date.getYear() <= year) {
				while (date.getMonthOfYear() != month) {
					month++;
				}
				count[month - 1]++;
			}
		 }

		 for (int i = 0; i < 12; i++) {
			monthlyPatientCount.put(patientReport.getStringOfMonth(i + 1), count[i]);
		 }
			
		 
		return monthlyPatientCount;
	}
	
	
	
	/**
	 * Patient Consults
	 * @throws DataAccessException 
	 * */
	private List<ConsultsCount> getPatientConsults(int year, Doctor doctor) throws DataAccessException {
		// should return the String month
		// need Patient, Diagnosis, plus count based on PatientUpdate
//		Patient encounters – number of consults or visits per month or per year according to diagnosis 
//		(example SLE – No of patients 100, no of new patients 10, no of consults/visits 500)
		List<ConsultsCount> countList = new ArrayList<>();
		
//		for(Patient p : doctorDao.getPatientsOfDoctor(doctor)) {
//			ConsultsCount cc = new ConsultsCount();
//			int count[] = new int[12];
//			int y = 0;
//			
//			for(HistoryUpdate h : histoUpdateDao.getAllForms("HistoryUpdate", p)) {
//				if(h == null) continue;
//				int month = 1;
//				LocalDate visitDate = h.getRevisionHistory().getDateCreated();
//				if (visitDate.getYear() == year) {
//					while (visitDate.getMonthOfYear() != month) {
//						month++;
//					}
//					count[month - 1]++;
//					y++;
//				}
//			}
//			
//			cc.yearCount = y;
//			cc.setCount(count);
//			cc.patient = p;
//			if(diagnosisDao.getFormByPatient("Diagnosis", p) != null) {
//				cc.diagnosis = diagnosisDao.getFormByPatient("Diagnosis", p);
//			}
			
			
			for(String month : getPatientReport(year, doctor).keySet()) {
				for(AnnualPatientReport a : getPatientReport(year, doctor).get(month)) {
//					for()
				}
			}
			
		
		return countList;
	}
	
	
	/**
	 * patient report - monthly list of patients created, age and diagnosis (basis ng date)
	 * @throws DataAccessException 
	 * */	
	
	private Map<String, List<AnnualPatientReport>> getPatientReport(int year, Doctor doctor) throws DataAccessException {
		Map<String, List<AnnualPatientReport>> reports = new LinkedHashMap<>();
		ReportsTabController patientReport = new ReportsTabController();
			
		for (Patient p: doctorDao.getPatientsOfDoctor(doctor)) {
			AnnualPatientReport report = new AnnualPatientReport();
			Diagnosis diagnosis = diagnosisDao.getFormByPatient("Diagnosis", p);
			if(diagnosis == null) continue;
			report.setPatient(p);
			report.setDiagnosis(diagnosis);
			report.month = diagnosis.getRevisionHistory().getDateModified().getMonthOfYear();
			putReportInMonthList(report);
		}
		
		reports.put(patientReport.getStringOfMonth(1), jan);
		reports.put(patientReport.getStringOfMonth(2), feb);
		reports.put(patientReport.getStringOfMonth(3), mar);
		reports.put(patientReport.getStringOfMonth(4), apr);
		reports.put(patientReport.getStringOfMonth(5), may);
		reports.put(patientReport.getStringOfMonth(6), jun);
		reports.put(patientReport.getStringOfMonth(7), jul);
		reports.put(patientReport.getStringOfMonth(8), aug);
		reports.put(patientReport.getStringOfMonth(9), sept);
		reports.put(patientReport.getStringOfMonth(10), oct);
		reports.put(patientReport.getStringOfMonth(11), nov);
		reports.put(patientReport.getStringOfMonth(12), dec);
		
		return reports;
	}
	
	


	/**
	 * diagnosis report - count of old and new patients by gender, by diagnosis
	 * @throws DataAccessException 
	 * */
	
	private Map<String, DiagnosisStatistics> getDiagnosisReport(int year, Doctor doctor) throws DataAccessException {
		Map<String, DiagnosisStatistics> stats = new LinkedHashMap<>();
		for(String s: diseases) {
			stats.put(s, getDiagnosisStatistics(year, doctor, s));
		}
		return stats;
	}
	
	
	/**
	 * HELPER METHODS
	 * */
	
	private DiagnosisStatistics getDiagnosisStatistics(int year, Doctor doctor, String disease) throws DataAccessException {
		DiagnosisStatistics stat = new DiagnosisStatistics();
		for(Patient p: doctorDao.getPatientsOfDoctor(doctor)) {
			Diagnosis diagnosis = diagnosisDao.getFormByPatient("Diagnosis", p);
			if(diagnosis == null) continue;
			
			if(patientIsDiagnosedWithDiseaseWithinYear(diagnosis, disease, year)) {
				if(isOldPatient(p, year)) {
					if(p.getPersonInfo().getSex().equals("male")) {
						stat.maleOld++;
					} else {
						stat.femaleOld++;
					}
				} else {
					if(p.getPersonInfo().getSex().equals("male")) {
						stat.maleNew++;
					} else {
						stat.femaleNew++;
					}
				}
			}
		} 

		return stat;
	}


	private boolean isOldPatient(Patient p, int year) {
		LocalDate date = p.getPersonInfo().getRevisionHistory().getDateCreated(); //old if not this month gihimo
		return (date.getYear() < year || (date.getYear() == year && date.getMonthOfYear() < LocalDate.now().getMonthOfYear()));
	}

	private boolean patientIsDiagnosedWithDiseaseWithinYear(Diagnosis diagnosis, String disease, int year) {
		return (diagnosis.getPrimaryDiagnosis().equalsIgnoreCase(disease) && diagnosis.getRevisionHistory().getDateCreated().getYear() == year);
	}

	
	private void putReportInMonthList(AnnualPatientReport report) {
		switch(report.month) {
			case 1: jan.add(report); break;
			case 2: feb.add(report); break;
			case 3: mar.add(report); break;
			case 4: apr.add(report); break;
			case 5: may.add(report); break;
			case 6: jun.add(report); break;
			case 7: jul.add(report); break;
			case 8: aug.add(report); break;
			case 9: sept.add(report); break;
			case 10: oct.add(report); break;
			case 11: nov.add(report); break;
			case 12: dec.add(report); break;
		}
	}
	
	/**
	 * hard coded so you should instantiate before and after calling the function that uses these lists
	 * */
	private void initializeDateLists() {
		jan = new ArrayList<>();
		feb = new ArrayList<>();
		mar = new ArrayList<>();
		apr = new ArrayList<>();
		may = new ArrayList<>();
		jun = new ArrayList<>();
		jul = new ArrayList<>();
		aug = new ArrayList<>();
		sept = new ArrayList<>();
		oct = new ArrayList<>();
		nov= new ArrayList<>();
		dec = new ArrayList<>();
	}
	private List<AnnualPatientReport> jan;
	private List<AnnualPatientReport> feb;
	private List<AnnualPatientReport> mar;
	private List<AnnualPatientReport> apr;
	private List<AnnualPatientReport> may;
	private List<AnnualPatientReport> jun;
	private List<AnnualPatientReport> jul;
	private List<AnnualPatientReport> aug;
	private List<AnnualPatientReport> sept;
	private List<AnnualPatientReport> oct;
	private List<AnnualPatientReport> nov;
	private List<AnnualPatientReport> dec;
}


