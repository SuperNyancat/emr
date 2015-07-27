package com.ust.emr.controller.patient;

import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Patient;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;


/**
 * ENABLE OR DISABLE PATIENTS
 * */

@Controller
public class PatientAccountController {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private DoctorDao doctorDao;
	
	
	@RequestMapping(value = "disable_patient.it")
	public String disablePatient(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("disable patient controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user = userDao.findUserByUsername(username);
			Doctor doctor = doctorDao.getDoctorByUser(user);
			model.addAttribute("doctor", doctor);
			
			Patient patient = patientDao.getPatientById(id);
			patient.setEnabled(false);
			patient.getPersonInfo().getRevisionHistory().setDeletedBy(user);
			patient.getPersonInfo().getRevisionHistory().setDateDeleted(LocalDate.now());
			patientDao.update(patient);
			
			session.setAttribute("successMessage", "Successfully disabled " + patient.getPersonInfo().getFirstName() + " " +
					patient.getPersonInfo().getLastName() + "\'s account.");
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/view_doctor_reports.it?y=" + LocalDate.now().getYear();
	}
	
	
	@RequestMapping("enable_patient.it")
	public String enablePatient(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("enable patient controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user = userDao.findUserByUsername(username);
			Doctor doctor = doctorDao.getDoctorByUser(user);
			model.addAttribute("doctor", doctor);
			
			Patient patient = patientDao.getPatientById(id);
			patient.setEnabled(true);
			patient.getPersonInfo().getRevisionHistory().setModifiedBy(user);
			patient.getPersonInfo().getRevisionHistory().setDateModified(LocalDate.now());
			patientDao.update(patient);
			
			session.setAttribute("successMessage", "Successfully enabled " + patient.getPersonInfo().getFirstName() + " " +
					patient.getPersonInfo().getLastName() + "\'s account.");
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/view_doctor_reports.it?y=" + LocalDate.now().getYear();
	}
	
}
