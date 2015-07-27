package com.ust.emr.controller.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Nurse;
import com.ust.emr.model.PersonInfo;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class ForgetPasswordController {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private NurseDao nurseDao;
	
	
	@RequestMapping("/pass_assemble.it")
	public String assemble(Model model) {
		System.err.println("Forget Password - ASSEMBLE");
		return "forgetPassword/reset-password";
	}
	
	@RequestMapping("/pass_retrieve.it")
	public String retrievePassword(Model model, HttpServletRequest request) {
		String email = request.getParameter("email");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		String username = request.getParameter("username");
		String errorMessage = "";
		HttpSession session = request.getSession(true);
		
		try {
			User user = userDao.findUserByUsername(username);
			PersonInfo info = null;
			boolean isDoctor = false;
			
			if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				Doctor doctor = doctorDao.getDoctorByUser(user);
				info = doctor.getPersonInfo();
				isDoctor = true;
				
			} else if(user.getRole().getRoleType().equalsIgnoreCase("nurse")) {
				Nurse nurse = nurseDao.getNurseByUser(user);
				info = nurse.getPersonInfo();
			}
			
			if(info.getEmail().equalsIgnoreCase(email)) {
				if(info.getSecurityQuestion().equalsIgnoreCase(question)) {
					if(info.getSecurityAnswer().equalsIgnoreCase(answer)) {
						String password = resetPasswordToBirthday(isDoctor, user);
						user.setPassword(password);
						userDao.updateUser(user);
					} else {
						errorMessage = "Security question/answer incorrect!";
					}
				} else {
					errorMessage = "Security question/answer incorrect!";
				}
			} else {
				errorMessage = "E-mail address not found!";
			}
			System.err.println(errorMessage);
			if(!errorMessage.isEmpty()) throw new DataAccessException();
			session.setAttribute("successMessage", "Password reset successful!");
		} catch (DataAccessException e) {
//			errorMessage = "Username not found!";
			e.printStackTrace();
			session.setAttribute("errorMessage", errorMessage);
			return "redirect:/pass_assemble.it";
		}
		
		return "redirect:/Assemble.it";
	}

	private String resetPasswordToBirthday(boolean isDoctor, User user) throws DataAccessException {
		LocalDate bday = new LocalDate();
		if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
			Doctor doctor = doctorDao.getDoctorByUser(user);
			bday = doctor.getPersonInfo().getDateOfBirth();
		} else if(user.getRole().getRoleType().equalsIgnoreCase("nurse")) {
			Nurse nurse = nurseDao.getNurseByUser(user);
			bday = nurse.getPersonInfo().getDateOfBirth();
		}
		return bday.toString();
		
	}
}
