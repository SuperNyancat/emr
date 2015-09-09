package com.ust.emr.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.AdminDao;
import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Nurse;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class ViewNurseProfileController {
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	NurseDao nurseDao;
	
	@Autowired
	UserDao userDao;

	@Autowired
	private CommentsDao commentsDao;
	
	@RequestMapping(value = "/view_nurse_profile.it")
	public String viewProfile(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("VIEW NURSE PROFILE CONTROLLER");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("admin", "nurse", "view");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		 try {
			User user = userDao.findUserByUsername(username);
			Nurse nurse = nurseDao.getNurseById(id);
			nurse.getPersonInfo().ageCorrection();
			if (user.getRole().getRoleType().equalsIgnoreCase("administrator")) {
				model.addAttribute("adminUser", user);

			}
			model.addAttribute("nurse", nurse);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "admin/view-nurse-profile";
	}
}
