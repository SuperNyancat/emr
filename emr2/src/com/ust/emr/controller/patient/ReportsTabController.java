package com.ust.emr.controller.patient;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.controller.forms.ReportFormsController;
import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.RevisionHistoryDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Appointment;
import com.ust.emr.model.CheckUpRecord;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Patient;
import com.ust.emr.model.forms.BASDAI;
import com.ust.emr.model.forms.BASFI;
import com.ust.emr.model.forms.BASG;
import com.ust.emr.model.forms.DamageIndexSLE;
import com.ust.emr.model.forms.MEXSLEDAI;
import com.ust.emr.model.forms.SLEDAIScore;
import com.ust.emr.model.history.HistoryUpdate;
import com.ust.emr.utilities.DataAccessException;
import com.ust.emr.utilities.HistoUpdateOfPatientReport;

@Controller
public class ReportsTabController {
	@Autowired
	private UserDao userDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private PatientDao patientDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;


	
//	public String search

	@RequestMapping("/view_reports.it")
	public String viewReports(HttpSession session, Model model, @RequestParam("id") long id, @RequestParam("y") String y) {
		System.err.println("Patient Reports - view");
		
		try {
			Patient patient = patientDao.getPatientById(id);
			int year = 0;
			if(y.equals("")) {
				year = LocalDate.now().getYear();
			} else {
				year = Integer.parseInt(y);
			}
			
			
			int currentMonth = LocalDate.now().getMonthOfYear();
			// patient count
			model.addAttribute("patientCountForms", patientVisitsCount(session, model, patient, year));
			
			// forms count
			model.addAttribute("damageForms", getDamageCount(session, model, patient, year));
			model.addAttribute("sledaiForms", getSLEDAIScoreCount(session, model, patient, year));
			model.addAttribute("mexForms", getMEXSLEDAICount(session, model, patient, year));			
			model.addAttribute("basdaiForms", getBASDAICount(session, model, patient, year));
			model.addAttribute("basgForms", getBASGCount(session, model, patient, year));
			model.addAttribute("basfiForms", getBASFICount(session, model, patient, year));
			model.addAttribute("histoForms", getPatientUpdateHistoCount(session, model, patient, year));
			// medicines
			
			addCurrentLoggedInUser(session, model, patient);
			model.addAttribute("year", year);
			model.addAttribute("month", currentMonth);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "patient/reports/reports-view";
	}

	
	
	
	
	/**
	 * Patient visits count
	 * @throws DataAccessException 
	 * */
	
	// Check up sessions
	private Map<String, String> patientVisitsCount(HttpSession session,	Model model, Patient patient, int year) throws DataAccessException  {
		Map<String, String> checkupCount = new LinkedHashMap<>();
		int month = 1;
		int[] count = new int[12];

		List<CheckUpRecord> forms = new ArrayList<>();
		try {
			forms = checkupDao.getAllFormsAscending("CheckUpRecord", patient);
		} catch (DataAccessException e) {
			for(int i = 0; i < 12; i++) {
				checkupCount.put(getStringOfMonth(i + 1), String.valueOf(count[i]));
			}
		}
		
		for (CheckUpRecord cu : forms) {
			LocalDate date = cu.getRevisionHistory().getDateCreated();
			if (date.getYear() == year) {
				while (date.getMonthOfYear() != month) {
					month++;
				}
				count[month - 1]++;
			}
		}
		
		for(int i = 0; i < 12; i++) {
			checkupCount.put(getStringOfMonth(i + 1), String.valueOf(count[i]));
		}
		return checkupCount;
	}
	
	//History update
	public List<String> getPatientUpdateHistoCount(HttpSession session, Model model, Patient patient, int year)  {
//		int month = 1;
//		List<HistoUpdateOfPatientReport> histoReportClass = new ArrayList<>(); 
//		List<HistoryUpdate> forms = new ArrayList<>();
//		
//		//initialize list
//		for(int i = 0; i < 12; i++) {
//			HistoUpdateOfPatientReport h = new HistoUpdateOfPatientReport();
//			histoReportClass.add(h);
//		}
//		
//		try {
//			forms = histoUpdateDao.getAllFormsAscending("HistoryUpdate", patient);
//		} catch (DataAccessException e) {
//			System.err.println("this should print " + e.getMessage());
//			return histoReportClass;
//		}
//		
//		for (HistoryUpdate cu : forms) {
//			LocalDate date = cu.getRevisionHistory().getDateCreated();
//			if (date.getYear() == year) {
//				while (date.getMonthOfYear() != month) {
//					month++;
//				}
//				HistoUpdateOfPatientReport histUOPR = histoReportClass.get(month-1);
//				histUOPR.count++;
//				histUOPR.month = month;
//				histUOPR.histoUpdates.add(cu);
//			}
//		}
//		return histoReportClass;
		int month = 1;
		int[] count = new int[12];
		List<String> countHisto = new ArrayList<>();
		List<HistoryUpdate> forms = new ArrayList<>();
		try {
			forms = histoUpdateDao.getAllFormsAscending("HistoryUpdate", patient);
		} catch (DataAccessException e) {
			for(int i = 0; i < 12; i++) {
				countHisto.add(String.valueOf(count[i]));
			}
		}
		
		for (HistoryUpdate cu : forms) {
			LocalDate date = cu.getRevisionHistory().getDateCreated();
			if (date.getYear() == year) {
				while (date.getMonthOfYear() != month) {
					month++;
				}
				count[month - 1]++;
			}
		}
		
		for(int i = 0; i < 12; i++) {
			countHisto.add(String.valueOf(count[i]));
		}
		return countHisto;
	}
	
	
	

	/**
	 * Forms Count
	 * @throws DataAccessException 
	 * 
	 * */
	// History Update
	
	
	// DamageIndex
	private Map<Integer, String> getDamageCount(HttpSession session, Model model, Patient patient, int year)  {
		Map<Integer, String> damageIndex = new LinkedHashMap<>();
		int month = 1;
		int[] count = new int[12];
		
		List<DamageIndexSLE> forms;
		try {
			forms = damageDao.getAllFormsAscending("DamageIndexSLE", patient);
		} catch (DataAccessException e) {
			for (int i = 0; i < 12; i++) {
				damageIndex.put(i+1, String.valueOf(count[i]));
			}
			return damageIndex;
		}
		
		for (DamageIndexSLE cu : forms) {
			LocalDate date = cu.getRevisionHistory().getDateCreated();
			if (date.getYear() == year) {
				while (date.getMonthOfYear() != month) {
					month++;
				}
				count[month - 1]++;
			}
		}

		for (int i = 0; i < 12; i++) {
			damageIndex.put(i+1, String.valueOf(count[i]));
		}
		
		return damageIndex;

	}
	
	//SLEDAI score
	private Map<Integer, String> getSLEDAIScoreCount(HttpSession session, Model model, Patient patient, int year)  {
		Map<Integer, String> countForms = new LinkedHashMap<>();		
		int month = 1;
		int[] count = new int[12];
		
		List<SLEDAIScore> forms;
		try {
			forms = sledaiScoreDao.getAllFormsAscending("SLEDAIScore", patient);
		} catch (DataAccessException e) {
			for (int i = 0; i < 12; i++) {
				countForms.put(i+1, String.valueOf(count[i]));
			}
			return countForms;
		}
		
		for (SLEDAIScore cu : forms) {
			LocalDate date = cu.getRevisionHistory().getDateCreated();
			if (date.getYear() == year) {
				while (date.getMonthOfYear() != month) {
					month++;
				}
				count[month - 1]++;
			}
		}

		for (int i = 0; i < 12; i++) {
			countForms.put(i+1, String.valueOf(count[i]));
		}
		
		return countForms;

	}
	
	//MEXSLEDAI
	private Map<Integer, String> getMEXSLEDAICount(HttpSession session, Model model, Patient patient, int year)  {
		Map<Integer, String> countForms = new LinkedHashMap<>();
		
		int month = 1;
		int[] count = new int[12];
		
		List<MEXSLEDAI> forms;
		try {
			forms = mexDao.getAllFormsAscending("MEXSLEDAI", patient);
		} catch (DataAccessException e) {
			for (int i = 0; i < 12; i++) {
				countForms.put(i+1, String.valueOf(count[i]));
			}
			return countForms;
		}
		
		for (MEXSLEDAI cu : forms) {
			LocalDate date = cu.getRevisionHistory().getDateCreated();
			if (date.getYear() == year) {
				while (date.getMonthOfYear() != month) {
					month++;
				}
				count[month - 1]++;
			}
		}

		for (int i = 0; i < 12; i++) {
			countForms.put(i+1, String.valueOf(count[i]));
		}
		
		return countForms;

	}
	
	//BASDAI
	private Map<Integer, String> getBASDAICount(HttpSession session, Model model, Patient patient, int year)  {
		Map<Integer, String> countForms = new LinkedHashMap<>();	
		int month = 1;
		int[] count = new int[12];
		
		List<BASDAI> forms;
		try {
			forms = basdaiDao.getAllFormsAscending("BASDAI", patient);
		} catch (DataAccessException e) {
			for (int i = 0; i < 12; i++) {
				countForms.put(i+1, String.valueOf(count[i]));
			}
			return countForms;
		}
		
		for (BASDAI cu : forms) {
			LocalDate date = cu.getRevisionHistory().getDateCreated();
			if (date.getYear() == year) {
				while (date.getMonthOfYear() != month) {
					month++;
				}
				count[month - 1]++;
			}
		}

		for (int i = 0; i < 12; i++) {
			countForms.put(i+1, String.valueOf(count[i]));
		}
		
		return countForms;

	}
	
	//BASG
	private Map<Integer, String> getBASGCount(HttpSession session, Model model, Patient patient, int year)  {
		Map<Integer, String> countForms = new LinkedHashMap<>();		
		int month = 1;
		int[] count = new int[12];
		
		List<BASG> forms;
		try {
			forms = basgDao.getAllFormsAscending("BASG", patient);
		} catch (DataAccessException e) {
			for (int i = 0; i < 12; i++) {
				countForms.put(i+1, String.valueOf(count[i]));
			}
			return countForms;
		}
		
		for (BASG cu : forms) {
			LocalDate date = cu.getRevisionHistory().getDateCreated();
			if (date.getYear() == year) {
				while (date.getMonthOfYear() != month) {
					month++;
				}
				count[month - 1]++;
			}
		}

		for (int i = 0; i < 12; i++) {
			countForms.put(i+1, String.valueOf(count[i]));
		}
		
		return countForms;

	}
	
	//BASFI
	private Map<Integer, String> getBASFICount(HttpSession session, Model model, Patient patient, int year)  {
		Map<Integer, String> countForms = new LinkedHashMap<>();
		int month = 1;
		int[] count = new int[12];
		
		List<BASFI> forms;
		try {
			forms = basfiDao.getAllFormsAscending("BASFI", patient);
		} catch (DataAccessException e) {
			for (int i = 0; i < 12; i++) {
				countForms.put(i+1, String.valueOf(count[i]));
			}
			return countForms;
		}
		
		for (BASFI cu : forms) {
			LocalDate date = cu.getRevisionHistory().getDateCreated();
			if (date.getYear() == year) {
				while (date.getMonthOfYear() != month) {
					month++;
				}
				count[month - 1]++;
			}
		}

		for (int i = 0; i < 12; i++) {
			countForms.put(i+1, String.valueOf(count[i]));
		}
		
		return countForms;

	}
	
	
		
	
	
	/**
	 * helper methods
	 * @throws DataAccessException 
	 * */

	private void addCurrentLoggedInUser(HttpSession session, Model model,
			Patient patient) throws DataAccessException  {
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		Doctor doctor = doctorDao.getDoctorByUsername(username);
		model.addAttribute("doctor", doctor);
		model.addAttribute("patient", patient);
	}

	public String getStringOfMonth(int month) {
		String m = "";
		switch (month) {
		case 1:
			m = "January";
			break;
		case 2:
			m = "February";
			break;
		case 3:
			m = "March";
			break;
		case 4:
			m = "April";
			break;
		case 5:
			m = "May";
			break;
		case 6:
			m = "June";
			break;
		case 7:
			m = "July";
			break;
		case 8:
			m = "August";
			break;
		case 9:
			m = "September";
			break;
		case 10:
			m = "October";
			break;
		case 11:
			m = "November";
			break;
		case 12:
			m = "December";
			break;
		}
		return m;
	}

	
	@Autowired
	private FormsDao<BASDAI> basdaiDao;

	@Autowired
	private FormsDao<BASG> basgDao;

	@Autowired
	private FormsDao<BASFI> basfiDao;

	@Autowired
	private FormsDao<SLEDAIScore> sledaiScoreDao;
	
	@Autowired
	private FormsDao<MEXSLEDAI> mexDao;
	
	@Autowired
	private FormsDao<DamageIndexSLE> damageDao;
	
	@Autowired
	private FormsDao<CheckUpRecord> checkupDao;
	
	@Autowired
	private FormsDao<HistoryUpdate> histoUpdateDao;
}
