package com.ust.emr.controller.patient;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.RevisionHistoryDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Patient;
import com.ust.emr.model.PatientAssessment;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class PatientAssessmentController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private NurseDao nurseDao;
	
	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<PatientAssessment> patientAssessmentDao;
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/pep_assemble.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("patient assessment - assemble create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			model.addAttribute("patient", patientDao.getPatientById(id));
			model.addAttribute("doctor", doctorDao.getDoctorByUsername(username));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		model.addAttribute("form", new PatientAssessment());
		return "patient/physicalExam/pe-patient-create";
	}

	@RequestMapping(value = "/pep_create.it", method = RequestMethod.POST)
	public String create(HttpSession session, HttpServletRequest request, Model model, @ModelAttribute("form") PatientAssessment form, @RequestParam("id") long id) {
		System.err.println("physical exam - create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		Patient patient = null;
	
		try {
			User user = userDao.findUserByUsername(username);
			patient = patientDao.getPatientById(id);
						
			form.setFN(getFNScore(form));
			//GL score
			//
			RevisionHistory revisionHistory = new RevisionHistory(LocalDate.now(), user);
			revisionHistoryDao.saveHistory(revisionHistory);
			form.setRevisionHistory(revisionHistory);
			form.setPatient(patient);
			patientAssessmentDao.createForm(form);			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "redirect:/pep_view.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}

	/**
	 * VIEW
	 * */
	@RequestMapping(value = "/pep_view.it")
	public String view(HttpSession session, Model model, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("patient assessment - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
			model.addAttribute("patient", patientDao.getPatientById(pid));
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		model.addAttribute("form", patientAssessmentDao.getFormById("PatientAssessment", fid));
		return "patient/physicalExam/pe-patient-view";
	}
	

	
	/**
	 * EDIT / UPDATE
	 * */
	@RequestMapping(value = "/pep_edit.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") PatientAssessment form) {
		System.err.println("patient assessment - edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user =  userDao.findUserByUsername(username);
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("form", patientAssessmentDao.getFormById("PatientAssessment", form.getId()));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		return "patient/physicalExam/pe-patient-edit";
	}
	
	
	@RequestMapping(value = "/pep_update.it", method = RequestMethod.POST)
	public String update(HttpSession session, Model model, @ModelAttribute("form") PatientAssessment form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("patient assessment - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user =  userDao.findUserByUsername(username);
			
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);
			
			form.setFN(getFNScore(form));
			//GL score
			//
			form.setRevisionHistory(revisionHistory);
			form.setPatient(patientDao.getPatientById(pid));
			patientAssessmentDao.updateForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "redirect:/pep_view?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	/**
	 * DELETE
	 * */
	@RequestMapping("/pep_delete.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") PatientAssessment form) {
		System.err.println("patient assessment - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		patientAssessmentDao.deleteForm(form);
		
		return "redirect:/uh_table.it?id=" + patientId;
	}
	
	/**
	 * TABLE
	 * */
	@RequestMapping("/pep_table.it")
	public String basfiTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("PatientAssessment table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = null;
		try {
			User user = userDao.findUserByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patient);
			model.addAttribute("pepForms", patientAssessmentDao.getAllForms("PatientAssessment", patient));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "patient/physicalExam/pe-patient-table";
	}
	
	/**
	 * additional methods
	 * */
	private String getFNScore(PatientAssessment form) { 
		int score = Integer.parseInt(form.getDressing()) + Integer.parseInt(form.getBed()) + Integer.parseInt(form.getLiftCup()) +
				Integer.parseInt(form.getWalkOutdoors()) + Integer.parseInt(form.getWashBody()) + Integer.parseInt(form.getBendDown()) +
				Integer.parseInt(form.getTurnFaucets()) + Integer.parseInt(form.getGetInVehicle()) + Integer.parseInt(form.getWalkTwoMiles()) +
				Integer.parseInt(form.getGames()); 
		return String.valueOf(getConvertedScore(score));
	}

	private double getConvertedScore(int score) {
		switch (score) {
			case 1:	return 0.33;
			case 2:	return 0.67;
			case 3:	return 1.0;
			case 4:	return 1.33;
			case 5:	return 1.67;
			case 6:	return 2.0;
			case 7:	return 2.33;
			case 8:	return 2.67;
			case 9:	return 3.0;
			case 10: 	return 3.33;
			case 11:	return 3.67;
			case 12:	return 4.0;
			case 13:	return 4.33;
			case 14:	return 4.67;
			case 15:	return 5.0;
			case 16:	return 5.33;
			case 17:	return 5.67;
			case 18:	return 6.0;
			case 19:	return 6.33;
			case 20:	return 6.67;
			case 21:	return 7.0;
			case 22:	return 7.33;
			case 23:	return 7.67;
			case 24:	return 8.0;
			case 25:	return 8.33;
			case 26:	return 8.67;
			case 27:	return 9.0;
			case 28:	return 9.33;
			case 29:	return 9.67;
			case 30:	return 10.0;
		}
		return 0;
	}
	
}
