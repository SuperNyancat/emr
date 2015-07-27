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
import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Nurse;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class EditNurseController {
	
	@Autowired
	NurseDao nurseDao;
	
	@Autowired
	UserDao userDao;

	@Autowired
	private CommentsDao commentsDao;
	
	@RequestMapping(value = "/edit_nurse.it")
	public String setUpEditDoctor(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("edit nurse setup controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("admin", "nurse", "edit");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		User user = null;
		Nurse nurse = null;
		try {
			user = userDao.findUserByUsername(username);
			nurse = nurseDao.getNurseById(id);
			
			if(user.getRole().getRoleType().equalsIgnoreCase("administrator")) {
				model.addAttribute("adminUser", user);
			} 
			
			model.addAttribute("nurse", nurse);
			
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "nurse/edit-nurse";
	}
	
	@RequestMapping(value="/update_nurse.it", method=RequestMethod.POST)
	public String updateNurse(HttpServletRequest request, HttpSession session, @ModelAttribute("nurse") Nurse nurse, Model model, @RequestParam("id") long id) {
		System.err.println("update nurse controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		String birthday = request.getParameter("dateOfBirth");
		if(birthday != null && !birthday.isEmpty()) {
			LocalDate bday = LocalDate.parse(birthday);
			nurse.getPersonInfo().setDateOfBirth(bday);
			Years age = Years.yearsBetween(bday, LocalDate.now());
			nurse.getPersonInfo().setAge(age.getYears());
		}
		
		RevisionHistory history = nurse.getPersonInfo().getRevisionHistory();
		history.setDateModified(LocalDate.now());
		history.setModifiedBy(history.getCreatedBy());
		nurseDao.updateNurse(nurse);
		return "redirect:/view_nurse_profile.it?id=" + nurse.getId();
	}
}
