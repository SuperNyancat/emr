package com.ust.emr.controller.patient;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Patient;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class HistoryTabController {
	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private NurseDao nurseDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private CommentsDao commentsDao;
	
	
	/**
	 * EDIT
	 * */
	
	@RequestMapping("/edit_history.it")
	public String editHistoryAssembler(Model model, HttpSession session, @RequestParam("id") long id) {
		System.err.println("edit history setup controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		User user = null;
	
			try {
				user = userDao.findUserByUsername(username);
				
				if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
					model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
					/**
					 * COMMENTS // DELETE LATER
					 * */
					try {
						Comment comment = commentsDao.getLatestCommentAdded("doctor", "history", "edit");
						model.addAttribute("comment", comment);
					} catch (DataAccessException e1) {
						model.addAttribute("comment", new Comment());
					}
					/**
					 * end comment
					 * */
				} else if (user.getRole().getRoleType().equalsIgnoreCase("nurse")) {
					/**
					 * COMMENTS // DELETE LATER
					 * */
					try {
						Comment comment = commentsDao.getLatestCommentAdded("nurse", "history", "edit");
						model.addAttribute("comment", comment);
					} catch (DataAccessException e1) {
						model.addAttribute("comment", new Comment());
					}
					/**
					 * end comment
					 * */
					model.addAttribute("nurse", nurseDao.getNurseByUser(user));
				}
				model.addAttribute("patient", patientDao.getPatientById(id));
				
			} catch (DataAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	
		return "patient/history/edit-history";
	}
	
	@RequestMapping(value = "/update_history.it", method = RequestMethod.POST)
	public String editHistory(Model model, HttpSession session, @ModelAttribute("patient") Patient patient, @RequestParam("id") long id){
		System.err.println("update history controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user = null;
		
			try {
				user = userDao.findUserByUsername(username);
				if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
					model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
				} else if (user.getRole().getRoleType().equalsIgnoreCase("nurse")) {
					model.addAttribute("nurse", nurseDao.getNurseByUser(user));
					Doctor d = doctorDao.getDoctorById(patient.getCurrentDoctor().getId());
					doctorDao.updateDoctor(d);
					patient.setCurrentDoctor(d);
				}
				
				patientDao.update(patient);
				model.addAttribute("patient", patient);
			} catch (DataAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return "redirect:/view_patient_history.it?id=" + patient.getId();
	}
	
	
	/**
	 * VIEW
	 * */
	@RequestMapping(value = "/view_patient_history.it")
	public String viewHistory(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("view history controller");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		User user = null;
	
			try {
				user = userDao.findUserByUsername(username);
				if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
					model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
					/**
					 * COMMENTS // DELETE LATER
					 * */
					try {
						Comment comment = commentsDao.getLatestCommentAdded("doctor", "history", "view");
						model.addAttribute("comment", comment);
					} catch (DataAccessException e1) {
						model.addAttribute("comment", new Comment());
					}
					/**
					 * end comment
					 * */
				} else if (user.getRole().getRoleType().equalsIgnoreCase("nurse")) {
					/**
					 * COMMENTS // DELETE LATER
					 * */
					try {
						Comment comment = commentsDao.getLatestCommentAdded("nurse", "history", "view");
						model.addAttribute("comment", comment);
					} catch (DataAccessException e1) {
						model.addAttribute("comment", new Comment());
					}
					/**
					 * end comment
					 * */
					model.addAttribute("nurse", nurseDao.getNurseByUser(user));
				}
				Patient patient = patientDao.getPatientById(id);
				model.addAttribute("patient", patient);
			} catch (DataAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return "patient/history/view-histo";	
	}
}
