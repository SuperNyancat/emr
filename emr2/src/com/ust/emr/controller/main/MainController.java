package com.ust.emr.controller.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Appointment;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Nurse;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;


@Controller 
public class MainController {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private CommentsDao commentsDao;
	
	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private NurseDao nurseDao;
	
	/** Assembler : assembles login page */
	@RequestMapping("/Assembler.it")
	public String loginAssembly(Model model) {
		System.out.println("Assembly Controller");

		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("login", "login", "login");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		return "login";
	}
	
	// process login details
	@RequestMapping(value="/login.it", method=RequestMethod.POST)
	public String loginProcessor(Model model, HttpServletRequest request) {
		System.err.println("LOGIN CONTROLLER");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("login", "login", "login");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		HttpSession session = request.getSession(true);
		session.setAttribute("user", username);
		String errorMsg = "";
			
		try {
			User user = null;
			user = userDao.findUserByUsername(username);
			System.out.println(user);
			if(username.equals(user.getUsername()) && password.equals(user.getPassword()) && user.getRole().getRoleType().equalsIgnoreCase("Doctor")&&user.isEnabled()){
				return doctorHomepageAssembler(model, session);
			}
			else if(username.equals(user.getUsername()) && password.equals(user.getPassword()) && user.getRole().getRoleType().equalsIgnoreCase("Administrator")&&user.isEnabled()){
				return AdminHomepageAssembler(model,session);
			} else if (username.equals(user.getUsername()) && password.equals(user.getPassword()) && user.getRole().getRoleType().equalsIgnoreCase("Nurse")&&user.isEnabled()) {
				return nurseHomepageAssembler(model,session);
			}else {
				throw new DataAccessException("null");
			}
		} catch (DataAccessException e) {
			if(e.getMessage().equals("null")) {
				errorMsg = "Invalid username or password";
			}
		}
		
		model.addAttribute("errorMessage", errorMsg);
		return "login";
		
	}
	
	@RequestMapping(value = "/nurse_homepage.it")
	private String nurseHomepageAssembler(Model model, HttpSession session) {
		System.err.println("nurse homepage assembler");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		User user = null;

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("nurse", "home", "homepage");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		try {
			user = userDao.findUserByUsername(username);
			Nurse nurse = nurseDao.getNurseByUser(user);
			model.addAttribute("nurse", nurse);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", "User cannot be found!");
		}
		return "nurse/nurse-home";
	}

	@RequestMapping(value = "/admin_homepage.it")
	private String AdminHomepageAssembler(Model model, HttpSession session) {
		System.err.println("CONTROLLER - AdminHomepageAssembler");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("admin", "home", "homepage");
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
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", "User cannot be found!");
		}
		model.addAttribute("adminUser", user);
		return "admin/admin-home";
	}

	
	@Autowired
	private FormsDao<Appointment> appointmentDao;
	
	// assemble homepage
	@RequestMapping("/doctor_homepage.it")
	private String doctorHomepageAssembler(Model model, HttpSession session) {
		System.out.println("DOCTOR HOMEPAGE ASSEMBLER CONTROLLER");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		User user;

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "home", "homepage");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		try {
			user = userDao.findUserByUsername(username);
			System.out.println("username " + username);
			
			Doctor doctor = doctorDao.getDoctorByUser(user);
			model.addAttribute("doctor", doctor);
			model.addAttribute("appointmentForms", appointmentDao.getLatestForms("Appointment", 10, doctor));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", "No appointments found!");
		}
		
		return "doctor/doctor-home";
	}
	
	@RequestMapping("/logout.it")
	private String logout(Model model, HttpSession session) {
		System.out.println("LOGOUT CONTROLLER");
		session.removeAttribute("user");
		session.invalidate();
		return loginAssembly(model);
	}

}
