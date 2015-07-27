package com.ust.emr.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.AdminDao;
import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Disease;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class ViewDiseaseController {
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	UserDao userDao;

	@Autowired
	private CommentsDao commentsDao;
	
	@RequestMapping(value = "/view_disease.it")
	public String viewProfile(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("VIEW disease CONTROLLER");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		User user = null;
		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("admin", "disease", "view");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		 try {
			user = userDao.findUserByUsername(username);
			Disease disease = adminDao.getDiseaseById(id);
			model.addAttribute("disease", disease);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 model.addAttribute("adminUser", user);
		return "admin/view-disease-info";
	}
}
