package com.ust.emr.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ust.emr.dao.AdminDao;
import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Disease;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Medicine;
import com.ust.emr.model.Nurse;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class ViewTablesTabController {
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	private CommentsDao commentsDao;
	
	
	@RequestMapping(value = "/view_doctors.it")
	public String viewAllDoctors(HttpSession session, Model model) {
		System.out.println("VIEW DOCTORS TAB ASSEMBLER CONTROLLER");
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
		
		User  user = null;
		try {
			user = userDao.findUserByUsername(username);
			if(user.getRole().getId()!=1)
				return "redirect:/logout.it?";
			List<Doctor> doctors = adminDao.getAllEnabledDoctors();
			model.addAttribute("doctors", doctors);
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		model.addAttribute("adminUser", user);
		return "admin/doctors-table";
	}
	
	//Nurses
	@RequestMapping(value = "/view_nurses.it")
	public String viewAllNurses(HttpSession session, Model model) {
		System.err.println("VIEW NURSES TAB ASSEMBLER CONTROLLER");
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
		
		User user = null;
		try {
			user = userDao.findUserByUsername(username);
			if(user.getRole().getId()!=1)
				return "redirect:/logout.it?";
			List<Nurse> nurses = adminDao.getAllEnabledNurses();
			model.addAttribute("nurses", nurses);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		model.addAttribute("adminUser", user);
		return "admin/nurses-table";
	}
	
	
	//Medicines
	@RequestMapping(value = "/view_medicines.it")
	public String viewAllMedicines(HttpSession session, Model model) {
		System.out.println("VIEW medicines TAB CONTROLLER");
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
		
		
		User user = null;
		try {
			user = userDao.findUserByUsername(username);
			if(user.getRole().getId()!=1)
				return "redirect:/logout.it?";
			List<Medicine> medicines = adminDao.getAllMedicines();
			model.addAttribute("medicines", medicines);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		model.addAttribute("adminUser", user);
		return "admin/medicines-table";
	}
	
	
	//Diseases
	@RequestMapping(value = "/view_diseases.it")
	public String viewAllDiseases(HttpSession session, Model model) {
		System.out.println("VIEW medicines TAB CONTROLLER");
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
		
		
		User user = null;
		try {
			user = userDao.findUserByUsername(username);
			if(user.getRole().getId()!=1)
				return "redirect:/logout.it?";
			List<Disease> diseases = adminDao.getAllDiseases();
			model.addAttribute("diseases", diseases);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		model.addAttribute("adminUser", user);
		return "admin/diseases-table";
	}
}
