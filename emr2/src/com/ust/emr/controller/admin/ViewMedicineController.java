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
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Medicine;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class ViewMedicineController {
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	DoctorDao doctorDao;
	
	@Autowired
	UserDao userDao;

	@Autowired
	private CommentsDao commentsDao;
	
	@RequestMapping(value = "/view_medicine.it")
	public String viewProfile(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("VIEW medicine CONTROLLER");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		User user = null;

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("admin", "medicine", "view");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		 try {
			user = userDao.findUserByUsername(username);
			Medicine medicine = adminDao.getMedicineById(id);
			model.addAttribute("medicine", medicine);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 model.addAttribute("adminUser", user);
		return "admin/view-medicine-info";
	}
}
