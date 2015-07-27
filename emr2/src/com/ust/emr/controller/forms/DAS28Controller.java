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
import com.ust.emr.model.Joint;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.model.forms.DAS28;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class DAS28Controller {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<DAS28> dasDao;
	
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/das_assemble.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("das - assemble");		
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
		
		model.addAttribute("form", new DAS28());
		return "forms/DAS/das-create";
	}
	
	@RequestMapping(value = "/das_create.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") DAS28 form, @RequestParam("id") long id) {
		System.err.println("das - create");
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
			dasDao.createForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/das_view.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}

	
	private void processForm(DAS28 form) {
		double das28 = 0, esr_crp = Double.parseDouble(form.getEsr()), vas = Double.parseDouble(form.getVas());
		double tjc28 = 0, sjc28 = 0;
		
		for(Joint j : form.getJoints()) {
			if(j.getPain()) {
				tjc28++; //tender
			}
			if(j.getSwelling()) {
				sjc28++;
			}
		}
        
        das28 = ((0.56)*(Math.sqrt(tjc28)))+((0.28)*(Math.sqrt(sjc28)))+((0.70)*(Math.log(esr_crp)))+((0.014)*(vas));
		form.setTjc28(String.valueOf(tjc28));
		form.setSjc28(String.valueOf(sjc28));
        form.setDas28(String.valueOf(das28));
        form.setInterpretation(getInterpretation(das28));
	}

	private String getInterpretation(double das) {
		if(das <= 2.6) {
			return "Remission";
		} else if (das > 2.6 && das <= 3.2) {
			return "Low Disease Activity";
		} else if (das > 3.2 && das <= 5.1) {
			return "Moderate Disease Activity";
		} else {
			return "High Disease Activity";
		}
	}

	
	
	/**
	 * VIEW 
	 * */
	@RequestMapping(value = "das_view.it")
	public String view(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("DAS28 - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("form", dasDao.getFormById("DAS28", formId));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/DAS/das-view";
	}
	
	
	/**
	 * EDIT
	 * */
	@RequestMapping("das_edit.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") DAS28 form) {
		System.err.println("DAS28 - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("form", dasDao.getFormById("DAS28", form.getId()));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/DAS/das-edit";
	}
	
	@RequestMapping("das_update.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") DAS28 form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("DAS28 - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
	
		try {
			User user = userDao.findUserByUsername(username);
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);

			processForm(form);
			form.setId(fid);
			dasDao.updateForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/das_view.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	/**
	 * DELETE
	 * */
	@RequestMapping("/das_delete.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") DAS28 form) {
		System.err.println("DAS28 - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		dasDao.deleteForm(form);
		
		return "redirect:/das_table.it?id=" + patientId;
	}
	
	
	/**
	 * TABLE
	 * */
	@RequestMapping("/das_table.it")
	public String basfiTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("DAS28 table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = null;
		try {
			User user = userDao.findUserByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patient);
			model.addAttribute("dasForms", dasDao.getAllForms("DAS28", patient));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/DAS/das-table";
	}
}
