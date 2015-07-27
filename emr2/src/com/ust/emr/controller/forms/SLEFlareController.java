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
import com.ust.emr.model.forms.BASG;
import com.ust.emr.model.forms.SLEFlare;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class SLEFlareController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<SLEFlare> flareDao;

	@Autowired
	private CommentsDao commentsDao;
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/sle_flare_form_assembler.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("SLEFlare - assemble create");
		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user = null;
		try {
			user = userDao.findUserByUsername(username);
			
			model.addAttribute("patient", patientDao.getPatientById(id));
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("form", new SLEFlare());
		return "forms/SLEFlare/flare-create";
	}
	
	@RequestMapping(value = "/create_sle_flare_form.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") SLEFlare form, @RequestParam("id") long id) {
		System.err.println("SLEFlare - create");
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

			flareDao.createForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_sle_flare_form.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}
	
	
	
	
	/**
	 * VIEW DETAILS
	 * */
	@RequestMapping(value = "view_sle_flare_form.it")
	public String viewSLEFlareDetails(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("SLEFlare - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("form", flareDao.getFormById("SLEFlare", formId));
			
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/SLEFlare/flare-view";
	}
	
	
	
	/**
	 * EDIT
	 * */
	@RequestMapping("edit_sle_flare.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") SLEFlare form) {
		System.err.println("SLEFlare - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("form", flareDao.getFormById("SLEFlare", form.getId()));
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/SLEFlare/flare-edit";
	}
	
	@RequestMapping("update_sle_flare.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") SLEFlare form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("SLEFlare - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
			
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);
			
			form.setId(fid);
			flareDao.updateForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_sle_flare_form.it?pid=" + form.getPatient().getId() + "&fid=" + fid;
	}
	
	/**
	 * DELETE 
	 * */
	@RequestMapping("/delete_flare.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") SLEFlare form) {
		System.err.println("SLEFlare - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		flareDao.deleteForm(form);
		
		return "redirect:/SLE_flare_table.it?id=" + patientId;
	}
}
