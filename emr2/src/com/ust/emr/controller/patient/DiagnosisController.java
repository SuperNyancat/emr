package com.ust.emr.controller.patient;

import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.RevisionHistoryDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Diagnosis;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class DiagnosisController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<Diagnosis> diagnosisDao;

	/**
	 * VIEW 
	 * */
	@RequestMapping(value = "/diagnosis_view.it")
	public String view(HttpSession session, Model model, @RequestParam("id") long patientId) {
		System.err.println("Diagnosis - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user = userDao.findUserByUsername(username);
			Patient patient = patientDao.getPatientById(patientId);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patient);
			
			Diagnosis diagnosis = diagnosisDao.getFormByPatient("Diagnosis", patient);
			if(diagnosis == null) {
				diagnosis = new Diagnosis();
				diagnosis.setPatient(patient);
				RevisionHistory revisionHistory = new RevisionHistory(LocalDate.now(), user);
				revisionHistoryDao.saveHistory(revisionHistory);
				diagnosis.setRevisionHistory(revisionHistory);
				diagnosisDao.createForm(diagnosis);
			}
			model.addAttribute("form", diagnosis);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "patient/Diagnosis/diagnosis-view";
	}
	
	
	/**
	 * EDIT
	 * */
	@RequestMapping("/diagnosis_edit.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") Diagnosis form) {
		System.err.println("Diagnosis - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("form", diagnosisDao.getFormById("Diagnosis", form.getId()));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "patient/Diagnosis/diagnosis-edit";
	}
	
	
	@RequestMapping("/diagnosis_update.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") Diagnosis form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("Diagnosis - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
	
		try {
			User user = userDao.findUserByUsername(username);
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);
			form.setRevisionHistory(revisionHistory);
			form.setId(fid);
			diagnosisDao.updateForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/diagnosis_view.it?id=" + form.getPatient().getId();
	}
	

}
