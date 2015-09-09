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
public class AddDiseaseController {
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private UserDao userDao;

	@Autowired
	private CommentsDao commentsDao;
	
	@RequestMapping(value = "/add_disease_assembler.it")
	public String setUpAddDisease(HttpSession session, Model model) {
		System.err.println("setup add disease");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		User user = null;
		
		try {
			user = userDao.findUserByUsername(username);
			if(user.getRole().getId()!=1)
				return "redirect:/logout.it?";
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//TODO add admin as logged in user
		
		model.addAttribute("adminUser", user);
		model.addAttribute("disease", new Disease());
		return "admin/add-disease";
	}
	
	@RequestMapping(value = "/add_disease.it", method = RequestMethod.POST)
	public String addDisease(Model model, HttpSession session,  @ModelAttribute("disease") Disease disease, @RequestParam("id") long id) {
		System.err.println("add disease CONTROLLER");
		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		User user = null;
		try {
			user = userDao.findUserByUsername(username);
			if(user.getRole().getId()!=1)
				return "redirect:/logout.it?";
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("adminUser", user);
		adminDao.AddDisease(disease);
		return"redirect:/view_disease.it?id=" + disease.getId();
	}
}
