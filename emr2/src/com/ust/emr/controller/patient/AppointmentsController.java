package com.ust.emr.controller.patient;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.joda.time.LocalTime;
import org.omg.CORBA.IntHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.RevisionHistoryDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Appointment;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Nurse;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.model.forms.AppointmentFormBacker;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class AppointmentsController {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private NurseDao nurseDao;
	
	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<Appointment> appointmentsDao;

	@Autowired
	private CommentsDao commentsDao;
	
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/appointments_assembler.it")
	public String assemble(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("appointments - assembler");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		try {
			User user = userDao.findUserByUsername(username);

			if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
				
			} else if (user.getRole().getRoleType().equalsIgnoreCase("nurse")) {
				
				List<Doctor> doctors = doctorDao.getAllEnabledDoctors();
				model.addAttribute("doctors", doctors);
				model.addAttribute("nurse", nurseDao.getNurseByUser(user));
			}
			
			model.addAttribute("patient", patientDao.getPatientById(id));
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("form", new AppointmentFormBacker());
		return "patient/appointments/appointment-create";
	}
	
	@RequestMapping(value = "/create_appointment.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") AppointmentFormBacker form, @RequestParam("id") long id) {
		System.err.println("Appointment - create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		Patient patient = patientDao.getPatientById(id);
		Appointment appointmentForm = null;
		try {
			user = userDao.findUserByUsername(username);
//			addCurrentLoggedInUser(username, model);
			User loggedInUser = userDao.findUserByUsername(username);
			if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				Doctor doctor = doctorDao.getDoctorByUsername(username);
				model.addAttribute("doctor", doctor);
			} else if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("nurse")) {
				Nurse nurse = nurseDao.getNurseByUser(loggedInUser);
				model.addAttribute("nurse", nurse);
			}
			RevisionHistory revisionHistory = new RevisionHistory(LocalDate.now(), user);
			revisionHistoryDao.saveHistory(revisionHistory);
			appointmentForm = getConvertedAppointmentForm(form);
			appointmentForm.setRevisionHistory(revisionHistory);
			appointmentForm.setPatient(patient);
			appointmentForm.setDoctor(doctorDao.getDoctorById(form.getDoctor()));
			appointmentsDao.createForm(appointmentForm);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/view_appointment.it?pid=" + patient.getId() + "&fid=" + appointmentForm.getId();
	}

	private Appointment getConvertedAppointmentForm(AppointmentFormBacker form) {
		System.err.println("h:m " + form.getStart_hour() + form.getStart_minute());
		String d8 = form.getYear() + "-" + form.getMonth() + "-" + form.getDay();
		Appointment a = new Appointment(form.getTitle(), form.getDetails(), new LocalDate(d8), new LocalTime(get24Hours(form.getStart_hour(), form.getStart_ampm()), Integer.parseInt(form.getStart_minute())),
				new LocalTime(get24Hours(form.getEnd_hour(),form.getStart_ampm()), Integer.parseInt(form.getEnd_minute())));
		
		return a;
	}

	private int get24Hours(String hour, String ampm) {
		int h = Integer.parseInt(hour);
		if(ampm.equalsIgnoreCase("pm")){
			h += 12;
		}
		return h;
	}
	
	
	/**
	 * VIEW DETAILS
	 * */
	@RequestMapping(value = "view_appointment.it")
	public String viewDetails(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("Appointment - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
//			addCurrentLoggedInUser(username, model);
			User loggedInUser = userDao.findUserByUsername(username);
			if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				Doctor doctor = doctorDao.getDoctorByUsername(username);
				model.addAttribute("doctor", doctor);
				/**
				 * COMMENTS // DELETE LATER
				 * */
				try {
					Comment comment = commentsDao.getLatestCommentAdded("doctor", "appointments", "view");
					model.addAttribute("comment", comment);
				} catch (DataAccessException e1) {
					model.addAttribute("comment", new Comment());
				}
				/**
				 * end comment
				 * */
			} else if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("nurse")) {
				/**
				 * COMMENTS // DELETE LATER
				 * */
				try {
					Comment comment = commentsDao.getLatestCommentAdded("nurse", "appointments", "view");
					model.addAttribute("comment", comment);
				} catch (DataAccessException e1) {
					model.addAttribute("comment", new Comment());
				}
				/**
				 * end comment
				 * */
				Nurse nurse = nurseDao.getNurseByUser(loggedInUser);
				model.addAttribute("nurse", nurse);
			}
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("form", appointmentsDao.getFormById("Appointment", formId));
	//			model.addAttribute("length", length);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "patient/appointments/appointments-view";
	}
	
	/**
	 * TABLE
	 * */
		
	@RequestMapping("/appointments_table.it")
	public String viewTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("Appointment table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);


		Patient patient = null;
		try {
//			addCurrentLoggedInUser(username, model);
			User loggedInUser = userDao.findUserByUsername(username);
			if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				Doctor doctor = doctorDao.getDoctorByUsername(username);
				model.addAttribute("doctor", doctor);
				/**
				 * COMMENTS // DELETE LATER
				 * */
				try {
					Comment comment = commentsDao.getLatestCommentAdded("doctor", "appointments", "table");
					model.addAttribute("comment", comment);
				} catch (DataAccessException e1) {
					model.addAttribute("comment", new Comment());
				}
				/**
				 * end comment
				 * */
			} else if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("nurse")) {
				/**
				 * COMMENTS // DELETE LATER
				 * */
				try {
					Comment comment = commentsDao.getLatestCommentAdded("nurse", "appointments", "table");
					model.addAttribute("comment", comment);
				} catch (DataAccessException e1) {
					model.addAttribute("comment", new Comment());
				}
				/**
				 * end comment
				 * */
				Nurse nurse = nurseDao.getNurseByUser(loggedInUser);
				model.addAttribute("nurse", nurse);
			}
			patient = patientDao.getPatientById(id);
			model.addAttribute("patient", patient);
			model.addAttribute("appointmentForms", appointmentsDao.getAllForms("Appointment", patient));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "patient/appointments/appointments-table";
	}
		
	
	@RequestMapping("/view_appointments")
	public String allAppointmentsOfDoctor(HttpSession session, Model model) {
		System.err.println("Appointments of doctor table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
//			addCurrentLoggedInUser(username, model);
			User loggedInUser = userDao.findUserByUsername(username);
			if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				Doctor doctor = doctorDao.getDoctorByUsername(username);
				model.addAttribute("doctor", doctor);
				/**
				 * COMMENTS // DELETE LATER
				 * */
				try {
					Comment comment = commentsDao.getLatestCommentAdded("doctor", "header appointments", "table");
					model.addAttribute("comment", comment);
				} catch (DataAccessException e1) {
					model.addAttribute("comment", new Comment());
				}
				/**
				 * end comment
				 * */
			} else if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("nurse")) {
				/**
				 * COMMENTS // DELETE LATER
				 * */
				try {
					Comment comment = commentsDao.getLatestCommentAdded("nurse", "header appointments", "table");
					model.addAttribute("comment", comment);
				} catch (DataAccessException e1) {
					model.addAttribute("comment", new Comment());
				}
				/**
				 * end comment
				 * */
				Nurse nurse = nurseDao.getNurseByUser(loggedInUser);
				model.addAttribute("nurse", nurse);
			}
			model.addAttribute("appointmentForms", appointmentsDao.getLatestForms("Appointment", 20, doctorDao.getDoctorByUsername(username)));
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "patient/appointments/appointments-table";
	}
	
	/**
	 * EDIT / UPDATE
	 * */
	@RequestMapping("edit_appointment.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") Appointment form) {
		System.err.println("Appointment - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		
		
		try {
			User user = userDao.findUserByUsername(username);
			
			if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				/**
				 * COMMENTS // DELETE LATER
				 * */
				try {
					Comment comment = commentsDao.getLatestCommentAdded("doctor", "appointments", "edit");
					model.addAttribute("comment", comment);
				} catch (DataAccessException e1) {
					model.addAttribute("comment", new Comment());
				}
				/**
				 * end comment
				 * */
				
				model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			} else if (user.getRole().getRoleType().equalsIgnoreCase("nurse")) {
				/**
				 * COMMENTS // DELETE LATER
				 * */
				try {
					Comment comment = commentsDao.getLatestCommentAdded("nurse", "appointments", "edit");
					model.addAttribute("comment", comment);
				} catch (DataAccessException e1) {
					model.addAttribute("comment", new Comment());
				}
				/**
				 * end comment
				 * */
				List<Doctor> doctors = doctorDao.getAllEnabledDoctors();
				model.addAttribute("doctors", doctors);
				model.addAttribute("nurse", nurseDao.getNurseByUser(user));
			}
			
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("form", getFormBacker(appointmentsDao.getFormById("Appointment", form.getId())));
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "patient/appointments/appointments-edit";
	}
	
	private AppointmentFormBacker getFormBacker(Appointment appointment) {
		AppointmentFormBacker form = new AppointmentFormBacker(appointment.getTitle(), appointment.getDetails(), String.valueOf(appointment.getDate().getMonthOfYear()), String.valueOf(appointment.getDate().getDayOfMonth()),
				String.valueOf(appointment.getDate().getYear()), get12Hours(appointment.getStartTime().getHourOfDay()), String.valueOf(appointment.getStartTime().getMinuteOfHour()), 
				get12Hours(appointment.getEndTime().getHourOfDay()), String.valueOf(appointment.getEndTime().getMinuteOfHour()), 
				getAMPM(appointment.getEndTime().getHourOfDay()), getAMPM(appointment.getStartTime().getHourOfDay()), appointment.getDoctor().getId());
		form.setId(appointment.getId());
		form.setPatient(appointment.getPatient().getId());
		return form;
	}

	private String get12Hours(int hourOfDay) {
		return (hourOfDay > 12 ? String.valueOf(hourOfDay-12) : String.valueOf(hourOfDay));
	}

	private String getAMPM(int hourOfDay) {
		return (hourOfDay > 12 ? "pm" : "am");
	}

	@RequestMapping("update_appointment.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") AppointmentFormBacker backer, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("Appointment - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		Appointment form = getTransferredAppointmentForm(appointmentsDao.getFormById("Appointment", fid), backer);
		
		try {
			user = userDao.findUserByUsername(username);
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);
			form.setId(fid);
			appointmentsDao.updateForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_appointment.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	
	private Appointment getTransferredAppointmentForm(Appointment a, AppointmentFormBacker form) {
		String d8 = form.getYear() + "-" + form.getMonth() + "-" + form.getDay();
		
		a.setTitle(form.getTitle());
		a.setDetails(form.getDetails());
		a.setDate(new LocalDate(d8));
		a.setStartTime(new LocalTime(get24Hours(form.getStart_hour(), form.getStart_ampm()), Integer.parseInt(form.getStart_minute())));
		a.setEndTime(new LocalTime(get24Hours(form.getEnd_hour(),form.getStart_ampm()), Integer.parseInt(form.getEnd_minute())));
		
		//doc and patient
		a.setDoctor(doctorDao.getDoctorById(form.getDoctor()));
		a.setPatient(patientDao.getPatientById(form.getPatient()));
		return a;
	}

	/**
	 * DELETE 
	 * */
	@RequestMapping("/delete_appointment.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") Appointment form) {
		System.err.println("Appointment - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		appointmentsDao.deleteForm(form);
		
		return "redirect:/appointments_table.it?id=" + patientId;
	}
	
	/**
	 * search
	 * */
	@RequestMapping(value = "/search_appointment.it")
	public String search(HttpSession session, Model model, @RequestParam("month") String month, @RequestParam("day") String day,  @RequestParam("year") String year, @RequestParam("id") long id) {
		System.err.println("Appointment - search");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
	
		try {
//			addCurrentLoggedInUser(username,model);
			User loggedInUser = userDao.findUserByUsername(username);
			if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				Doctor doctor = doctorDao.getDoctorByUsername(username);
				model.addAttribute("doctor", doctor);
				/**
				 * COMMENTS // DELETE LATER
				 * */
				try {
					Comment comment = commentsDao.getLatestCommentAdded("doctor", "appointments", "table");
					model.addAttribute("comment", comment);
				} catch (DataAccessException e1) {
					model.addAttribute("comment", new Comment());
				}
				/**
				 * end comment
				 * */
			} else if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("nurse")) {
				/**
				 * COMMENTS // DELETE LATER
				 * */
				try {
					Comment comment = commentsDao.getLatestCommentAdded("nurse", "appointments", "table");
					model.addAttribute("comment", comment);
				} catch (DataAccessException e1) {
					model.addAttribute("comment", new Comment());
				}
				/**
				 * end comment
				 * */
				Nurse nurse = nurseDao.getNurseByUser(loggedInUser);
				model.addAttribute("nurse", nurse);
			}
			model.addAttribute("patient", patientDao.getPatientById(id));
			if(year.equalsIgnoreCase("year") || month.length() > 2 || day.length() > 2) {
				throw new DataAccessException("Invalid format! Please try again");
			}
						
			String date = year+"-"+month+"-"+day;
			model.addAttribute("appointmentForms", appointmentsDao.getFormsByDate("Appointment", new LocalDate(date)));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
			
		
		return "patient/appointments/appointments-table";
	}
		
//		private void addCurrentLoggedInUser(String username, Model model) throws DataAccessException {
//			User loggedInUser = userDao.findUserByUsername(username);
//			if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("doctor")) {
//				Doctor doctor = doctorDao.getDoctorByUsername(username);
//				model.addAttribute("doctor", doctor);
//			} else if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("nurse")) {
//				Nurse nurse = nurseDao.getNurseByUser(loggedInUser);
//				model.addAttribute("nurse", nurse);
//			}
//		}
	
}
