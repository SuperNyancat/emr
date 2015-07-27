package com.ust.emr.controller.patient;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Patient;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class PatientSearchController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private CommentsDao commentsDao;
	
	@RequestMapping("/search_patient.it")
	public String searchPatient(HttpSession session, Model model, @RequestParam("name") String name) {
		System.err.println("Search patient");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

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
		try {
			List<Patient> patients = patientDao.searchPatients(name);
			model.addAttribute("patients", patients);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "patient/patient-table";
	}
}
