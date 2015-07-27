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
import com.ust.emr.model.forms.SDAI;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class SDAIController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<SDAI> sdaiDao;
	
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/sdai_assemble.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("SDAI - assemble");		
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
		
		model.addAttribute("form", new SDAI());
		return "forms/SDAI/sdai-create";
	}
	
	@RequestMapping(value = "/sdai_create.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") SDAI form, @RequestParam("id") long id) {
		System.err.println("SDAI - create");
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
			sdaiDao.createForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/sdai_view.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}

	
	/**
	 * VIEW 
	 * */
	@RequestMapping(value = "sdai_view.it")
	public String view(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("SDAI - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("form", sdaiDao.getFormById("SDAI", formId));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/SDAI/sdai-view";
	}
	
	
	/**
	 * EDIT
	 * */
	@RequestMapping("sdai_edit.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") SDAI form) {
		System.err.println("SDAI - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("form", sdaiDao.getFormById("SDAI", form.getId()));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/SDAI/sdai-edit";
	}
	
	
	@RequestMapping("sdai_update.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") SDAI form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("SDAI - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
	
		try {
			User user = userDao.findUserByUsername(username);
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);

			processForm(form);
			form.setId(fid);
			sdaiDao.updateForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/sdai_view.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	
	/**
	 * DELETE
	 * */
	@RequestMapping("/sdai_delete.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") SDAI form) {
		System.err.println("SDAI - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		sdaiDao.deleteForm(form);
		
		return "redirect:/sdai_table.it?id=" + patientId;
	}
	
	
	/**
	 * TABLE
	 * */
	@RequestMapping("/sdai_table.it")
	public String basfiTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("SDAI table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = null;
		try {
			User user = userDao.findUserByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patient);
			model.addAttribute("sdaiForms", sdaiDao.getAllForms("SDAI", patient));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/SDAI/sdai-table";
	}
	
	
	/**
	 * additional fields
	 * */
	
	private void processForm(SDAI form) {
		
		int tenderSum = 0, swollenSum = 0;
		for(Joint j : form.getJoints()) {
			if(j.getPain()) {
				tenderSum++;
			}
			
			if(j.getSwelling()) {
				swollenSum++;
			}
		}
		
		
		double sdaiScore = tenderSum + swollenSum + form.getPatientGlobalAssessment() + 
				form.getProviderGlobalAssessment() + form.getcReactiveProtein();
		
		form.setTenderScore(tenderSum);
		form.setSwollenScore(swollenSum);
		form.setSDAIScore(sdaiScore);
		form.setSDAIScoreInterpretation(getInterpretation(sdaiScore));
	}

	private String getInterpretation(double score) {
		if(score <= 3.3) {
			return "Remission";
		} else if(score >= 3.4 && score <= 11.0) {
			return "Low Activity";
		} else if(score >= 11.1 && score <= 26.0) {
			return "Moderate Activity";
		} else {
			// 26.1 - 80
			return "High Activity";
		}
	}
}
