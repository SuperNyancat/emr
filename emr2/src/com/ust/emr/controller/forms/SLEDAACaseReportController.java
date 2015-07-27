package com.ust.emr.controller.forms;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.ust.emr.model.forms.SLEDAACaseReportForm;
import com.ust.emr.utilities.DataAccessException;

/**
 * form number 3
 * */
@Controller
public class SLEDAACaseReportController {
	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private FormsDao<SLEDAACaseReportForm> sledaaDao;
	
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
	@RequestMapping(value = "/SLEDAA_case_report_form_assembler.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("SLEDAACaseReport - assemble create");
		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "sledaa", "create");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		try {
			User user = userDao.findUserByUsername(username);
			Patient patient = patientDao.getPatientById(id);
			model.addAttribute("patient", patient);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			
			List<SLEDAACaseReportForm> forms = sledaaDao.getAllForms("SLEDAACaseReportForm", patient);
			SLEDAACaseReportForm previousDose = forms.get(0);
			model.addAttribute("previousDose", previousDose);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("form", new SLEDAACaseReportForm());
		
		return "forms/SLEDAACaseReportForm/create-form";
	}
	
	@RequestMapping(value = "/create_SLEDAA_case_report_form.it", method=RequestMethod.POST)
	public String addForm(HttpServletRequest request, HttpSession session, Model model, @ModelAttribute("form") SLEDAACaseReportForm form, @RequestParam("id") long id) {
		System.err.println("SLEDAACaseReport - create");
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
			
			String date = request.getParameter("dateSLEDiagnosis");
			form.setDateSLEDiagnosis(LocalDate.parse(date));
			
			sledaaDao.createForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_sledaa.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}
	
	
	/**
	 * VIEW
	 * */
	@RequestMapping(value = "view_sledaa.it")
	public String viewSledaaDetails(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("sledaa - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "sledaa", "view");
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
			SLEDAACaseReportForm form = sledaaDao.getFormById("SLEDAACaseReportForm", formId);
			model.addAttribute("form", form);
			if(form.getId() - 1 > 0) {
				model.addAttribute("previousDose", sledaaDao.getFormById("SLEDAACaseReportForm", form.getId()-1));
			}
			
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/SLEDAACaseReportForm/sledaa-view";
	}
	
	
	/**
	 * EDIT
	 * */
	@RequestMapping("edit_sledaa.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") SLEDAACaseReportForm form) {
		System.err.println("SLEDAACaseReportForm - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "sledaa", "edit");
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
			model.addAttribute("form", sledaaDao.getFormById("SLEDAACaseReportForm", form.getId()));
			if(form.getId() - 1 > 0) {
				model.addAttribute("previousDose", sledaaDao.getFormById("SLEDAACaseReportForm", form.getId()-1));
			}
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "forms/SLEDAACaseReportForm/sledaa-edit";
	}
	
	@RequestMapping("update_sledaa.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") SLEDAACaseReportForm form, @RequestParam("id") long pid, @RequestParam("fid") long fid) {
		System.err.println("SLEDAACaseReportForm - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
			
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);


			form.setId(fid);
			sledaaDao.updateForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_sledaa.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	

	/**
	 * DELETE 
	 * */
	@RequestMapping("/delete_sledaa.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") SLEDAACaseReportForm form) {
		System.err.println("SLEDAACaseReportForm - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		sledaaDao.deleteForm(form);
		
		return "redirect:/SLEDAA_table.it?id=" + patientId;
	}
	
}
