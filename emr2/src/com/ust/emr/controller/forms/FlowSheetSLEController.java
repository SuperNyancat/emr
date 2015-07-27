package com.ust.emr.controller.forms;

import java.util.List;

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
import com.ust.emr.model.forms.SLEFlowSheet;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class FlowSheetSLEController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<SLEFlowSheet> sleDao;

	@Autowired
	private CommentsDao commentsDao;
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/SLE_flowsheet_form_assembler.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("SLEFlowSheet - assemble create");
		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "sle flow", "create");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		User user = null;
		Patient patient = null;
		try {
			user = userDao.findUserByUsername(username);
			patient = patientDao.getPatientById(id);
			
			model.addAttribute("patient", patient);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("previous", sleDao.getPreviousTwo("SLEFlowSheet", patient));
			
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("form", new SLEFlowSheet());
		model.addAttribute("date", LocalDate.now());
		return "forms/FlowSheetSLE/sle-create";
	}
	
	@RequestMapping(value = "/create_SLE_flowsheet.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") SLEFlowSheet form, @RequestParam("id") long id) {
		System.err.println("SLEFlowSheet - create");
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
			
			sleDao.createForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/view_SLE_flowsheet.it?pid=" + patient.getId() + "&fid=" + form.getId();

	}
	
	
	
	/**
	 * view
	 * */
	@RequestMapping(value = "view_SLE_flowsheet.it")
	public String view(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("SLEFlowSheet - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "sle flow", "view");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		try {
			User user = userDao.findUserByUsername(username);
			Patient patient =  patientDao.getPatientById(patientId);
			
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patient);
			model.addAttribute("form", sleDao.getFormById("SLEFlowSheet", formId));
			
			List<SLEFlowSheet> forms = sleDao.getPreviousTwo("SLEFlowSheet", patient);
			forms.remove(0);
					System.err.println(forms.size());
			model.addAttribute("previous", forms);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/FlowSheetSLE/sle-view";
	}
	
	
	/**
	 * EDIT / UPDATE
	 * */
	@RequestMapping("edit_sle_flowsheet.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") SLEFlowSheet form) {
		System.err.println("SLEFlowSheet - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "sle flow", "edit");
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
			model.addAttribute("form", sleDao.getFormById("SLEFlowSheet", form.getId()));
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/FlowSheetSLE/sle-edit";
	}
	
	@RequestMapping("update_sle_flowsheet.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") SLEFlowSheet form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("SLEFlowSheet - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
			
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);

			form.setId(fid);
			sleDao.updateForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_SLE_flowsheet.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	
	/**
	 * DELETE 
	 * */
	@RequestMapping("/delete_sle.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") SLEFlowSheet form) {
		System.err.println("SLEFlowSheet - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		sleDao.deleteForm(form);
		
		return "redirect:/SLE_flowsheet_table.it?id=" + patientId;
	}
}
