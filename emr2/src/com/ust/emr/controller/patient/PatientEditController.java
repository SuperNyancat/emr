package com.ust.emr.controller.patient;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.joda.time.Years;
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
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Disease;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Nurse;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class PatientEditController {
	@Autowired
	UserDao userDao;
	
	@Autowired
	DoctorDao doctorDao;
	
	@Autowired
	PatientDao patientDao;
	
	@Autowired
	NurseDao nurseDao;
	
	@Autowired
	private AdminDao adminDao;

	@Autowired
	private CommentsDao commentsDao;
	
	@RequestMapping(value = "/edit_patient.it")
	public String setUpEditPatient(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("edit patient setup controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user = userDao.findUserByUsername(username);
			List<Disease> diseases = adminDao.getAllDiseases();
			model.addAttribute("diseases", diseases);
			if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			
			} else if (user.getRole().getRoleType().equalsIgnoreCase("nurse")) {
				List<Doctor> doctors = doctorDao.getAllEnabledDoctors();
				model.addAttribute("doctors", doctors);
				model.addAttribute("nurse", nurseDao.getNurseByUser(user));
				
			}
			Patient patient = patientDao.getPatientById(id);
			model.addAttribute("patient", patient);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "patient/edit-patient";
	}
	
	@RequestMapping(value="/update_patient.it", method=RequestMethod.POST)
	public String updatePatient(HttpServletRequest request, HttpSession session, @ModelAttribute("patient") Patient patient, Model model, @RequestParam("id") long id) {
		System.err.println("update patient controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		User loggedInUser;
		try {
			 loggedInUser= userDao.findUserByUsername(username);
			 String disease = request.getParameter("diagnosis");
			 patient.setDiagnosis(disease);
			 String birthday = request.getParameter("dateOfBirth");
				if(birthday != null && !birthday.isEmpty()) {
					LocalDate bday = LocalDate.parse(birthday);
					patient.getPersonInfo().setDateOfBirth(bday);
					Years age = Years.yearsBetween(bday, LocalDate.now());
					patient.getPersonInfo().setAge(age.getYears());
				}
			if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				Doctor doctor = doctorDao.getDoctorByUsername(username);
				model.addAttribute("doctor", doctor);
			} else if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("nurse")) {
				Nurse nurse = nurseDao.getNurseByUser(loggedInUser);
				model.addAttribute("nurse", nurse);
				
				String doc = request.getParameter("chosenDoctor");
				Doctor doctor = doctorDao.getDoctorById(Long.parseLong(doc));
				patient.setCurrentDoctor(doctor);
			}
			
			patient.setId(id);
			RevisionHistory history = patient.getPersonInfo().getRevisionHistory();
			history.setDateModified(LocalDate.now());
			history.setModifiedBy(loggedInUser);
			patientDao.update(patient);
			
//			addCurrentLoggedInUser(username, model);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/view_patient_profile.it?id=" + patient.getId();
	}

}
