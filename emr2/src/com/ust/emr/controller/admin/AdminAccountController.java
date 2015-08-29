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
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class AdminAccountController {
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private UserDao userDao;
	
	
	/**
	 * VIEW
	 * */
	
	@RequestMapping(value = "/admin_view.it")
	public String viewProfile(HttpSession session, Model model) {
		System.err.println("View Admin");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		 try {
			User user = userDao.findUserByUsername(username);
			if(user.getRole().getId()!=1)
				return "redirect:/logout.it?";
			model.addAttribute("adminUser", user);		
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "admin/admin-view";
	}
	
	/**
	 * EDIT
	 * */
	@RequestMapping(value = "/admin_edit.it")
	public String setUpEdit(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("Edit admin");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		User user = null;
		try {
			user = userDao.findUserByUsername(username);
			if(user.getRole().getId()!=1)
				return "redirect:/logout.it?";
			model.addAttribute("adminUser", user);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "admin/admin-edit";
	}
	
	@RequestMapping(value="/admin_update.it", method=RequestMethod.POST)
	public String updateDoctor(HttpSession session, @ModelAttribute("adminUser") User admin, Model model) {
		System.err.println("update admin");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		userDao.updateUser(admin);
		return "redirect:/admin_view.it";
	}
}
