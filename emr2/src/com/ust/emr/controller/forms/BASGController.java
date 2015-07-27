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
import com.ust.emr.model.forms.BASDAI;
import com.ust.emr.model.forms.BASG;
import com.ust.emr.utilities.DataAccessException;

/**
 * FORM 6
 * */
@Controller
public class BASGController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private FormsDao<BASG> basgDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private FormsDao<BASG> formsDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private CommentsDao commentsDao;
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/BASG_form_assembler.it")
	public String setupCreateBASG(HttpSession session, Model model, @RequestParam("id") long patientId) {
		System.err.println("create basg setup controller");
		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "basg", "create");
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
			
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("form", new BASG());
		model.addAttribute("date", LocalDate.now());
	
		return "forms/BASGForm/create-basg";
	}
	
	@RequestMapping(value = "/create_basg_form.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") BASG form, @RequestParam("id") long patientId) {
		System.err.println("BASG - create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		Patient patient = patientDao.getPatientById(patientId);
		
		try {
			user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			
			RevisionHistory revisionHistory = new RevisionHistory(LocalDate.now(), user);
			revisionHistoryDao.saveHistory(revisionHistory);
			
			form.setRevisionHistory(revisionHistory);
			form.setPatient(patient);
			processBASGForm(form);
			
			formsDao.createForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_basg.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}
	
	

	
	/**
	 * VIEW DETAILS
	 * */
	@RequestMapping(value = "view_basg.it")
	public String viewBASGDetails(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("BASG - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "basg", "view");
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
			model.addAttribute("form", basgDao.getFormById("BASG", formId));
			
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/BASGForm/view-basg";
	}
	
	
	/**
	 * OTHERS
	 * */
	
	
	private void processBASGForm(BASG form) {
		int sum;
		double average;
		
		sum = Integer.parseInt(form.getQuestion1()) + Integer.parseInt(form.getQuestion2());
		average = (double) sum/2;
		System.out.println(average);
		form.setTotal(Integer.toString(sum));
		form.setScore(Double.toString(average));
	}
	
	
	/**
	 * EDIT / UPDATE
	 * */
	@RequestMapping("edit_basg.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") BASG form) {
		System.err.println("BASG - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "basg", "edit");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		try {
			System.err.println(form);
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("form", basgDao.getFormById("BASG", form.getId()));
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/BASGForm/basg-edit";
	}
	
	@RequestMapping("update_BASG.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") BASG form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("BASG - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
			
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);


			processBASGForm(form);
			form.setId(fid);
			basgDao.updateForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_basg.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	
	/**
	 * DELETE 
	 * */
	@RequestMapping("/delete_basg.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") BASG form) {
		System.err.println("BASG - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		basgDao.deleteForm(form);
		
		return "redirect:/BASG_table.it?id=" + patientId;
	}
}
