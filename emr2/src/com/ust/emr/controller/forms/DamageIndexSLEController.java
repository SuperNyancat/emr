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
import com.ust.emr.model.forms.BASFI;
import com.ust.emr.model.forms.BASG;
import com.ust.emr.model.forms.DamageIndexSLE;
import com.ust.emr.model.forms.MEXSLEDAI;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class DamageIndexSLEController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<DamageIndexSLE> damageDao;
	
	@Autowired
	private CommentsDao commentsDao;
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/damage_index_form_assembler.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("DamageIndexSLE - assemble create");
		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "damage", "create");
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
		
		model.addAttribute("form", new DamageIndexSLE());
//		model.addAttribute("date", LocalDate.now());
		return "forms/DamageIndexSLE/damage-create";
	}
	
	@RequestMapping(value = "/create_damage_index_form.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") DamageIndexSLE form, @RequestParam("id") long id) {
		System.err.println("DamageIndexSLE - create");
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

			String score = String.valueOf(processDamageIndexSLEForm(form));
			form.setScore(score);
			damageDao.createForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_damage_index.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}

	private int processDamageIndexSLEForm(DamageIndexSLE form) {
		String s = form.getOcular1() + " " + form.getOcular2() + " " +
		 form.getNeuropsychiatric1() + " " + form.getNeuropsychiatric2() + " " + form.getNeuropsychiatric3() + " " +	 form.getNeuropsychiatric4() + " " +  form.getNeuropsychiatric5() + " " +
		 form.getRenal1() + " " + form.getRenal2() + " " + form.getRenal3() + " " +
		 form.getPulmonary1() + " " + form.getPulmonary2() + " " + form.getPulmonary3() + " " + form.getPulmonary4() + " " + form.getPulmonary5() + " " +
		 form.getCardiovascular1() + " " + form.getCardiovascular2() + " " + form.getCardiovascular3() + " " + form.getCardiovascular4() + " " + form.getCardiovascular5() + " " +
		 form.getPeripheralVascular1() + " " + form.getPeripheralVascular2() + " " + form.getPeripheralVascular3() + " " + form.getPeripheralVascular4() + " " +
		 form.getGastrointestinal1() + " " + form.getGastrointestinal2() + " " + form.getGastrointestinal3() + " " + form.getGastrointestinal4() + " " +
		 form.getMusculoskeletal1() + " " + form.getMusculoskeletal2() + " " + form.getMusculoskeletal3() + " " + form.getMusculoskeletal4() + " " + form.getMusculoskeletal5() + " " +
		 form.getSkin1() + " " + form.getSkin2() + " " + form.getSkin3() + " " +
		 form.getPremature() + " " +
		 form.getDiabetes() + " " +
		 form.getMalignancy();
		
		String[] values = s.split(" ");
		int sum = 0;
		System.err.println(form.getOcular1());
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
	@RequestMapping(value = "view_damage_index.it")
	public String view(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("DamageIndexSLE - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "damage", "view");
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
			model.addAttribute("form", damageDao.getFormById("DamageIndexSLE", formId));
			
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/DamageIndexSLE/damage-view";
	}
	
	/**
	 * EDIT
	 * */
	
	
	@RequestMapping("edit_damage.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") DamageIndexSLE form) {
		System.err.println("DamageIndexSLE - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "damage", "edit");
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
			model.addAttribute("form", damageDao.getFormById("DamageIndexSLE", form.getId()));
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/DamageIndexSLE/damage-edit";
	}
	
	@RequestMapping("update_damage.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") DamageIndexSLE form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("DamageIndexSLE - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
			
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);


			String score = String.valueOf(processDamageIndexSLEForm(form));
			form.setScore(score);
			form.setId(fid);
			damageDao.updateForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_damage_index.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	
	/**
	 * DELETE 
	 * */
	@RequestMapping("/delete_damage.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") DamageIndexSLE form) {
		System.err.println("DamageIndexSLE - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		damageDao.deleteForm(form);
		
		return "redirect:/damage_index_SLE_table.it?id=" + patientId;
	}
}
