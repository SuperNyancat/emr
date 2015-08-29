package com.ust.emr.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.print.Doc;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.AdminDao;
import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.CheckUpRecord;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Nurse;
import com.ust.emr.model.Patient;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class AdminReportsController {
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private CommentsDao commentsDao;
	
	@RequestMapping(value = "view_admin_reports.it") 
	public String viewAdminReports(HttpSession session, Model model, @RequestParam("y") String y) {
		System.err.println("admin reports controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("admin", "reports", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		List<Nurse> disabledNurses = null;
		try {
			disabledNurses = adminDao.getAllDisabledNurses();
		} catch (DataAccessException e1) {
			System.err.println(e1.getMessage());
		}
		
		List<Doctor> enabledDoctors = null;
		try {
			enabledDoctors = adminDao.getAllEnabledDoctors();
		} catch (DataAccessException e1) {
			System.err.println(e1.getMessage());
		}
		
		
		List<Nurse> enabledNurses = null;
		try {
			enabledNurses = adminDao.getAllEnabledNurses();
		} catch (DataAccessException e1) {
			System.err.println(e1.getMessage());
		}
		
		List<Doctor> disabledDoctor = null;
		try {
			disabledDoctor = adminDao.getAllDisabledDoctors();
		} catch (DataAccessException e1) {
			System.err.println(e1.getMessage());
		}
				
		try {
			User user = userDao.findUserByUsername(username);
			if(user.getRole().getId()!=1)
				return "redirect:/logout.it?";
			int year = 0;
			if(y.equals("") || y.length() == 0 || y == null) {
				year = LocalDate.now().getYear();
			} else {
				year = Integer.parseInt(y);
			}
						
			model.addAttribute("adminUser", user);
			model.addAttribute("enabledDoctors", enabledDoctors);
			model.addAttribute("disabledDoctors", disabledDoctor);
			
			model.addAttribute("enabledNurses", enabledNurses);
			model.addAttribute("disabledNurses", disabledNurses);
			
			model.addAttribute("year", year);
//			model.addAttribute("patientCount", getNumberOfPatients(year));
			model.addAttribute("patientCount", getPatientsPerYear(year));
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		
		return "admin/reports-admin";
	}
	
	private Map<Doctor, Integer> getPatientsPerYear(int year) throws DataAccessException {
		List<Doctor> doctors = adminDao.getAllEnabledDoctors();
		Map<Doctor, Integer> patientCount = new HashMap<>();
		
		for(Doctor d: doctors) {
			List<Patient> patients = new ArrayList<>();
			
			try {
				patients = doctorDao.getPatientsOfDoctor(d);
			} catch (DataAccessException e) {
				patientCount.put(d, 0);
				continue;
			}
			
			int count = 0;
			
			for (Patient p: patients) {
				LocalDate date = p.getPersonInfo().getRevisionHistory().getDateCreated();
				if (date.getYear() <= year) {
					count++;
				}
			}
			patientCount.put(d, count);
		}
		
		return patientCount;
	}

	protected Map<Doctor, Map<String, Integer>> getNumberOfPatients(int year) throws DataAccessException {
		 List<Doctor> doctors = adminDao.getAllEnabledDoctors();
		 Map<Doctor, Map<String, Integer>> patientCount = new HashMap<>();
		 Map<String, Integer> monthlyPatientCount = new LinkedHashMap<>();
		 
		 com.ust.emr.controller.patient.ReportsTabController patientReport = new com.ust.emr.controller.patient.ReportsTabController();
		 int month = 1; 
		
		 for(Doctor d: doctors) {
			 int[] count = new int[12];
			 
			 List<Patient> patients = new ArrayList<>();
			try {
				patients = doctorDao.getPatientsOfDoctor(d);
			} catch (DataAccessException e) {
				for (int i = 0; i < 12; i++) {
					monthlyPatientCount.put(patientReport.getStringOfMonth(i + 1), count[i]);
				}
				patientCount.put(d, monthlyPatientCount);
				continue;
			}
		
//			System.err.printf("dr. %s  %s \t patient size = %d\n", d.getPersonInfo().getFirstName(), d.getPersonInfo().getLastName(), patients.size() );
			 for (Patient p: patients) {
					LocalDate date = p.getPersonInfo().getRevisionHistory().getDateCreated();
					if (date.getYear() <= year) {
						while (date.getMonthOfYear() != month) {
							month++;
						}
						count[month - 1]++;
					}
				}
			 

			for (int i = 0; i < 12; i++) {
//				System.err.printf("%s - %d\n", patientReport.getStringOfMonth(i + 1), count[i]);
				monthlyPatientCount.put(patientReport.getStringOfMonth(i + 1), count[i]);
			}
			

		
			patientCount.put(d, monthlyPatientCount);
			
			 System.err.println("ANO BA LAMAN NG MAP?"); 
			 for(Doctor doc : patientCount.keySet()) { 
				 System.err.printf("KEY = %s %s\n", doc.getPersonInfo().getFirstName(), doc.getPersonInfo().getLastName());
				 monthlyPatientCount = patientCount.get(doc);
				 for(String s :monthlyPatientCount.keySet()) {
					 System.err.printf("key - %s \t value - %d\n", s, monthlyPatientCount.get(s));
				 }
				 System.err.println("---------------------");
			 }
			
//			for (String s : monthlyPatientCount.keySet()) {
//				System.err.printf("%s - %d\n", s, monthlyPatientCount.get(s));
//			}
		}
		
		 System.err.println("ANO BA LAMAN NG MAP after?"); 
		 for(Doctor d : patientCount.keySet()) { 
			 System.err.printf("KEY = %s %s\n", d.getPersonInfo().getFirstName(), d.getPersonInfo().getLastName());
			 monthlyPatientCount = patientCount.get(d);
			 for(String s :monthlyPatientCount.keySet()) {
				 System.err.printf("key - %s \t value - %d\n", s, monthlyPatientCount.get(s));
			 }
			 System.err.println("---------------------");
		 }
		 
		return patientCount;
	}
	
}
