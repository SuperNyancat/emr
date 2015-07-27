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
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class EditDoctorController {
	
	@Autowired
	DoctorDao doctorDao;
	
	@Autowired
	UserDao userDao;

	@Autowired
	private CommentsDao commentsDao;
	
	@RequestMapping(value = "/edit_doctor.it")
	public String setUpEditDoctor(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("edit doctor setup controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("admin", "doctor", "edit");
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
			Doctor doctor = doctorDao.getDoctorById(id);
			
			if (user.getRole().getRoleType().equalsIgnoreCase("administrator")) {
				model.addAttribute("adminUser", user);
			}
			model.addAttribute("doctor", doctor);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "admin/edit-doctor";
	}
	
	@RequestMapping(value="/update_doctor.it", method=RequestMethod.POST)
	public String updateDoctor(HttpServletRequest request, HttpSession session, @ModelAttribute("doctor") Doctor doctor, Model model, @RequestParam("id") long adminId) {
		System.err.println("update doctor controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		String birthday = request.getParameter("dateOfBirth");
		System.err.println(birthday);
		if(birthday != null && !birthday.isEmpty()) {
			LocalDate bday = LocalDate.parse(birthday);
			doctor.getPersonInfo().setDateOfBirth(bday);
			Years age = Years.yearsBetween(bday, LocalDate.now());
			age.getYears();
			System.err.println(age);
//			doctor.getPersonInfo().setAge(age.getYears());
		}
		doctor.getUser().setEnabled(true);
		RevisionHistory history = doctor.getPersonInfo().getRevisionHistory();
		history.setDateModified(LocalDate.now());
		history.setModifiedBy(history.getCreatedBy());
		doctorDao.updateDoctor(doctor);
		return "redirect:/view_doctor_profile.it?id=" + doctor.getId();
	}
}
