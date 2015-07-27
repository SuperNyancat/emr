package com.ust.emr.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.AdminDao;
import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.DoctorDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Disease;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Medicine;
import com.ust.emr.model.Nurse;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class SearchController {
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	DoctorDao doctorDao;

	@Autowired
	private CommentsDao commentsDao;
	
	
	// DOCTOR
	@RequestMapping(value = "/search_doctor.it", method=RequestMethod.POST)
	public String searchDoctor(HttpSession session, Model model, @RequestParam("name") String name, @RequestParam("specialization") String specialization) {
		System.err.println("Search doctor");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("admin", "doctor", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		try {
			if(name.length() == 0 && specialization.length() == 0) {
				throw new DataAccessException("Search fields cannot be blank. Please try again!");
			}
			
			List<Doctor> doctors = adminDao.searchDoctors(name, specialization);
			model.addAttribute("doctors", doctors);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "admin/doctors-table";
	}
	
	
	//nurses
	@RequestMapping(value = "/search_nurse.it", method=RequestMethod.POST)
	public String searchNurse(HttpSession session, Model model, @RequestParam("name") String name) {
		System.err.println("Search nurse");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("admin", "nurse", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		try {
			if(name.length() == 0) {
				throw new DataAccessException("Search field cannot be blank. Please try again!");
			}
			
			List<Nurse> nurses = adminDao.searchNurses(name);
			model.addAttribute("nurses", nurses);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "nurse/nurses-table";
	}
	
	
	// medicines
	@RequestMapping(value = "/search_medicine.it", method=RequestMethod.POST)
	public String searchMedicine(HttpSession session, Model model, @RequestParam("genericName") String genericName, @RequestParam("brandName") String brandName) {
		System.err.println("Search nurse");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("admin", "medicine", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		try {
			List<Medicine> medicines = adminDao.searchMedicine(genericName, brandName);
			model.addAttribute("medicines", medicines);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "admin/medicines-table";
	}
	
	
	//diseases
	@RequestMapping(value = "/search_disease.it", method=RequestMethod.POST)
	public String searchDisease(HttpSession session, Model model, @RequestParam("diseaseName") String name) {
		System.err.println("Search disease");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("admin", "disease", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		try {
			List<Disease> diseases = adminDao.searchDisease(name);
			model.addAttribute("diseases", diseases);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "admin/diseases-table";
	}
}
