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
import com.ust.emr.model.Medication;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.model.forms.BASDAI;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class BASDAIController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<BASDAI> basdaiDao;
	
	@Autowired
	private CommentsDao commentsDao;
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/BASDAI_form_assembler.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("BASDAI - assemble create");
		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "basdai", "create");
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
		
		BASDAI BASDAI = new BASDAI();
		model.addAttribute("form", BASDAI);
		model.addAttribute("date", LocalDate.now());
		return "forms/BASDAIForm/basdai-create";
	}
	
	@RequestMapping(value = "/create_basdai_form.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") BASDAI form, @RequestParam("id") long id) {
		System.err.println("BASDAI - create");
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
			
//			form.getASMedication().setRevisionHistory(revisionHistory);
//			form.getASMedication().setPatient(patient);
			processBASDAIForm(form);
			
			basdaiDao.createForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_basdai.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}

	private void processBASDAIForm(BASDAI form) {
		int sumOneToFour;
		double sumFiveToSix, total, score;
		
		sumOneToFour = Integer.parseInt(form.getQuestion1()) + Integer.parseInt(form.getQuestion2()) + Integer.parseInt(form.getQuestion3()) + Integer.parseInt(form.getQuestion4());
		sumFiveToSix = Integer.parseInt(form.getQuestion5()) + Double.parseDouble(form.getQuestion6());
		
		System.out.println("mean " + sumFiveToSix/2);
		total = sumOneToFour + (sumFiveToSix/2);
		System.out.println("total " + total);
		score = total/5;
		System.out.println("score " + score);
		
		form.setTotal(Double.toString(total));
		form.setScore(Double.toString(score));
		
	}
	
	
	
	/**
	 * VIEW DETAILS
	 * */
	@RequestMapping(value = "view_basdai.it")
	public String viewBASDAIDetails(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("BASDAI - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "basdai", "view");
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
			model.addAttribute("form", basdaiDao.getFormById("BASDAI", formId));
			
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/BASDAIForm/basdai-view";
	}
	
	
	
	/**
	 * EDIT
	 * */
	@RequestMapping("edit_basdai.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") BASDAI form) {
		System.err.println("BASDAI - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "basdai", "edit");
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
			model.addAttribute("form", basdaiDao.getFormById("BASDAI", form.getId()));
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/BASDAIForm/basdai-edit";
	}
	
	@RequestMapping("update_basdai.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") BASDAI form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("BASDAI - create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
			
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);


			processBASDAIForm(form);
			form.setId(fid);
			basdaiDao.updateForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_basdai.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	@Autowired
	private FormsDao<Medication> medsDao;
	/**
	 * Delete Basdai
	 * */
	@RequestMapping("/delete_basdai.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") BASDAI form) {
		System.err.println("BASDAI - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		System.err.println(form.getASMedication().getId());
		medsDao.deleteForm(form.getASMedication());
		basdaiDao.deleteForm(form);
		
		return "redirect:/BASDAI_table.it?id=" + patientId;
	}
}
