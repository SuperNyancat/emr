package com.ust.emr.controller.forms;

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
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.RevisionHistoryDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.model.forms.BASMI;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class BASMIController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<BASMI> basmiDao;
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/basmi_assemble.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("basmi - assemble");		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		User user = null;
		try {
			user = userDao.findUserByUsername(username);
			model.addAttribute("patient", patientDao.getPatientById(id));
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		model.addAttribute("form", new BASMI());
		return "forms/BASMI/basmi-create";
	}
	
	
	@RequestMapping(value = "/basmi_create.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") BASMI form, @RequestParam("id") long id) {
		System.err.println("BASMI - create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = patientDao.getPatientById(id);
		User user;
		try {
			user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			
			RevisionHistory revisionHistory = new RevisionHistory(LocalDate.now(), user);
			revisionHistoryDao.saveHistory(revisionHistory);
			
			form.setRevisionHistory(revisionHistory);
			form.setPatient(patient);
			processForm(form);
			basmiDao.createForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/basmi_view.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}
	
	

	/**
	 * VIEW 
	 * */
	@RequestMapping(value = "basmi_view.it")
	public String view(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("BASMI - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("form", basmiDao.getFormById("BASMI", formId));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/BASMI/basmi-view";
	}


	/**
	 * EDIT
	 * */
	@RequestMapping("basmi_edit.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") BASMI form) {
		System.err.println("BASMI - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("form", basmiDao.getFormById("BASMI", form.getId()));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/BASMI/basmi-edit";
	}

	@RequestMapping("basmi_update.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") BASMI form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("BASMI - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
	
		try {
			User user = userDao.findUserByUsername(username);
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);

			processForm(form);
			form.setId(fid);
			basmiDao.updateForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/basmi_view.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	

	/**
	 * DELETE
	 * */
	@RequestMapping("/basmi_delete.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") BASMI form) {
		System.err.println("BASMI - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		basmiDao.deleteForm(form);
		
		return "redirect:/basmi_table.it?id=" + patientId;
	}
	
	
	/**
	 * TABLE
	 * */
	@RequestMapping("/basmi_table.it")
	public String basfiTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("BASMI table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = null;
		try {
			User user = userDao.findUserByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patient);
			model.addAttribute("basmiForms", basmiDao.getAllForms("BASMI", patient));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/BASMI/basmi-table";
	}

	/**
	 * additional methods
	 * */	
	private void processForm(BASMI form) {
		int sum = Integer.parseInt(form.getQ1()) + Integer.parseInt(form.getQ2()) + 
				Integer.parseInt(form.getQ3()) + Integer.parseInt(form.getQ4()) + Integer.parseInt(form.getQ5());
		double average = sum / 5;
		form.setScore(String.valueOf(average));
	}

}
