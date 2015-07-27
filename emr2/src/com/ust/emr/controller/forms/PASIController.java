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

import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.RevisionHistoryDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.model.forms.PASI;
import com.ust.emr.model.forms.PASIDetail;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class PASIController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<PASI> pasiDao;
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/pasi_assemble.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("pasi - assemble");		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		User user = null;
		try {
			user = userDao.findUserByUsername(username);
			model.addAttribute("patient", patientDao.getPatientById(id));
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		model.addAttribute("form", new PASI());
		return "forms/PASI/pasi-create";
	}

	@RequestMapping(value = "/pasi_create.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") PASI form, @RequestParam("id") long id) {
		System.err.println("PASI - create");
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
			processForm(form);
			pasiDao.createForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/pasi_view.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}
	

	/**
	 * VIEW 
	 * */
	@RequestMapping(value = "pasi_view.it")
	public String view(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("PASI - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("form", pasiDao.getFormById("PASI", formId));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/PASI/pasi-view";
	}


	/**
	 * EDIT
	 * */
	@RequestMapping("pasi_edit.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") PASI form) {
		System.err.println("PASI - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("form", pasiDao.getFormById("PASI", form.getId()));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/PASI/pasi-edit";
	}

	
	@RequestMapping("pasi_update.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") PASI form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("PASI - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
	
		try {
			User user = userDao.findUserByUsername(username);
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);

			processForm(form);
			form.setId(fid);
			pasiDao.updateForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/pasi_view.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	

	/**
	 * DELETE
	 * */
	@RequestMapping("/pasi_delete.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") PASI form) {
		System.err.println("PASI - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		pasiDao.deleteForm(form);
		
		return "redirect:/pasi_table.it?id=" + patientId;
	}
	
	
	/**
	 * TABLE
	 * */
	@RequestMapping("/pasi_table.it")
	public String basfiTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("PASI table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = null;
		try {
			User user = userDao.findUserByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patient);
			model.addAttribute("pasiForms", pasiDao.getAllForms("PASI", patient));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/PASI/pasi-table";
	}


	/**
	 * additional methods
	 * */
	private void processForm(PASI form) {
		PASIDetail lesionScoreSum_A = new PASIDetail();
		lesionScoreSum_A.setIdentifier("Lesion Score Sum");
		PASIDetail subtotals_C = new PASIDetail();
		subtotals_C.setIdentifier("Subtotals");
				
		// get lesion score sum A
		for(PASIDetail detail : form.getPasiDetails()) {
			if(detail.getIdentifier().contains("Erythema") || detail.getIdentifier().contains("Induration") ||
					detail.getIdentifier().contains("Scaling")) {
				lesionScoreSum_A.setHead(lesionScoreSum_A.getHead() + detail.getHead());
				lesionScoreSum_A.setLowerLimbs(lesionScoreSum_A.getLowerLimbs() + detail.getLowerLimbs());
				lesionScoreSum_A.setTrunk(lesionScoreSum_A.getTrunk() + detail.getTrunk());
				lesionScoreSum_A.setUpperLimbs(lesionScoreSum_A.getUpperLimbs() + detail.getUpperLimbs());
			}
		}
		
		// get subtotals B
		for(PASIDetail detail : form.getPasiDetails()) {
			if(detail.getIdentifier().contains("Area")) {
				subtotals_C.setHead(lesionScoreSum_A.getHead() * detail.getHead());
				subtotals_C.setUpperLimbs(lesionScoreSum_A.getUpperLimbs() * detail.getUpperLimbs());
				subtotals_C.setLowerLimbs(lesionScoreSum_A.getLowerLimbs() * detail.getLowerLimbs());
				subtotals_C.setTrunk(lesionScoreSum_A.getTrunk() * detail.getTrunk());
			}
		}
		
		// BSA totals D
		form.setTotals_head(String.valueOf(subtotals_C.getHead() * 0.1));
		form.setTotals_upperLimbs(String.valueOf(subtotals_C.getUpperLimbs() * 0.2));
		form.setTotals_trunk(String.valueOf(subtotals_C.getTrunk() * 0.3));
		form.setTotals_lowerLimbs(String.valueOf(subtotals_C.getLowerLimbs() * 0.4));
		
		// add to list
		form.getPasiDetails().add(lesionScoreSum_A);
		form.getPasiDetails().add(subtotals_C);
	}
}
