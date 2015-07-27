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

import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.RevisionHistoryDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.model.forms.BASFI;
import com.ust.emr.model.forms.LaboratoryRequest;
import com.ust.emr.utilities.DataAccessException;

/**
 * FORM 5
 * */
@Controller
public class LabRequestController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private FormsDao<LaboratoryRequest> labDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private CommentsDao commentsDao;
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/laboratory_request_assembler.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("LaboratoryRequest - assemble create");
		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "lab", "create");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		User user = null;
		try {			
			user = userDao.findUserByUsername(username);
			
			model.addAttribute("patient", patientDao.getPatientById(id));
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			
			
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		model.addAttribute("form", new LaboratoryRequest());
		return "forms/LabRequest/lab-create";
	}
	
	@RequestMapping(value = "/create_lab_request.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") LaboratoryRequest form, @RequestParam("id") long id) {
		System.err.println("LaboratoryRequest - create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		User user;
		Patient patient = patientDao.getPatientById(id);
		
		try {
			user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			
			RevisionHistory revisionHistory = new RevisionHistory(LocalDate.now(), user);
			revisionHistoryDao.saveHistory(revisionHistory);
			
			form.setRevisionHistory(revisionHistory);
			form.setPatient(patient);
			
			labDao.createForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
//		return "doctor/temp";
		return "redirect:/view_lab_request.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}
	
	
	
	
	/**
	 * VIEW DETAILS
	 * */
	@RequestMapping(value = "view_lab_request.it")
	public String viewBASFIDetails(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("LaboratoryRequest - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "lab", "view");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("form", labDao.getFormById("LaboratoryRequest", formId));
			System.err.println(labDao.getFormById("LaboratoryRequest", formId).getHematology()!= null);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "forms/LabRequest/lab-view";
	}
	
	
	/**
	 * PRINT
	 * */
	@RequestMapping(value = "print.it")
	public String print(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("LaboratoryRequest - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("form", labDao.getFormById("LaboratoryRequest", formId));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "forms/LabRequest/lab-print";
	}
		

	/**
	 * EDIT / UPDATE
	 * */
	@RequestMapping("edit_lab_request.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") LaboratoryRequest form) {
		System.err.println("LaboratoryRequest - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("form", labDao.getFormById("LaboratoryRequest", form.getId()));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "forms/LabRequest/lab-edit";
	}
	
	@RequestMapping("update_lab.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") LaboratoryRequest form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("LaboratoryRequest - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
	
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
			
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);

			form.setId(fid);
			labDao.updateForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		
		return "redirect:/view_lab_request.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	
	/**
	 * DELETE 
	 * */
	@RequestMapping("/delete_lab.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") LaboratoryRequest form) {		
		System.err.println("LaboratoryRequest - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		labDao.deleteForm(form);
		
		return "redirect:/lab_request_table.it?id=" + patientId;
	}

}
