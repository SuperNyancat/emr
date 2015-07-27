package com.ust.emr.controller.patient;

import java.util.ArrayList;
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
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Medication;
import com.ust.emr.model.MedicationsAndPrescriptions;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class MedicationsAndPrescriptionsTab {
	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private PatientDao patientDao;
		
	@Autowired
	private FormsDao<MedicationsAndPrescriptions> medsDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;

	@Autowired
	private CommentsDao commentsDao;
	
	/**
	 * CREATE
	 * */
	
	@RequestMapping(value = "/create_medications_and_prescriptions_assembler.it")
	public String setUpCreateMedsForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("CREATE MedicationsAndPrescriptions FORM ASSEMBLER");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);		
		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(id));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		model.addAttribute("medicationsAndPrescriptions", new MedicationsAndPrescriptions());
		return "patient/MedicationsAndPrescriptions/medications-create";
	}
	
	@RequestMapping(value = "create_medications_and_prescriptions.it", method=RequestMethod.POST)
	public String addMeds(HttpSession session, Model model, @ModelAttribute("medicationsAndPrescriptions") MedicationsAndPrescriptions meds, @RequestParam("id") long id) {
		System.err.println("create meds and pres");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = null;
		try {
			patient = patientDao.getPatientById(id);
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patient);
			
			RevisionHistory revisionHistory = new RevisionHistory(LocalDate.now(), user);
			revisionHistoryDao.saveHistory(revisionHistory);
			List<Medication> medicines = validator(meds);
			
			meds.setMedications(medicines);
			meds.setRevisionHistory(revisionHistory);
			meds.setPatient(patient);
			medsDao.createForm(meds);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "redirect:/view_pres_meds.it?pid=" + patient.getId() +"&fid=" + meds.getId();
	}

	private List<Medication> validator(MedicationsAndPrescriptions meds) {
		List<Medication> medications = new ArrayList<>();
		for(int i = 0; i < meds.getMedications().size(); i++) {
			
			if(!meds.getMedications().get(i).getBrandName().isEmpty() && !meds.getMedications().get(i).getGenericName().isEmpty()) {
				System.out.println(meds.getMedications().get(i).getBrandName());
				medications.add(meds.getMedications().get(i));
			} 
		}
		
		return medications;
	}
	
	
	
	/**
	 * VIEW DETAILS
	 * */
	@RequestMapping(value = "view_pres_meds.it")
	public String viewBASDAIDetails(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("PresMed - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("form", medsDao.getFormById("MedicationsAndPrescriptions", formId));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "patient/MedicationsAndPrescriptions/medications-view";
	}
	
	
	/**
	 * PRINT
	 * */
	@RequestMapping(value = "medpres_print.it")
	public String print(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("MedicationsAndPrescriptions - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("form", medsDao.getFormById("MedicationsAndPrescriptions", formId));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "patient/MedicationsAndPrescriptions/medications-print";
	}
	
	/**
	 * TABLE
	 * */
	@RequestMapping("/view_medications_and_prescriptions.it")
	public String presmedTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("presMed table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		Patient patient = null;
		try {
			Doctor doctor = doctorDao.getDoctorByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctor);
			model.addAttribute("patient", patient);
			model.addAttribute("medsForms", medsDao.getAllForms("MedicationsAndPrescriptions", patient));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "patient/MedicationsAndPrescriptions/medications-table";
	}
	
	
	/**
	 * EDIT / UPDATE
	 * */
	@RequestMapping("edit_pres_and_meds.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") MedicationsAndPrescriptions form) {
		System.err.println("MedicationsAndPrescriptions - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("form", medsDao.getFormById("MedicationsAndPrescriptions", form.getId()));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "patient/MedicationsAndPrescriptions/medications-edit";
	}
	
	@RequestMapping("update_pres_and_meds.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") MedicationsAndPrescriptions form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("MedicationsAndPrescriptions - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
			
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);

			List<Medication> medicines = validator(form);
			
			form.setMedications(medicines);
			form.setRevisionHistory(revisionHistory);
			form.setId(fid);
			medsDao.updateForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		
		return "redirect:/view_pres_meds.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	
	/**
	 * DELETE 
	 * */
	@Autowired
	private FormsDao<Medication> medicinesDao;
	@RequestMapping("/delete_meds.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") MedicationsAndPrescriptions form) {
		System.err.println("MedicationsAndPrescriptions - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		medsDao.deleteForm(form);
		
		return "redirect:/view_medications_and_prescriptions.it?id=" + patientId;
	}
	
	/**
	 * search
	 * */
	@RequestMapping(value = "/search_medications.it")
	public String search(HttpSession session, Model model, @RequestParam("month") String month, @RequestParam("day") String day,  @RequestParam("year") String year, @RequestParam("id") long id) {
		System.err.println("Pres Med - search");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			model.addAttribute("patient", patientDao.getPatientById(id));
			model.addAttribute("doctor", doctorDao.getDoctorByUsername(username));
			if(year.equalsIgnoreCase("year") || month.length() > 2 || day.length() > 2) {
				throw new DataAccessException("Invalid format! Please try again");
			}
			
			String date = year+"-"+month+"-"+day;
			model.addAttribute("medsForms", medsDao.getFormsByDate("MedicationsAndPrescriptions", new LocalDate(date)));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
			
		
		return "patient/MedicationsAndPrescriptions/medications-table";
	}
}
