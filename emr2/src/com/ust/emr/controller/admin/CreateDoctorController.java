package com.ust.emr.controller.admin;

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

import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.RevisionHistoryDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class CreateDoctorController {

	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private RevisionHistoryDao revisionHistoryDao;

	@Autowired
	private CommentsDao commentsDao;
	
	@RequestMapping(value = "/create_doctor_assembler.it")
	public String setUpCreateDoctorForm(Model model, HttpSession session) {
		System.out.println("SETUP CREATE DOCTOR FORM");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		User user = null;

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("admin", "doctor", "create");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		try {
			user = userDao.findUserByUsername(username);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("adminUser", user);
		model.addAttribute("doctor", new Doctor());
		return "admin/create-doctor";
	}
	
	
	@RequestMapping(value = "/create_doctor.it", method = RequestMethod.POST)
	public String createDoctorAccount(HttpServletRequest request, Model model, HttpSession session,  @ModelAttribute("doctor") Doctor doctor, @RequestParam("id") long id) {
		System.out.println("CREATE DOCTOR ACCOUNT CONTROLLER");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		// set date created and role type
		RevisionHistory history = new RevisionHistory(LocalDate.now(), userDao.findUserById(id));
		doctor.getPersonInfo().setRevisionHistory(history);
		revisionHistoryDao.saveHistory(history);
		doctor.getUser().setRole(userDao.getRoleByRoleType("Doctor"));
		doctor.getUser().setEnabled(true);
		// set contacts and address type 
		doctor.getPersonInfo().getAddresses().get(0).setType("home");
		doctor.getPersonInfo().getAddresses().get(1).setType("work");
		doctor.getPersonInfo().getContacts().get(0).setType("home");
		doctor.getPersonInfo().getContacts().get(1).setType("work");
		
		String birthday = request.getParameter("dateOfBirth");
		if(birthday != null && !birthday.isEmpty()) {
			LocalDate bday = LocalDate.parse(birthday);
			doctor.getPersonInfo().setDateOfBirth(bday);
			Years age = Years.yearsBetween(bday, LocalDate.now());
			doctor.getPersonInfo().setAge(age.getYears());
		}
		
		doctorDao.createDoctor(doctor);
		return "redirect:/view_doctor_profile.it?id=" + doctor.getId();
	}
	
	
}
