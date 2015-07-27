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
import com.ust.emr.model.forms.EUSTAR;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class EUSTARController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<EUSTAR> eustarDao;
	
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/eustar_assemble.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("eustar - assemble");		
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
		
		model.addAttribute("form", new EUSTAR());
		return "forms/EUSTAR/eustar-create";
	}
	
	@RequestMapping(value = "/eustar_create.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") EUSTAR form, @RequestParam("id") long id) {
		System.err.println("eustar - create");
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
			eustarDao.createForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/eustar_view.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}

	
	/**
	 * VIEW 
	 * */
	@RequestMapping(value = "eustar_view.it")
	public String view(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("EUSTAR - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("form", eustarDao.getFormById("EUSTAR", formId));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/EUSTAR/eustar-view";
	}
	
	
	/**
	 * EDIT
	 * */
	@RequestMapping("eustar_edit.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") EUSTAR form) {
		System.err.println("EUSTAR - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("form", eustarDao.getFormById("EUSTAR", form.getId()));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/EUSTAR/eustar-edit";
	}
	
	@RequestMapping("eustar_update.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") EUSTAR form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("EUSTAR - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
	
		try {
			User user = userDao.findUserByUsername(username);
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);

			processForm(form);
			form.setId(fid);
			eustarDao.updateForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/eustar_view.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	private void processForm(EUSTAR form) {
		String s = form.getModifiedRodnan() + " " + form.getScleredema() + " " + form.getSkin() + " " +
				form.getDigitalNecrosis() + " " + form.getVascular() + " " + form.getArthritis() + " " +
				form.getDlco() + " " + form.getHeartLung() + " " + form.getESR() + " " + form.getHypocomplementemia();
		String[] values = s.split(" ");
		double sum = 0;
		
		for(String ss : values) {
			if(!ss.equals("null") && !ss.isEmpty()) {
				sum += Double.parseDouble(ss);
			}
		}
		
		form.setScore(String.valueOf(sum));
	}

	/**
	 * DELETE
	 * */
	@RequestMapping("/eustar_delete.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") EUSTAR form) {
		System.err.println("EUSTAR - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		eustarDao.deleteForm(form);
		
		return "redirect:/eustar_table.it?id=" + patientId;
	}
	
	
	/**
	 * TABLE
	 * */
	@RequestMapping("/eustar_table.it")
	public String basfiTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("EUSTAR table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = null;
		try {
			User user = userDao.findUserByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patient);
			model.addAttribute("eustarForms", eustarDao.getAllForms("EUSTAR", patient));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/EUSTAR/eustar-table";
	}
}
