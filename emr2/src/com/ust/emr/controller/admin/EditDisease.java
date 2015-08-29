package com.ust.emr.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.AdminDao;
import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Disease;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class EditDisease {
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	UserDao userDao;

	@Autowired
	private CommentsDao commentsDao;
	
	@RequestMapping(value = "/edit_disease.it")
	public String setUpEditDisease(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("edit disease setup controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("admin", "disease", "edit");
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
			Disease disease = adminDao.getDiseaseById(id);
			model.addAttribute("disease", disease);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("adminUser", user);
		return "admin/edit-disease";
	}
	
	@RequestMapping(value="/update_disease.it", method=RequestMethod.POST)
	public String updateMedicine(HttpSession session, @ModelAttribute("disease") Disease disease, Model model, @RequestParam("id") long id) {
		System.err.println("update disease controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		if(userDao.findUserById(id).getRole().getId()!=1)
			return "redirect:/logout.it?";
		disease.setId(id);
		adminDao.updateDisease(disease);
		return "redirect:/view_disease.it?id=" + disease.getId();
	}
}
