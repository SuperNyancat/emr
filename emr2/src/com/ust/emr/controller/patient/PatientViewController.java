package com.ust.emr.controller.patient;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Nurse;
import com.ust.emr.model.Patient;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class PatientViewController {
	
	@Autowired
	private PatientDao patientDao;
	@Autowired
	private DoctorDao doctorDao;
	@Autowired
	private NurseDao nurseDao;
	@Autowired
	private UserDao userDao;

	@Autowired
	private CommentsDao commentsDao;
	
	@RequestMapping("/view_patient_profile.it")
	public String viewPatientProfile(HttpSession session, Model model, @RequestParam(value = "id") long id) {
		System.err.println("VIEW PATIENT PROFILE CONTROLLER");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = patientDao.getPatientById(id);	
		try {
			addCurrentLoggedInUser(username, model);
			model.addAttribute("doctors", doctorDao.getAllEnabledDoctors());
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", "No user found.");
		}
		model.addAttribute("patient", patient);
		
		return "patient/view-patient";
	}

	private void addCurrentLoggedInUser(String username, Model model) throws DataAccessException {
		User loggedInUser = userDao.findUserByUsername(username);
		if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("doctor")) {
			Doctor doctor = doctorDao.getDoctorByUsername(username);
			model.addAttribute("doctor", doctor);

			/**
			 * COMMENTS // DELETE LATER
			 * */
			try {
				Comment comment = commentsDao.getLatestCommentAdded("doctor", "patient", "view");
				model.addAttribute("comment", comment);
			} catch (DataAccessException e1) {
				model.addAttribute("comment", new Comment());
			}
			/**
			 * end comment
			 * */
		} else if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("nurse")) {
			Nurse nurse = nurseDao.getNurseByUser(loggedInUser);
			model.addAttribute("nurse", nurse);
			/**
			 * COMMENTS // DELETE LATER
			 * */
			try {
				Comment comment = commentsDao.getLatestCommentAdded("nurse", "patient", "view");
				model.addAttribute("comment", comment);
			} catch (DataAccessException e1) {
				model.addAttribute("comment", new Comment());
			}
			/**
			 * end comment
			 * */
		}
	}
}
