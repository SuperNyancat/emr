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
import com.ust.emr.model.Medicine;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class EditMedicineController {
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	UserDao userDao;

	@Autowired
	private CommentsDao commentsDao;
	
	@RequestMapping(value = "/edit_medicine.it")
	public String setUpEditMedicine(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("edit medicine setup controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("admin", "medicine", "edit");
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
			Medicine medicine = adminDao.getMedicineById(id);
			model.addAttribute("medicine", medicine);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("adminUser", user);
		return "admin/edit-medicine";
	}
	
	@RequestMapping(value="/update_medicine.it", method=RequestMethod.POST)
	public String updateMedicine(HttpSession session, @ModelAttribute("medicine") Medicine medicine, Model model, @RequestParam("id") long id) {
		System.err.println("update medicine controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		medicine.setId(id);
		adminDao.updateMedicine(medicine);
		return "redirect:/view_medicine.it?id=" + medicine.getId();
	}
}
