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
public class PagePatient {
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
	
	@RequestMapping(value = "/page_patient.it")
	public String patientsTableAssembler(HttpSession session, Model model,@RequestParam("id") String page) {
		System.out.println("PAGINATE ASSEMBLER CONTROLLER");
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
			List<Patient> patients = doctorDao.getPatientsOfDoctorThatStartsWith(doctor,page);
			model.addAttribute("doctor", doctor);
			model.addAttribute("patients", patients);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "patient/patient-table";
	}
//	@RequestMapping(value = "/page_patients.it")
//	public String patientsTableAssemblerNurse(HttpSession session, Model model,@RequestParam("id") String page) {
//		System.out.println("PAGINATE ASSEMBLER CONTROLLER");
//		String username = session.getAttribute("user").toString();
//		session.setAttribute("user", username);
//
//		try {
//			/**
//			 * COMMENTS // DELETE LATER
//			 * */
//			try {
//				Comment comment = commentsDao.getLatestCommentAdded("doctor", "patient", "table");
//				model.addAttribute("comment", comment);
//			} catch (DataAccessException e1) {
//				model.addAttribute("comment", new Comment());
//			}
//			/**
//			 * end comment
//			 * */
//			Nurse doctor = nurseDao.getNurseByUsername(username);
//			List<Patient> patients = nurseDao.getPatientsOfDoctorThatStartsWith(doctor,page);
//			model.addAttribute("doctor", doctor);
//			model.addAttribute("patients", patients);
//		} catch (DataAccessException e) {
//			model.addAttribute("errorMessage", e.getMessage());
//		}
//		return "patient/patient-table";
//	}
}