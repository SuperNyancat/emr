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
import com.ust.emr.model.forms.InflammatoryMyopathFlowSheet;
import com.ust.emr.utilities.DataAccessException;


/**
 * FORM 4
 */
@Controller
public class FlowSheetInflammatoryMyopathController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<InflammatoryMyopathFlowSheet> myopathyDao;
	
	@Autowired
	private CommentsDao commentsDao;
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/inflammatory_myopath_form_assembler.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("InflammatoryMyopathFlowSheet - assemble create");
		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "myopathy", "create");
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
			model.addAttribute("previous", myopathyDao.getPreviousTwo("InflammatoryMyopathFlowSheet", patient));
			
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("form", new InflammatoryMyopathFlowSheet());
		model.addAttribute("date", LocalDate.now());
		
		return "forms/FlowSheetInflammatoryMyopath/myopath-create";
	}
	
	@RequestMapping(value = "/create_inflammatory_myopath_flowsheet.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") InflammatoryMyopathFlowSheet form, @RequestParam("id") long id) {
		System.err.println("InflammatoryMyopath - create");
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
			
			myopathyDao.createForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_inflammatory_myopath.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}
	
	
	
	/**
	 * view
	 * */
	@RequestMapping(value = "view_inflammatory_myopath.it")
	public String view(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("InflammatoryMyopathFlowSheet - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "myopathy", "view");
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
			model.addAttribute("form", myopathyDao.getFormById("InflammatoryMyopathFlowSheet", formId));
			
			List<InflammatoryMyopathFlowSheet> forms = myopathyDao.getPreviousTwo("InflammatoryMyopathFlowSheet", patient);
			forms.remove(0);
			System.err.println(forms.size());
			model.addAttribute("previous", forms);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/FlowSheetInflammatoryMyopath/myopath-view";
	}
	
	
	
	/**
	 * EDIT
	 * */
	@RequestMapping("edit_myopath.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") InflammatoryMyopathFlowSheet form) {
		System.err.println("InflammatoryMyopathFlowSheet - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "myopathy", "edit");
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
			model.addAttribute("form", myopathyDao.getFormById("InflammatoryMyopathFlowSheet", form.getId()));
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/FlowSheetInflammatoryMyopath/myopath-edit";
	}
	
	@RequestMapping("update_inflammatory_myopath_flowsheet.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") InflammatoryMyopathFlowSheet form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("InflammatoryMyopathFlowSheet - create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
			
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);
			
			form.setId(fid);
			myopathyDao.updateForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_inflammatory_myopath.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	
	
	/**
	 * DELETE 
	 * */
	@RequestMapping("/delete_myopath.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") InflammatoryMyopathFlowSheet form) {
		System.err.println("InflammatoryMyopathFlowSheet - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		myopathyDao.deleteForm(form);
		
		return "redirect:/inflammatory_myopath_table.it?id=" + patientId;
	}
}
