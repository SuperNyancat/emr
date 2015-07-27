package com.ust.emr.controller.forms;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.method.annotation.ModelMethodProcessor;

import com.ust.emr.controller.patient.ReportsTabController;
import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.RevisionHistoryDao;
import com.ust.emr.dao.UserDao;
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
public class ReportFormsController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private CommentsDao commentsDao;
	
	
	/**
	 * 1 - Check up sessions details 
	 * */
	@Autowired
	private FormsDao<CheckUpRecord> checkDao;
	
	@RequestMapping(value = "/visit_details.it")
	public String moreDetailsPart1(HttpSession session, Model model, @RequestParam("id") long patientId, @RequestParam("m") String m, @RequestParam("y") int year) {
		System.err.println("Check up sessions report - more details ng form 1");
		int month = 0;
		
		try {
			addCurrentLoggedInUser(session, model, patientId);
			List<CheckUpRecord> checkupForms = checkDao.getAllFormsAscending("CheckUpRecord", patientDao.getPatientById(patientId));

			if(!m.isEmpty()) {
				month = getIntofMonth(m);
			} else {
				throw new DataAccessException("Invalid format! Please try again!");
			}
			
			List<CheckUpRecord> formsThisMonth = new ArrayList<>();
			for(CheckUpRecord b : checkupForms) {
				if(b.getRevisionHistory().getDateCreated().getMonthOfYear() == month && b.getRevisionHistory().getDateCreated().getYear() == year) {
					formsThisMonth.add(b);
				}				
			}
			
			model.addAttribute("forms", formsThisMonth);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", "There are currently no available information for the specified month/year");
		}
		
		addAdditionalDetails(model, month, year, "CheckUpRecord", "");
		return "patient/reports/reports-checkup-details";
	}
	
	
	
	/**
	 * History Update Show Details Controller
	 * */
	@Autowired
	private FormsDao<HistoryUpdate> histoUpdateDao;
	@RequestMapping(value = "/uh_report.it")
	public String uhMoreDetails(HttpSession session, Model model, @RequestParam("id") long patientId, @RequestParam("m") String m, @RequestParam("y") int year) {
		System.err.println("Update History");
		int month = 0;
		
		try {
			addCurrentLoggedInUser(session, model, patientId);
			List<HistoryUpdate> forms = histoUpdateDao.getAllFormsAscending("HistoryUpdate", patientDao.getPatientById(patientId));
		
			if(!m.isEmpty()) {
				month = getIntofMonth(m);
			} else {
				throw new DataAccessException("Invalid format! Please try again!");
			}

			List<HistoryUpdate> formsThisMonth = new ArrayList<>();
			for(HistoryUpdate b : forms) {
				if(b.getRevisionHistory().getDateCreated().getMonthOfYear() == month && b.getRevisionHistory().getDateCreated().getYear() == year) {
					formsThisMonth.add(b);
				}				
			}
			
			if(formsThisMonth.size() == 0) {
				throw new DataAccessException();
			}
			model.addAttribute("forms", formsThisMonth);
		} catch (DataAccessException e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", "There are currently no available information for the specified month/year");
		}
		
		addAdditionalDetails(model, month, year, "History Update", ""); 
		return "patient/reports/reports-uh";
	}
	
	
	
	/**
	 * BASDAI REPORT
	 * */
	@Autowired
	private FormsDao<BASDAI> basdaiDao;
	
	@RequestMapping(value = "/basdai_reports.it")
	public String graphBASDAI(HttpServletRequest req, HttpSession session, Model model, @RequestParam("id") long patientId, @RequestParam("m") int month, @RequestParam("y") int year) {
		System.err.println("BASDAI report");
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "reports", "forms count details");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		try {
			addCurrentLoggedInUser(session, model, patientId);
			List<BASDAI> basdaiForms = basdaiDao.getAllFormsAscending("BASDAI", patientDao.getPatientById(patientId));
			System.err.println("basdai forms size " + basdaiForms.size());
			List<BASDAI> formsThisMonth = new ArrayList<>();
			for(BASDAI b : basdaiForms) {
				if(b.getRevisionHistory().getDateCreated().getMonthOfYear() == month && b.getRevisionHistory().getDateCreated().getYear() == year) {
					formsThisMonth.add(b);
				}				
			}
			int size = formsThisMonth.size();
			String[] dates = new String[size];
			String[] scores = new String[size];	
			
			for(int i = 0; i <size; i++) {
				dates[i] = basdaiForms.get(i).getRevisionHistory().getDateCreated().toString();
				scores[i] = basdaiForms.get(i).getScore();
			}
			System.err.println(dates.length);
			req.setAttribute("dates", dates);
			req.setAttribute("scores", scores);
			
			if(formsThisMonth.size() == 0) {
				throw new DataAccessException();
			}
			model.addAttribute("forms", formsThisMonth);
			
		} catch (DataAccessException e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", "There are currently no BASDAI forms for the specified month/year");
		}
		addAdditionalDetails(model, month, year, "BASDAI", "BASDAI");
		
		return "patient/reports/reports-forms-count-details";
	}
	
	
	/**
	 * BASG REPORT
	 * */

	@Autowired
	private FormsDao<BASG> basgDao;
	
	@RequestMapping(value = "/basg_reports.it")
	public String BASGreport(HttpServletRequest req, HttpSession session, Model model, @RequestParam("id") long patientId, @RequestParam("m") int month, @RequestParam("y") int year) {
		System.err.println("BASG report");
		
		try {
			addCurrentLoggedInUser(session, model, patientId);
			List<BASG> forms = basgDao.getAllFormsAscending("BASG", patientDao.getPatientById(patientId));

			List<BASG> formsThisMonth = new ArrayList<>();
			for(BASG b : forms) {
				if(b.getRevisionHistory().getDateCreated().getMonthOfYear() == month && b.getRevisionHistory().getDateCreated().getYear() == year) {
					formsThisMonth.add(b);
				}				
			}
			
			if(formsThisMonth.size() == 0) {
				throw new DataAccessException();
			}
			model.addAttribute("forms", formsThisMonth);
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", "There are currently no BASG forms for the specified month/year");
		}
		addAdditionalDetails(model, month, year, "BASG", "BASG");
		return "patient/reports/reports-forms-count-details";
	}
	
	
	/**
	 * BASFI REPORT
	 * */

	@Autowired
	private FormsDao<BASFI> basfiDao;
	
	@RequestMapping(value = "/basfi_reports.it")
	public String BASFIreport(HttpServletRequest req, HttpSession session, Model model, @RequestParam("id") long patientId, @RequestParam("m") int month, @RequestParam("y") int year) {
		System.err.println("BASFI report");
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "reports", "forms count details");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		try {
			addCurrentLoggedInUser(session, model, patientId);
			List<BASFI> forms = basfiDao.getAllFormsAscending("BASFI", patientDao.getPatientById(patientId));

			List<BASFI> formsThisMonth = new ArrayList<>();
			for(BASFI b : forms) {
				if(b.getRevisionHistory().getDateCreated().getMonthOfYear() == month && b.getRevisionHistory().getDateCreated().getYear() == year) {
					formsThisMonth.add(b);
				}				
			}
			
			if(formsThisMonth.size() == 0) {
				throw new DataAccessException();
			}
			model.addAttribute("forms", formsThisMonth);
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", "There are currently no BASFI forms for the specified month/year");
		}
		addAdditionalDetails(model, month, year, "BASFI", "BASFI");
		return "patient/reports/reports-forms-count-details";
	}
	
	
	
	/**
	 * DAMAGE index REPORT
	 * */

	@Autowired
	private FormsDao<DamageIndexSLE> damageDao;
	
	@RequestMapping(value = "/damage_reports.it")
	public String DamageIndexSLEreport(HttpServletRequest req, HttpSession session, Model model, @RequestParam("id") long patientId, @RequestParam("m") int month, @RequestParam("y") int year) {
		System.err.println("DamageIndexSLE report");
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "reports", "forms count details");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		try {
			addCurrentLoggedInUser(session, model, patientId);
			List<DamageIndexSLE> forms = damageDao.getAllFormsAscending("DamageIndexSLE", patientDao.getPatientById(patientId));

			List<DamageIndexSLE> formsThisMonth = new ArrayList<>();
			for(DamageIndexSLE b : forms) {
				if(b.getRevisionHistory().getDateCreated().getMonthOfYear() == month && b.getRevisionHistory().getDateCreated().getYear() == year) {
					formsThisMonth.add(b);
				}				
			}
			
			if(formsThisMonth.size() == 0) {
				throw new DataAccessException();
			}
			model.addAttribute("forms", formsThisMonth);
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", "There are currently no Damage Index SLE forms for the specified month/year");
		}
		addAdditionalDetails(model, month, year, "Damage Index SLE","DamageIndexSLE");
		return "patient/reports/reports-forms-count-details";
	}
	
	
	/**
	 * MEXSLEDAI REPORT
	 * */

	@Autowired
	private FormsDao<MEXSLEDAI> mexDao;
	
	@RequestMapping(value = "/mex_reports.it")
	public String MEXSLEDAIreport(HttpServletRequest req, HttpSession session, Model model, @RequestParam("id") long patientId, @RequestParam("m") int month, @RequestParam("y") int year) {
		System.err.println("MEXSLEDAI report");
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "reports", "forms count details");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		try {
			addCurrentLoggedInUser(session, model, patientId);
			List<MEXSLEDAI> forms = mexDao.getAllFormsAscending("MEXSLEDAI", patientDao.getPatientById(patientId));

			List<MEXSLEDAI> formsThisMonth = new ArrayList<>();
			for(MEXSLEDAI b : forms) {
				if(b.getRevisionHistory().getDateCreated().getMonthOfYear() == month && b.getRevisionHistory().getDateCreated().getYear() == year) {
					formsThisMonth.add(b);
				}				
			}
			
			if(formsThisMonth.size() == 0) {
				throw new DataAccessException();
			}
			model.addAttribute("forms", formsThisMonth);
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", "There are currently no MEX SLEDAI forms for the specified month/year");
		}
		addAdditionalDetails(model, month, year, "MEX SLEDAI", "MEXSLEDAI");
		return "patient/reports/reports-forms-count-details";
	}
	
	
	/**
	 * SLEDAIScore REPORT
	 * */

	@Autowired
	private FormsDao<SLEDAIScore> sledaiDao;
	
	@RequestMapping(value = "/sledai_reports.it")
	public String SLEDAIScorereport(HttpServletRequest req, HttpSession session, Model model, @RequestParam("id") long patientId, @RequestParam("m") int month, @RequestParam("y") int year) {
		System.err.println("SLEDAIScore report");
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "reports", "forms count details");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		try {
			addCurrentLoggedInUser(session, model, patientId);
			List<SLEDAIScore> forms = sledaiDao.getAllFormsAscending("SLEDAIScore", patientDao.getPatientById(patientId));

			List<SLEDAIScore> formsThisMonth = new ArrayList<>();
			for(SLEDAIScore b : forms) {
				if(b.getRevisionHistory().getDateCreated().getMonthOfYear() == month && b.getRevisionHistory().getDateCreated().getYear() == year) {
					formsThisMonth.add(b);
				}				
			}
			
			if(formsThisMonth.size() == 0) {
				throw new DataAccessException();
			}
			model.addAttribute("forms", formsThisMonth);
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", "There are currently no SLEDAI Score forms for the specified month/year");
		}
		addAdditionalDetails(model, month, year, "SLEDAI Score", "SLEDAIScore");
		return "patient/reports/reports-forms-count-details";
	}
	
	
	
	
	/**
	 * SEARCH BY MONTH AND YEAR
	 * */
	@RequestMapping(value = "/search_report_forms.it")
	public String searchByMonthAndYear(HttpSession session, Model model, @RequestParam("f") String formName, @RequestParam("id") long patientId, @RequestParam("m") String month, @RequestParam("y") String year) {
		System.err.println("Search reports");
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "reports", "forms count details");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		try {
			addCurrentLoggedInUser(session, model, patientId);
			System.err.println("month = " + month);
			if(year.equals("") || month.equals("")){				
				throw new DataAccessException("Please select a month and year.");
			}
			
			if(formName.equalsIgnoreCase("basdai")){
				return "redirect:/basdai_reports.it?id=" + patientId + "&m=" + month + "&y=" + year;
			} else if(formName.equalsIgnoreCase("basg")) {
				return "redirect:/basg_reports.it?id=" + patientId + "&m=" + month + "&y=" + year;
			} else if(formName.equalsIgnoreCase("basfi")) {
				return "redirect:/basfi_reports.it?id=" + patientId + "&m=" + month + "&y=" + year;
			} else if(formName.equalsIgnoreCase("DamageIndexSLE")) {
				return "redirect:/damage_reports.it?id=" + patientId + "&m=" + month + "&y=" + year;
			} else if(formName.equalsIgnoreCase("mexsledai")) {
				return "redirect:/mex_sledai_reports.it?id=" + patientId + "&m=" + month + "&y=" + year;
			} else if(formName.equalsIgnoreCase("sledaiscore")) {
				return "redirect:/sledai_score_reports.it?id=" + patientId + "&m=" + month + "&y=" + year;
			} else if(formName.equalsIgnoreCase("checkuprecord")) {
				return "redirect:/visit_details.it?id=" + patientId + "&m=" + getIntofMonth(month) + "&y=" + year;
			}
							
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", "An unexpected error has occurred. Please try again.");
		}
		
		return "";
	}

	
	
	/**
	 * ADDITIONAL METHODS 
	 * */
	
	private void addAdditionalDetails(Model model, int month, int year, String string, String entityName) {
		model.addAttribute("month", month);
		model.addAttribute("monthWord", getStringOfMonth(month));
		model.addAttribute("year", year);
		model.addAttribute("formName", string);
		model.addAttribute("entityName", entityName);
	}

	private String getStringOfMonth(int month) {
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
	
	private void addCurrentLoggedInUser(HttpSession session, Model model, long id) throws DataAccessException {
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		Doctor doctor = doctorDao.getDoctorByUsername(username);
		model.addAttribute("doctor", doctor);
		model.addAttribute("patient", patientDao.getPatientById(id));
	}
	
	private int getIntofMonth(String m) {
		switch(m) {
			case "January" : return 1;
			case "February" : return 2;
			case "March" : return 3;
			case "April" : return 4;
			case "May" : return 5;
			case "June" : return 6;
			case "July" : return 7;
			case "August" : return 8;
			case "September" : return 9;
			case "October" : return 10;
			case "November" : return 11;
			case "December" : return 12;
		}
		return 0;
	}

}
