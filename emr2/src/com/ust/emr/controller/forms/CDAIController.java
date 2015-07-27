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
import com.ust.emr.model.forms.CDAI;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class CDAIController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<CDAI> cdaiDao;
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/cdai_assemble.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("cdai - assemble");		
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
		
		model.addAttribute("form", new CDAI());
		return "forms/CDAI/cdai-create";
	}
	
	@RequestMapping(value = "/cdai_create.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") CDAI form, @RequestParam("id") long id) {
		System.err.println("cdai - create");
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
			cdaiDao.createForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/cdai_view.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}

	
	/**
	 * VIEW 
	 * */
	@RequestMapping(value = "cdai_view.it")
	public String view(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("CDAI - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("form", cdaiDao.getFormById("CDAI", formId));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/CDAI/cdai-view";
	}
	
	
	/**
	 * EDIT
	 * */
	@RequestMapping("cdai_edit.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") CDAI form) {
		System.err.println("CDAI - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("form", cdaiDao.getFormById("CDAI", form.getId()));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/CDAI/cdai-edit";
	}
	
	@RequestMapping("cdai_update.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") CDAI form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("CDAI - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
	
		try {
			User user = userDao.findUserByUsername(username);
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);

			processForm(form);
			form.setId(fid);
			cdaiDao.updateForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/cdai_view.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	/**
	 * DELETE
	 * */
	@RequestMapping("/cdai_delete.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") CDAI form) {
		System.err.println("CDAI - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		cdaiDao.deleteForm(form);
		
		return "redirect:/cdai_table.it?id=" + patientId;
	}
	
	
	/**
	 * TABLE
	 * */
	@RequestMapping("/cdai_table.it")
	public String basfiTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("CDAI table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = null;
		try {
			User user = userDao.findUserByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patient);
			model.addAttribute("cdaiForms", cdaiDao.getAllForms("CDAI", patient));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/CDAI/cdai-table";
	}
	
	
	/**
	 * additional fields
	 * */
	
	private void processForm(CDAI form) {
		int tenderSum = 0, swollenSum = 0;
		for(Joint j : form.getJoints()) {
			if(j.getPain()) {
				tenderSum++; //tender
			}
			if(j.getSwelling()) {
				swollenSum++;
			}
		}
		double cdaiScore = tenderSum + swollenSum + form.getPatientGlobalAssessment() + 
				form.getProviderGlobalAssessment();
		
		form.setTenderScore(tenderSum);
		form.setSwollenScore(swollenSum);
		form.setCDAIScore(cdaiScore);
		form.setCDAIScoreInterpretation(getInterpretation(cdaiScore));
	}

	private String getInterpretation(double score) {
		if(score <= 2.8) {
			return "Remission";
		} else if(score >= 2.9 && score <= 10.0) {
			return "Low Activity";
		} else if(score >= 10.1 && score <= 22.0) {
			return "Moderate Activity";
		} else {
			// 22.1 - 76	
			return "High Activity";
		}
	}
}
