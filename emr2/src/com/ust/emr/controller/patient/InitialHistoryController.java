package com.ust.emr.controller.patient;

import java.util.ArrayList;
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

import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.RevisionHistoryDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.model.history.InitialHistory;
import com.ust.emr.model.history.Operation;
import com.ust.emr.model.history.PastMedication;
import com.ust.emr.model.history.PresentMedication;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class InitialHistoryController {
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
	private FormsDao<InitialHistory> initHistoDao;
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/ih_assemble.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("initial histo - assemble create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("patient", patientDao.getPatientById(id));
			addLoggedInUser(model, user);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		model.addAttribute("form", new InitialHistory());
		return "patient/history/initial-create";
	}
	
	

	@RequestMapping(value = "/ih_create.it", method = RequestMethod.POST)
	public String create(HttpSession session, HttpServletRequest request, Model model, @ModelAttribute("form") InitialHistory form, @RequestParam("id") long id) {
		System.err.println("initial histo - create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		Patient patient = null;
		long formId = 0;
		
		try {
			User user = userDao.findUserByUsername(username);
			patient = patientDao.getPatientById(id);
			// servlet request for all dates
			String dateOfSymptoms = request.getParameter("dateOfSymptoms");
			String mammogram = request.getParameter("mammogram");
			String chestXRay = request.getParameter("chestXRay");
			String eyeExam = request.getParameter("eyeExam");
			String tuberculosis = request.getParameter("tuberculosis");
			String boneDensitometry = request.getParameter("boneDensitometry");
			String lastPeriod = request.getParameter("lastPeriod");
			String lastPap = request.getParameter("lastPap");
			
			InitialHistory initialHistory = getUpdatedClassWithDates(form, dateOfSymptoms, mammogram,
					chestXRay, eyeExam, tuberculosis, boneDensitometry, lastPeriod, lastPap);
			
			RevisionHistory revisionHistory = new RevisionHistory(LocalDate.now(), user);
			revisionHistoryDao.saveHistory(revisionHistory);
			
			List<Operation> previousOperations = validatedOperations(initialHistory);
			List<PresentMedication> presentMeds = validatedPresentMeds(initialHistory);
			List<PastMedication> pastMeds = validatedPastMeds(initialHistory);
			
			initialHistory.setRevisionHistory(revisionHistory);
			initialHistory.getPreviousOperations().setPreviousOperations(previousOperations);
			initialHistory.getPastMedications().setPastMedications(pastMeds);
			initialHistory.getPresentMedications().setPresentMedications(presentMeds);
			initialHistory.setPatient(patient);
			initHistoDao.createForm(initialHistory);
			formId = initialHistory.getId();
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "redirect:/ih_view.it?pid=" + patient.getId() + "&fid=" + formId;
	}

	


	private InitialHistory getUpdatedClassWithDates(InitialHistory form, String dateOfSymptoms, String mammogram, String chestXRay,
			String eyeExam, String tuberculosis, String boneDensitometry,String lastPeriod, String lastPap) {
		if(dateOfSymptoms != null && !dateOfSymptoms.isEmpty()) {
			form.getGeneralInfo().setDateOfSymptoms(LocalDate.parse(dateOfSymptoms));
		}
		
		if(mammogram != null && !mammogram.isEmpty()) {
			form.getSystemsReview().setMammogram(LocalDate.parse(mammogram));
		}
		
		if(chestXRay != null && !chestXRay.isEmpty()) {
			form.getSystemsReview().setChestXRay(LocalDate.parse(chestXRay));
		}
		
		if(eyeExam != null && !eyeExam.isEmpty()) {
			form.getSystemsReview().setEyeExam(LocalDate.parse(eyeExam));
		}
		
		if(tuberculosis != null && !tuberculosis.isEmpty()) {
			form.getSystemsReview().setTuberculosis(LocalDate.parse(tuberculosis));
		}
		
		if(boneDensitometry != null && !boneDensitometry.isEmpty()) {
			form.getSystemsReview().setBoneDensitometry(LocalDate.parse(boneDensitometry));
		}
		
		if(lastPeriod != null && !lastPeriod.isEmpty()) {
			form.getSystemsReview().setLastPeriod(LocalDate.parse(lastPeriod));
		}
		
		if(lastPap != null && !lastPap.isEmpty()) {
			form.getSystemsReview().setLastPap(LocalDate.parse(lastPap));
		}
		
		return form;
	}



	/**
	 * VIEW
	 * */
	@RequestMapping(value = "/ih_view.it")
	public String view(HttpSession session, Model model, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("initial histo - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
			model.addAttribute("patient", patientDao.getPatientById(pid));
			addLoggedInUser(model, user);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		model.addAttribute("form", initHistoDao.getFormById("InitialHistory", fid));
		return "patient/history/initial-view";
	}
	
	
	/**
	 * EDIT / UPDATE
	 * */
	@RequestMapping(value = "/ih_edit.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") InitialHistory history) {
		System.err.println("initial histo - edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user =  userDao.findUserByUsername(username);
			model.addAttribute("patient", patientDao.getPatientById(history.getPatient().getId()));
			addLoggedInUser(model, user);
			model.addAttribute("form", initHistoDao.getFormById("InitialHistory", history.getId()));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		return "patient/history/initial-edit";
	}
	
	
	@RequestMapping(value = "/ih_update.it", method = RequestMethod.POST)
	public String update(HttpServletRequest request, HttpSession session, Model model, @ModelAttribute("form") InitialHistory form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("initial histo - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		try {
			User user =  userDao.findUserByUsername(username);
			
			// servlet request for all dates
			String dateOfSymptoms = request.getParameter("dateOfSymptoms");
			String mammogram = request.getParameter("mammogram");
			String chestXRay = request.getParameter("chestXRay");
			String eyeExam = request.getParameter("eyeExam");
			String tuberculosis = request.getParameter("tuberculosis");
			String boneDensitometry = request.getParameter("boneDensitometry");
			String lastPeriod = request.getParameter("lastPeriod");
			String lastPap = request.getParameter("lastPap");
			
			InitialHistory initialHistory = getUpdatedClassWithDates(form, dateOfSymptoms, mammogram,
					chestXRay, eyeExam, tuberculosis, boneDensitometry, lastPeriod, lastPap);

			RevisionHistory revisionHistory = initialHistory.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);
			
			List<Operation> previousOperations = validatedOperations(initialHistory);
			List<PresentMedication> presentMeds = validatedPresentMeds(initialHistory);
			List<PastMedication> pastMeds = validatedPastMeds(initialHistory);
			
			initialHistory.setRevisionHistory(revisionHistory);
			initialHistory.getPreviousOperations().setPreviousOperations(previousOperations);
			initialHistory.getPastMedications().setPastMedications(pastMeds);
			initialHistory.getPresentMedications().setPresentMedications(presentMeds);
			initHistoDao.updateForm(initialHistory);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "redirect:/ih_view?pid=" + pid + "&fid=" + fid;
	}
	
	
	/**
	 * PRINT
	 * */
	@RequestMapping(value = "ih_print.it")
	public String print(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("InitialHistory - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("form", initHistoDao.getFormById("InitialHistory", formId));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "patient/history/initial-print";
	}
	
	/**
	 * ADDITIONAL METHODS
	 * */
	
	
	private List<PastMedication> validatedPastMeds(InitialHistory initialHistory) {
		List<PastMedication> meds = new ArrayList<>();
		for(PastMedication m : initialHistory.getPastMedications().getPastMedications()) {
			if(!m.getLength().isEmpty() && !m.getReactions().isEmpty() && !m.getIsHelpful().isEmpty()) {
				meds.add(m);
			}
		}
		return meds;
	}

	private List<PresentMedication> validatedPresentMeds(InitialHistory initialHistory) {
		List<PresentMedication> meds = new ArrayList<>();
		for(PresentMedication m : initialHistory.getPresentMedications().getPresentMedications()) {
			if(!m.getName().isEmpty() && !m.getDose().isEmpty() && !m.getDuration().isEmpty()) {
				meds.add(m);
			}
		}
		return meds;
	}

	private List<Operation> validatedOperations(InitialHistory initialHistory) {
		List<Operation> operations = new ArrayList<>();
		for(Operation o : initialHistory.getPreviousOperations().getPreviousOperations()) {
			if(!o.getType().isEmpty() && !o.getYear().isEmpty() && !o.getReason().isEmpty()) {
				operations.add(o);
			}
		}
		
		return operations;
	}
	
	private void addLoggedInUser(Model model, User user) throws DataAccessException {
		if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
		} else if(user.getRole().getRoleType().equalsIgnoreCase("nurse")) {
			model.addAttribute("nurse", nurseDao.getNurseByUser(user));
		}
	}
}

