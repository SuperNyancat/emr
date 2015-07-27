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
import com.ust.emr.dao.RevisionHistoryDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Nurse;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;


@Controller
public class CreateNurseController {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private NurseDao nurseDao;
	
	@Autowired
	private RevisionHistoryDao revisionHistoryDao;

	@Autowired
	private CommentsDao commentsDao;
	
	
	@RequestMapping(value = "/create_nurse_assembler.it")
	public String setUpCreateNurse(Model model, HttpSession session) {
		System.out.println("SETUP CREATE NURSE");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		User user = null;

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("admin", "nurse", "create");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		try {
			user = userDao.findUserByUsername(username);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//TODO add admin as logged in user
		
		model.addAttribute("adminUser", user);
		model.addAttribute("nurse", new Nurse());
		return "nurse/create-nurse";
	}
	
	@RequestMapping(value = "/create_nurse.it", method = RequestMethod.POST)
	public String createNurseAccount(HttpServletRequest request, Model model, HttpSession session,  @ModelAttribute("nurse") Nurse nurse, @RequestParam("adminId") long id) {
		System.out.println("CREATE NURSE ACCOUNT CONTROLLER");
		
		// set date created and role type
		RevisionHistory history = new RevisionHistory(LocalDate.now(), userDao.findUserById(id));
		nurse.getPersonInfo().setRevisionHistory(history);
		revisionHistoryDao.saveHistory(history);;
		nurse.getUser().setRole(userDao.getRoleByRoleType("nurse"));
		
		String birthday = request.getParameter("dateOfBirth");
		if(birthday != null && !birthday.isEmpty()) {
			LocalDate bday = LocalDate.parse(birthday);
			nurse.getPersonInfo().setDateOfBirth(bday);
			Years age = Years.yearsBetween(bday, LocalDate.now());
			nurse.getPersonInfo().setAge(age.getYears());
		}
		
		// set contacts and address type 
		nurse.getPersonInfo().getAddresses().get(0).setType("home");
		nurse.getPersonInfo().getAddresses().get(1).setType("work");
		nurse.getPersonInfo().getContacts().get(0).setType("home");
		nurse.getPersonInfo().getContacts().get(1).setType("work");
		
		
		nurseDao.createNurse(nurse);
	
		return"redirect:/view_nurse_profile.it?id=" + nurse.getId();
	}
}
