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
import com.ust.emr.model.forms.MEXSLEDAI;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class MEXSledaiController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<MEXSLEDAI> mexDao;

	@Autowired
	private CommentsDao commentsDao;
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/MEXSLEDAI_form_assembler.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("MEXSLEDAI - assemble create");
		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "mex", "create");
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
		
		model.addAttribute("form", new MEXSLEDAI());
//		model.addAttribute("date", LocalDate.now());
		return "forms/MEXSLEDAI/mex-create";
	}
	
	@RequestMapping(value = "/create_MEXSLEDAI.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") MEXSLEDAI form, @RequestParam("id") long id) {
		System.err.println("MEXSLEDAI - create");
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

			String score = Integer.toString(processMEXSLEDAIForm(form));
			form.setScore(score);
			mexDao.createForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_MEXSLEDAI.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}

	private int processMEXSLEDAIForm(MEXSLEDAI form) {
		String s = form.getNeurologicalDisorder() + " " + form.getRenal() + " " + form.getVasculitis() + " " 
				 + " " + form.getHemolysis() + " " + form.getMyositis() + " " + form.getArthritis() + " "
				 + " " + form.getSerositis() + " " + form.getCutaneous() + " " + form.getSerositis() + " " 
				 + " " + form.getLeukopenia() ;
		String[] values = s.split(" ");
		int sum = 0;
		
		for(String ss : values) {
			if(!ss.equals("null") && !ss.isEmpty()) {
				System.out.println(Integer.parseInt(ss));
				sum += Integer.parseInt(ss);
			}
		}
		return sum;
	}

	
	/**
	 * VIEW DETAILS
	 * */
	@RequestMapping(value = "view_MEXSLEDAI.it")
	public String view(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("MEXSLEDAI - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "mex", "view");
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
			model.addAttribute("form", mexDao.getFormById("MEXSLEDAI", formId));
			
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/MEXSLEDAI/mex-view";
	}
	
	
	
	/**
	 * EDIT / UPDATE
	 * */
	@RequestMapping("edit_mex.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") MEXSLEDAI form) {
		System.err.println("MEXSLEDAI - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "mex", "edit");
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
			model.addAttribute("form", mexDao.getFormById("MEXSLEDAI", form.getId()));
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/MEXSLEDAI/mex-edit";
	}
	
	@RequestMapping("update_MEXSLEDAI.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") MEXSLEDAI form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("MEXSLEDAI - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
			
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);


			processMEXSLEDAIForm(form);
			form.setId(fid);
			mexDao.updateForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_MEXSLEDAI.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	
	/**
	 * DELETE 
	 * */
	@RequestMapping("/delete_mex.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") MEXSLEDAI form) {
		System.err.println("MEXSLEDAI - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		mexDao.deleteForm(form);
		
		return "redirect:/MEXSLEDAI_table.it?id=" + patientId;
	}
	
}
