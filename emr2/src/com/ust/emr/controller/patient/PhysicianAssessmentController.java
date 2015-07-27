package com.ust.emr.controller.patient;

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

import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.RevisionHistoryDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Joint;
import com.ust.emr.model.Patient;
import com.ust.emr.model.PatientAssessment;
import com.ust.emr.model.PhysicianAssessment;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class PhysicianAssessmentController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private NurseDao nurseDao;
	
	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<PhysicianAssessment> physicianAssessmentDao;
	@Autowired
	private FormsDao<PatientAssessment> patientAssessmentDao;
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/ped_assemble.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("physician assessment - assemble create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			Patient patient = patientDao.getPatientById(id);
			model.addAttribute("patient", patient);
			model.addAttribute("doctor", doctorDao.getDoctorByUsername(username));
			model.addAttribute("pep", patientAssessmentDao.getFormByDate("PatientAssessment", LocalDate.now(), patient));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		model.addAttribute("form", new PhysicianAssessment());
		return "patient/physicalExam/pe-physician-create";
	}

	@RequestMapping(value = "/ped_create.it", method = RequestMethod.POST)
	public String create(HttpSession session, HttpServletRequest request, Model model, @ModelAttribute("form") PhysicianAssessment form, @RequestParam("id") long id) {
		System.err.println("physician assessment - create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		Patient patient = null;
	
		try {
			User user = userDao.findUserByUsername(username);
			patient = patientDao.getPatientById(id);
			
			RevisionHistory revisionHistory = new RevisionHistory(LocalDate.now(), user);
			revisionHistoryDao.saveHistory(revisionHistory);
			form.setSwollenJoints_today(getTotalSwollenJoints(form));
			form.setPainfulJoints_today(getTotalPainfulJoints(form));
			form.setRevisionHistory(revisionHistory);
			form.setPatient(patient);
			
			PhysicianAssessment finalForm = processForm(form, patient);
			physicianAssessmentDao.createForm(finalForm);			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "redirect:/ped_view.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}

	

	private PhysicianAssessment processForm(PhysicianAssessment form, Patient patient) {
		PhysicianAssessment firstForm = physicianAssessmentDao.getFirstForm("PhysicianAssessment", patient);
		PatientAssessment paToday = patientAssessmentDao.getFormByDate("PatientAssessment", LocalDate.now(), patient);
		PatientAssessment baseline = patientAssessmentDao.getFirstForm("PatientAssessment", patient);
		form.setPGA_today(Integer.parseInt(form.getPGA()));
		if(firstForm != null && baseline != null) {
			// setting baselines
			form.setPGA_baseline(firstForm.getPGA_today());
			form.setPainfulJoints_baseline(firstForm.getPainfulJoints_today());
			form.setSwollenJoints_baseline(firstForm.getSwollenJoints_today());
			form.setESR_baseline(firstForm.getESR_today());
			
			// fm, pn, gl from patient assessment
			form.setFN_baseline(baseline.getFN());
			form.setPN_baseline(baseline.getPN());
			form.setGL_baseline(baseline.getGL());
			form.setFN_today(paToday.getFN());
			form.setGL_today(paToday.getGL());
			form.setPN_today(paToday.getPN());
			
			//setting percentages
			form.setPGA_percent(getPercentChange(form.getPGA_today(), form.getPGA_baseline()));
			form.setPainfulJoints_percent(getPercentChange(form.getPainfulJoints_today(),form.getPainfulJoints_baseline()));
			form.setSwollenJoints_percent(getPercentChange(form.getSwollenJoints_today(),form.getSwollenJoints_baseline()));
			form.setESR_percent(getPercentChange(form.getSwollenJoints_today(),form.getSwollenJoints_baseline()));
			
			form.setFN_percent(getPercentChange(Double.parseDouble(form.getFN_today()), Double.parseDouble(form.getFN_baseline())));
			form.setGL_percent(getPercentChange(Double.parseDouble(form.getGL_today()), Double.parseDouble(form.getGL_baseline())));
			form.setPN_percent(getPercentChange(Double.parseDouble(form.getPN_today()), Double.parseDouble(form.getPN_baseline())));
		
			//setting boolean achieved
			form.setPGA_improvement(form.getPGA_percent() > 20);
			form.setPainfulJoint_improvement(form.getPainfulJoints_percent() > 20);
			form.setSwollenJoint_improvement(form.getSwollenJoints_percent() > 20);
			form.setESR_improvement(form.getESR_percent() > 20);
			
			form.setFN_improvement(form.getFN_percent() > 20);
			form.setGL_improvement(form.getGL_percent() > 20);
			form.setPN_improvement(form.getPN_percent() > 20);
			
			//count improvements
			int count = 0;
			if(form.isPGA_improvement()) count++;
			if(form.isESR_improvement()) count++;
			if(form.isFN_improvement())  count++;
			if(form.isPN_improvement()) count++;
			if(form.isGL_improvement()) count++;
			if(count >= 3) {
				form.setACR20(true);
			}
		}
		
		return form;
	}

	private double getPercentChange(double today, double baseline) {
		double percent = 0;
		percent = ((today - baseline) / baseline) * 100;
		return percent;
	}

	/**
	 * VIEW
	 * */
	@RequestMapping(value = "/ped_view.it")
	public String view(HttpSession session, Model model, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("physician assessment - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
			Patient patient = patientDao.getPatientById(pid);
			PhysicianAssessment form = physicianAssessmentDao.getFormById("PhysicianAssessment", fid);
			model.addAttribute("patient", patient);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("form", form);
			model.addAttribute("pep", patientAssessmentDao.getFormByDate("PatientAssessment", form.getRevisionHistory().getDateCreated(), patient));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "patient/physicalExam/pe-physician-view";
	}
	

	
	/**
	 * EDIT / UPDATE
	 * */
	@RequestMapping(value = "/ped_edit.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") PhysicianAssessment form) {
		System.err.println("physician assessment - edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user =  userDao.findUserByUsername(username);
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("form", physicianAssessmentDao.getFormById("PhysicianAssessment", form.getId()));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		return "patient/physicalExam/pe-physician-edit";
	}
	
	
	@RequestMapping(value = "/ped_update.it", method = RequestMethod.POST)
	public String update(HttpSession session, Model model, @ModelAttribute("form") PhysicianAssessment form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("physician assessment - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user =  userDao.findUserByUsername(username);
			Patient patient = patientDao.getPatientById(pid);
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);
			form.setSwollenJoints_today(getTotalSwollenJoints(form));
			form.setPainfulJoints_today(getTotalPainfulJoints(form));
			form.setRevisionHistory(revisionHistory);
			form.setPatient(patient);
			PhysicianAssessment finalForm = processForm(form, patient);
			physicianAssessmentDao.updateForm(finalForm);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "redirect:/ped_view?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	/**
	 * DELETE
	 * */
	@RequestMapping("/ped_delete.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") PhysicianAssessment form) {
		System.err.println("physician assessment - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		physicianAssessmentDao.deleteForm(form);
		
		return "redirect:/uh_table.it?id=" + patientId;
	}
	
	/**
	 * TABLE
	 * */
	@RequestMapping("/ped_table.it")
	public String basfiTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("PhysicianAssessment table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = null;
		try {
			User user = userDao.findUserByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patient);
			model.addAttribute("pedForms", physicianAssessmentDao.getAllForms("PhysicianAssessment", patient));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "patient/physicalExam/pe-physician-table";
	}

	/**
	 * additional methods
	 * */
	private int getTotalPainfulJoints(PhysicianAssessment form) {
		int sum = 0;
		for(Joint j : form.getJoint()) {
			if(j.getPain()) {
				sum++;
			}
		}
		return sum;
	}

	private int getTotalSwollenJoints(PhysicianAssessment form) {
		int sum = 0;
		for(Joint j : form.getJoint()) {
			if(j.getSwelling()) {
				sum++;
			}
		}
		return sum;
	}
}
