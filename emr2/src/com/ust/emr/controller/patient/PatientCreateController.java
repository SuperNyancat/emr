package com.ust.emr.controller.patient;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.joda.time.LocalDate;
import org.joda.time.Years;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.AdminDao;
import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.RevisionHistoryDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Disease;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class PatientCreateController {

	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private NurseDao nurseDao;

	@Autowired
	private CommentsDao commentsDao;
	
	@Autowired
	private AdminDao adminDao;
	
	
	@RequestMapping(value = "/create_patient_assembler.it")
	public String setUpCreatepatientForm(HttpSession session, Model model) {
		System.err.println("CREATE PATIENT FORM ASSEMBLER");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		try {
			User user = userDao.findUserByUsername(username);

			List<Disease> diseases = adminDao.getAllDiseases();
			model.addAttribute("diseases", diseases);
			if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
				/**
				 * COMMENTS // DELETE LATER
				 * */
				try {
					Comment comment = commentsDao.getLatestCommentAdded("doctor", "patient", "create");
					model.addAttribute("comment", comment);
				} catch (DataAccessException e1) {
					model.addAttribute("comment", new Comment());
				}
				/**
				 * end comment
				 * */
			} else if (user.getRole().getRoleType().equalsIgnoreCase("nurse")) {
				List<Doctor> doctors = doctorDao.getAllEnabledDoctors();
				model.addAttribute("doctors", doctors);
				model.addAttribute("nurse", nurseDao.getNurseByUser(user));
				/**
				 * COMMENTS // DELETE LATER
				 * */
				try {
					Comment comment = commentsDao.getLatestCommentAdded("nurse", "patient", "create");
					model.addAttribute("comment", comment);
				} catch (DataAccessException e1) {
					model.addAttribute("comment", new Comment());
				}
				/**
				 * end comment
				 * */
			}
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("patient", new Patient());
		return "patient/create-patient";
	}
	
	private Map<String, List<Doctor>> getDoctorsMap() throws DataAccessException {
		List<Doctor> allSpecializations = doctorDao.getDoctorsOrderedBySpecialization();
		// remove duplicates
		for(int i = 0; i < allSpecializations.size()-1; i++) {
			if(allSpecializations.get(i).getSpecialization().compareTo(allSpecializations.get(i+1).getSpecialization()) == 0) {
				allSpecializations.remove(i);
			}
		}
		System.out.println("specializations size " + allSpecializations.size());
		
		Map<String, List<Doctor>> docs = new HashMap<>();
		for(Doctor d : allSpecializations) {
			docs.put(d.getSpecialization(), doctorDao.getDoctorsBySpecialization(d.getSpecialization()));
		}
		
		return docs;
	}

	

	@RequestMapping(value = "/create_patient.it", method = RequestMethod.POST)
	public String createPatient(HttpServletRequest request, HttpSession session, Model model, @ModelAttribute("patient") Patient patient) {
		System.err.println("create patient controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		User user;
		
		try {
			user = userDao.findUserByUsername(username);
			Doctor doctor = null;
			String disease = request.getParameter("diagnosis");
			patient.setDiagnosis(disease);
			if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				doctor = doctorDao.getDoctorByUser(user);	
				model.addAttribute("doctor", doctor);
			} else if (user.getRole().getRoleType().equalsIgnoreCase("nurse")) {
				String doc = request.getParameter("chosenDoctor");
				doctor = doctorDao.getDoctorById(Long.parseLong(doc));
				model.addAttribute("nurse", nurseDao.getNurseByUser(user));
			}
			RevisionHistory revisionHistory = new RevisionHistory(LocalDate.now(), user);
			revisionHistoryDao.saveHistory(revisionHistory);
			String birthday = request.getParameter("dateOfBirth");
			if(birthday != null && !birthday.isEmpty()) {
				LocalDate bday = LocalDate.parse(birthday);
				patient.getPersonInfo().setDateOfBirth(bday);
				Years age = Years.yearsBetween(bday, LocalDate.now());
				patient.getPersonInfo().setAge(age.getYears());
			}
			
			patient.setEnabled(true);
			// set contacts and address type 
			patient.getPersonInfo().getAddresses().get(0).setType("home");
			patient.getPersonInfo().getAddresses().get(1).setType("work");
			patient.getPersonInfo().getContacts().get(0).setType("home");
			patient.getPersonInfo().getContacts().get(1).setType("work");
			patient.getPersonInfo().setRevisionHistory(revisionHistory);
			patient.setCurrentDoctor(doctor);
			patientDao.createPatientOfDoctor(doctor, patient);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/view_patient_profile.it?id=" + patient.getId();
	}

//	@RequestMapping(value = "turnover_patient.it")
//	public String turnover(HttpServletRequest request, HttpSession session, Model model, @RequestParam("id") long id, @RequestParam("chosen") long doctorId) {
//		System.err.println("turnover patient controller");
//		String username = session.getAttribute("user").toString();
//		session.setAttribute("user", username);
//		
//		Patient patient = patientDao.getPatientById(id);
//		try {
//			User user = userDao.findUserByUsername(username);
//			patient.setCurrentDoctor(doctorDao.getDoctorById(doctorId));
//			patientDao.update(patient);
//			
//			model.addAttribute("patient", patient);
//			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
//		} catch (DataAccessException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return "redirect:/view_patient_profile.it?id=" + patient.getId();
//	}
	
	@RequestMapping(value = "refer_patient.it")
	public String refer(HttpServletRequest request, HttpSession session, Model model, @RequestParam("id") long id, @RequestParam("chosen") long doctorId) {
		System.err.println("refer patient controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = patientDao.getPatientById(id);
		try {
			User user = userDao.findUserByUsername(username);
			Doctor doctor = doctorDao.getDoctorByUser(user);
			
			patient.setCurrentDoctor(doctorDao.getDoctorById(doctorId));
			patient.setPreviousDoctor(doctor);
			patientDao.update(patient);
			
			model.addAttribute("patient", patient);
			model.addAttribute("doctor", doctor);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/view_patient_profile.it?id=" + patient.getId();
	}
	
}
