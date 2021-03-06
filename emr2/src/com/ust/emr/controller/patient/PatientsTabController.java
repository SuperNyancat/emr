package com.ust.emr.controller.patient;

import java.util.List;

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
public class PatientsTabController {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private CommentsDao commentsDao;
	
	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private NurseDao nurseDao;
	
	@RequestMapping(value = "/view_patients.it")
	public String patientsTableAssembler(HttpSession session, Model model) {
		System.out.println("VIEW PATIENTS TAB ASSEMBLER CONTROLLER");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {

			
			/**
			 * COMMENTS // DELETE LATER
			 * */
			try {
				Comment comment = commentsDao.getLatestCommentAdded("doctor", "patient", "table");
				model.addAttribute("comment", comment);
			} catch (DataAccessException e1) {
				model.addAttribute("comment", new Comment());
			}
			/**
			 * end comment
			 * */
			
			
			Doctor doctor = doctorDao.getDoctorByUsername(username);
			List<Patient> patients = doctorDao.getPatientsOfDoctor(doctor);
			
			model.addAttribute("doctor", doctor);
			model.addAttribute("patients", patients);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "patient/patient-table";
	}
	
	
	/**
	 * sa nurse
	 * */
	@RequestMapping(value="/view_all_patients.it")
	public String viewAllPatients(HttpSession session, Model model) {
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("nurse", "patient", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("patients", nurseDao.viewAllPatients());
			model.addAttribute("nurse", nurseDao.getNurseByUser(user));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "patient/patient-table";
	}
	
	
	
	
}
