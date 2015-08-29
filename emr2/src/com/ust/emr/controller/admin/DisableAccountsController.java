package com.ust.emr.controller.admin;

import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Nurse;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class DisableAccountsController {
	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private NurseDao nurseDao;
	
	
	@RequestMapping(value = "disable_doctor.it")
	public String disableDoctor(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("disable doctor controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user = userDao.findUserByUsername(username);
			if(user.getRole().getId()!=1)
				return "redirect:/logout.it?";
			Doctor doctor = doctorDao.getDoctorById(id);
			doctor.getUser().setEnabled(false);
			doctor.getPersonInfo().getRevisionHistory().setDeletedBy(user);
			doctor.getPersonInfo().getRevisionHistory().setDateDeleted(LocalDate.now());
			doctorDao.updateDoctor(doctor);
		
			model.addAttribute("adminUser", user);
			session.setAttribute("successMessage", "Successfully disabled Dr. " + doctor.getPersonInfo().getFirstName() + " " +
					doctor.getPersonInfo().getLastName() + "\'s account.");
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/view_admin_reports.it?y=" + LocalDate.now().getYear();
	}
	
	@RequestMapping(value = "disable_nurse.it")
	public String disableNurse(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("disable nurse controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user = userDao.findUserByUsername(username);
			if(user.getRole().getId()!=1)
				return "redirect:/logout.it?";
			Nurse nurse = nurseDao.getNurseById(id);
			nurse.getPersonInfo().getRevisionHistory().setDeletedBy(user);
			nurse.getPersonInfo().getRevisionHistory().setDateDeleted(LocalDate.now());
			
			nurse.getUser().setEnabled(false);
			nurseDao.updateNurse(nurse);
		
			model.addAttribute("adminUser", user);
			session.setAttribute("successMessage", "Successfully disabled" + nurse.getPersonInfo().getFirstName() + " " +
					nurse.getPersonInfo().getLastName() + "\'s account.");
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/view_admin_reports.it?y=" + LocalDate.now().getYear();
	}
	
	
	
	/**
	 * ENABLE
	 * */
	@RequestMapping(value = "enable_doctor.it")
	public String enableDoctor(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("enable doctor controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user = userDao.findUserByUsername(username);
			if(user.getRole().getId()!=1)
				return "redirect:/logout.it?";
			Doctor doctor = doctorDao.getDoctorById(id);
			doctor.getUser().setEnabled(true);
			doctor.getPersonInfo().getRevisionHistory().setModifiedBy(user);
			doctor.getPersonInfo().getRevisionHistory().setDateModified(LocalDate.now());
			doctorDao.updateDoctor(doctor);
		
			model.addAttribute("adminUser", user);
			session.setAttribute("successMessage", "Successfully enabled Dr. " + doctor.getPersonInfo().getFirstName() + " " +
					doctor.getPersonInfo().getLastName() + "\'s account.");
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/view_admin_reports.it?y=" + LocalDate.now().getYear();
	}
	
	@RequestMapping(value = "enable_nurse.it")
	public String enableNurse(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("enable nurse controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user = userDao.findUserByUsername(username);
			if(user.getRole().getId()!=1)
				return "redirect:/logout.it?";
			Nurse nurse = nurseDao.getNurseById(id);
			nurse.getUser().setEnabled(true);
			nurse.getPersonInfo().getRevisionHistory().setModifiedBy(user);
			nurse.getPersonInfo().getRevisionHistory().setDateModified(LocalDate.now());
			
			nurseDao.updateNurse(nurse);
		
			model.addAttribute("adminUser", user);
			session.setAttribute("successMessage", "Successfully enabled" + nurse.getPersonInfo().getFirstName() + " " +
					nurse.getPersonInfo().getLastName() + "\'s account.");
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		return "redirect:/view_admin_reports.it?y=" + LocalDate.now().getYear();
	}
}
