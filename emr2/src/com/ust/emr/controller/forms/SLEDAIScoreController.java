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
import com.ust.emr.model.forms.SLEDAIScore;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class SLEDAIScoreController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<SLEDAIScore> sledaiDao;

	@Autowired
	private CommentsDao commentsDao;
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/SLEDAI_score_form_assembler.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("SLEDAIScore - assemble create");
		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "sledai", "create");
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
		model.addAttribute("form", new SLEDAIScore());
		return "forms/SLEDAIScore/sledai-create";
	}
	
	@RequestMapping(value = "/create_sledai_score.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") SLEDAIScore form, @RequestParam("id") long id) {
		System.err.println("SLEDAIScore - create");
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

			String score = Integer.toString(processSLEDAIForm(form));
			form.setScore(score);
			sledaiDao.createForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_sledai_score.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}

	private int processSLEDAIForm(SLEDAIScore form) {
		String s = form.getSeizure() + " " + form.getPsychosis() + " " + form.getOrganicBrainSyndrome() + " " + form.getVirtualDisturbance() + " " + form.getCranialNerveDisorder() + " " + form.getLupusHeadache() + " "
				 + " " + form.getLupusHeadache() + " " + form.getCVA() + " " + form.getMyositis() + " " + form.getArthritis() + " " + form.getVasculitis()
				 + " " + form.getAlopecia() + " " + form.getNewRash() + " " + form.getProteinuria() + " " + form.getHematuria() + " " + form.getUrinaryCasts()
				 + " " + form.getMucosalUlcers() + " " + form.getPleurisy() + " " + form.getLowComplement() + " " + form.getPericarditis() + " " + form.getLeukopenia()
				 + " " + form.getThrombocytopenia() + " " + form.getFever() + " " + form.getIncreasedDNABinding();
		
		String[] values = s.split(" ");
		int sum = 0;
		
		for(String ss : values) {
			if(!ss.equals("null") && !ss.isEmpty()) {
				sum += Integer.parseInt(ss);
			}
		}
		
		return sum;
	}	
	
			
	
	
	/**
	 * VIEW DETAILS
	 * */
	@RequestMapping(value = "view_sledai_score.it")
	public String viewBASDAIDetails(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("SLEDAIScore - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "sledai", "view");
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
			model.addAttribute("form", sledaiDao.getFormById("SLEDAIScore", formId));
			
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/SLEDAIScore/sledai-view";
	}
	
	
	/**
	 * EDIT / UPDATE
	 * */
	@RequestMapping("edit_sledai.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") SLEDAIScore form) {
		System.err.println("SLEDAIScore - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "sledai", "edit");
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
			model.addAttribute("form", sledaiDao.getFormById("SLEDAIScore", form.getId()));
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/SLEDAIScore/sledai-edit";
	}
	
	@RequestMapping("update_sledai_score.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") SLEDAIScore form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("SLEDAIScore - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
			
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);


			processSLEDAIForm(form);
			form.setId(fid);
			sledaiDao.updateForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_sledai_score.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	
	/**
	 * DELETE 
	 * */
	@RequestMapping("/delete_sledai.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") SLEDAIScore form) {
		System.err.println("SLEDAIScore - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		sledaiDao.deleteForm(form);
		
		return "redirect:/SLEDAI_score_table.it?id=" + patientId;
	}

}
