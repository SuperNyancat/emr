package com.ust.emr.controller.admin;

import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
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
import com.ust.emr.model.Medicine;
import com.ust.emr.model.Nurse;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class AddMedicineController {
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private UserDao userDao;

	@Autowired
	private CommentsDao commentsDao;
	
	@RequestMapping(value = "/add_medicine_assembler.it")
	public String setUpAddMedicine(HttpSession session, Model model) {
		System.err.println("setup add medicine");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user = null;
		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("admin", "medicine", "create");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
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
		model.addAttribute("medicine", new Medicine());
		return "admin/add-medicine";
	}
	
	@RequestMapping(value = "/add_medicine.it", method = RequestMethod.POST)
	public String createNurseAccount(Model model, HttpSession session,  @ModelAttribute("medicine") Medicine medicine, @RequestParam("id") long id) {
		System.err.println("add medicine CONTROLLER");
		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		User user = null;
		try {
			user = userDao.findUserByUsername(username);
			if(user.getRole().getId()!=1)
				return "redirect:/logout.it?";
			adminDao.AddMedicine(medicine);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("adminUser", user);
	
		return "redirect:/view_medicine.it?id=" + medicine.getId();
	}
}
