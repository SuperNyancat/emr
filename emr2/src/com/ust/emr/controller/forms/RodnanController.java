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
import com.ust.emr.model.forms.PartsOfBody;
import com.ust.emr.model.forms.RodnanSkinScore;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class RodnanController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<RodnanSkinScore> rodnanDao;
	

	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/rodnan_assemble.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("RodnanSkinScore - assemble");		
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
		
		model.addAttribute("form", new RodnanSkinScore());
		return "forms/Rodnan/rodnan-create";
	}
	
	@RequestMapping(value = "/rodnan_create.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") RodnanSkinScore form, @RequestParam("id") long id) {
		System.err.println("RodnanSkinScore - create");
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
			rodnanDao.createForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/rodnan_view.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}

	
	private void processForm(RodnanSkinScore form) {
		int faceSum = 0, totalSum = 0;
		
		for(PartsOfBody parts: form.getBodyParts()) {
			if(parts.getSide().isEmpty() || parts.getBodyPart().contains("Back")) {
				faceSum += parts.getScore();
			}
			totalSum += parts.getScore();
		}
		
		form.setFaceScore(String.valueOf(faceSum));
		form.setScore(String.valueOf(totalSum));
		
	}

	/**
	 * VIEW 
	 * */
	@RequestMapping(value = "rodnan_view.it")
	public String view(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("RodnanSkinScore - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("form", rodnanDao.getFormById("RodnanSkinScore", formId));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/Rodnan/rodnan-view";
	}
	
	
	/**
	 * EDIT
	 * */
	@RequestMapping("rodnan_edit.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") RodnanSkinScore form) {
		System.err.println("RodnanSkinScore - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("form", rodnanDao.getFormById("RodnanSkinScore", form.getId()));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/Rodnan/rodnan-edit";
	}
	
	
	@RequestMapping("rodnan_update.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") RodnanSkinScore form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("RodnanSkinScore - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
	
		try {
			User user = userDao.findUserByUsername(username);
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);

			processForm(form);
			form.setId(fid);
			rodnanDao.updateForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/rodnan_view.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	
	/**
	 * DELETE
	 * */
	@RequestMapping("/rodnan_delete.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") RodnanSkinScore form) {
		System.err.println("RodnanSkinScore - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		rodnanDao.deleteForm(form);
		
		return "redirect:/rodnan_table.it?id=" + patientId;
	}
	
	
	/**
	 * TABLE
	 * */
	@RequestMapping("/rodnan_table.it")
	public String basfiTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("RodnanSkinScore table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = null;
		try {
			User user = userDao.findUserByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patient);
			model.addAttribute("rodnanForms", rodnanDao.getAllForms("RodnanSkinScore", patient));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/Rodnan/rodnan-table";
	}
	
}
