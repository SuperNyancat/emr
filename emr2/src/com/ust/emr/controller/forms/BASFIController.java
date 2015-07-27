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
import com.ust.emr.model.forms.BASG;
import com.ust.emr.utilities.DataAccessException;

/**
 * FORM 11
 * */
@Controller
public class BASFIController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private FormsDao<BASFI> basfiDao;

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
	@RequestMapping(value = "/BASFI_form_assembler.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("BASFI - assemble create");
		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "basfi", "create");
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		BASFI basfi = new BASFI();
		model.addAttribute("form", basfi);
		model.addAttribute("date", LocalDate.now());
		return "forms/BASFIForm/create-form";
	}
	
	@RequestMapping(value = "/create_BASFI_form.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") BASFI form, @RequestParam("id") long id) {
		System.err.println("BASFI - create");
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
			processBASFIForm(form);
			
			basfiDao.createForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_basfi.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}

	private void processBASFIForm(BASFI form) {
		int sum;
		double average;
		
		sum = Integer.parseInt(form.getQuestion1()) + Integer.parseInt(form.getQuestion2()) + Integer.parseInt(form.getQuestion3()) + Integer.parseInt(form.getQuestion4()) + Integer.parseInt(form.getQuestion5()) + 
				Integer.parseInt(form.getQuestion6()) + Integer.parseInt(form.getQuestion7()) + Integer.parseInt(form.getQuestion8()) + Integer.parseInt(form.getQuestion9()) + Integer.parseInt(form.getQuestion10());
		average = (double) sum/10;
		System.out.println(average);
		form.setTotal(Integer.toString(sum));
		form.setBASFIScore(Double.toString(average));
	}
	
	
	
	
	/**
	 * VIEW DETAILS
	 * */
	@RequestMapping(value = "view_basfi.it")
	public String viewBASFIDetails(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("BASFI - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "basfi", "view");
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
			model.addAttribute("form", basfiDao.getFormById("BASFI", formId));
			
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/BASFIForm/basfi-view";
	}
	
	
	
	/**
	 * EDIT
	 * */
	@RequestMapping("edit_basfi.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") BASFI form) {
		System.err.println("BASFI - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "basfi", "edit");
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
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("form", basfiDao.getFormById("BASFI", form.getId()));
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/BASFIForm/basfi-edit";
	}
	
	@RequestMapping("update_BASFI.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") BASFI form, @RequestParam("id") long pid, @RequestParam("fid") long fid) {
		System.err.println("BASFI - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
			
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);


			processBASFIForm(form);
			form.setId(fid);
			basfiDao.updateForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_basfi.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	

	/**
	 * Delete 
	 * */
	@RequestMapping("/delete_basfi.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") BASFI form) {
		System.err.println("BASFI - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		basfiDao.deleteForm(form);
		
		return "redirect:/BASFI_table.it?id=" + patientId;
	}
}
