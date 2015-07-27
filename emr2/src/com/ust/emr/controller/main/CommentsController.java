package com.ust.emr.controller.main;

import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.model.Appointment;
import com.ust.emr.model.CheckUpRecord;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Patient;
import com.ust.emr.model.forms.BASG;
import com.ust.emr.utilities.DataAccessException;

@Controller 
public class CommentsController {
	@Autowired
	private CommentsDao commentsDao;
	
	@Autowired
	private PatientDao patientDao;
	
	@RequestMapping(value="comment.it", method = RequestMethod.POST) 
	public String add(Model model, HttpSession session, @ModelAttribute("comment") Comment comment){
		System.err.println("Add comment - login");
		
		comment.setTimestamp(DateTime.now());
		commentsDao.saveComment(comment);
		session.setAttribute("exists", "true");
		session.setAttribute("success", "Comment added successfully!");
		
		
		return "redirect:/Assembler.it"; 
	}
	
	@RequestMapping(value="ecomment.it", method = RequestMethod.POST)
	public String edit(Model model, HttpSession session, @ModelAttribute("comment") Comment comment, @RequestParam("cid") long commentId) {
		System.err.println("edit comment - login");
		
		comment.setId(commentId);
		comment.setTimestamp(DateTime.now());
		System.err.println(comment);
		commentsDao.updateComment(comment);
		session.setAttribute("success", "Comment updated successfully!");
		return "redirect:/Assembler.it"; 
	}
	
	
	@RequestMapping(value = "add_comment.it", method = RequestMethod.POST)
	public String addComment(Model model, HttpSession session, @ModelAttribute("comment") Comment comment, @RequestParam("id") long id, @RequestParam("fid") String formId) {
		System.err.println("Comment - add");
		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		long fid = 0;
		if(!formId.equals("null")) {
			fid = Long.parseLong(formId);
		}
		
		comment.setTimestamp(DateTime.now());
		commentsDao.saveComment(comment);
		Patient patient = null;
		patient = patientDao.getPatientById(id);
		session.setAttribute("exists", "true");
		session.setAttribute("success", "Comment added successfully!");
		
		if(comment.getUser().equalsIgnoreCase("admin")) {
			return adminRedirect(comment, id);
		} else if(comment.getModule().equalsIgnoreCase("home")) {
			return redirectHome(comment,id);
		}	else {
			return patientRedirect(comment, patient, fid);
		}
	}

	@RequestMapping(value = "edit_comment.it", method = RequestMethod.POST)
	public String edit(Model model, HttpSession session, @ModelAttribute("comment") Comment comment, @RequestParam("id") long id, @RequestParam("fid") String formId,  @RequestParam("cid") long commentId){
		System.err.println("Comment - edit");
		
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		long fid = 0;
		if(!formId.equals("null") && !formId.equals("")) {
			fid = Long.parseLong(formId);
		}
		
		comment.setId(commentId);
		comment.setTimestamp(DateTime.now());
		System.err.println(comment);
		commentsDao.updateComment(comment);
		Patient patient = null;
		patient = patientDao.getPatientById(id);
		session.setAttribute("success", "Comment updated successfully!");
		
		if(comment.getUser().equalsIgnoreCase("admin")) {
			return adminRedirect(comment, id);
		} else if(comment.getModule().equalsIgnoreCase("home")) {
			return redirectHome(comment,id);
		}	else {
			return patientRedirect(comment, patient, fid);
		}
	}
	
	private String redirectHome(Comment comment, long id) {
		if(comment.getUser().equals("doctor")) {
			System.err.println("redirect home");
			return "redirect:/doctor_homepage.it";
		} else {
			return "redirect:/nurse_homepage.it";
		}
	}

	/**
	 * MAIN REDIRECT
	 * @param fid 
	 * */
	
	private String adminRedirect(Comment comment, long id) {
		if(comment.getModule().contains("nurse")) {
			return redirectAdminNurse(comment,id);
		} else if(comment.getModule().contains("home")) {
			return "redirect:/admin_homepage.it";
		} else if(comment.getModule().contains("medicine")) {
			return redirectMeds(comment,id);
		} else if(comment.getModule().contains("disease")) {
			return redirectDisease(comment,id);
		} else if(comment.getModule().contains("doctor")) {
			return redirectAdminDoc(comment,id);
		} else { //reports
			return "redirect:/view_admin_reports.it?y=" + LocalDate.now().getYear();
		}
	}
	
	

	private String patientRedirect(Comment comment, Patient patient, long fid) {
		if(comment.getModule().contains("patient")) {
			return redirectPatientProfile(comment,patient,fid);
		} else if(comment.getModule().contains("history")) {
			return redirectHistory(comment, patient, fid);
		}else if(comment.getModule().contains("check-up")) {
			return redirectCheckUp(comment, patient, fid);
		}else if(comment.getModule().contains("medications")) {
			return redirectMedications(comment, patient, fid);
		}else if(comment.getModule().contains("transactions")) {
			return redirectTransactions(comment, patient, fid);
		} else if(comment.getModule().contains("appointments")) {
			return redirectAppointments(comment, patient, fid);
		} else if(comment.getModule().contains("archives")) {
		} else if(comment.getModule().contains("reports")) {
			return redirectReports(comment,patient,fid);
		}
		
		// forms (12)
		else if(comment.getModule().contains("basdai")) {
			return redirectBasdai(comment, patient, fid);
		}
		else if(comment.getModule().contains("basfi")) {
			return redirectBasfi(comment, patient, fid);
		}
		else if(comment.getModule().contains("basg")) {
			return redirectBasg(comment, patient, fid);
		}
		else if(comment.getModule().contains("damage")) {
			return redirectDamage(comment, patient, fid);
		}
		else if(comment.getModule().contains("myopathy")) {
			return redirectMyopathy(comment, patient, fid);
		}
		else if(comment.getModule().contains("sle flowsheet")) {
			return redirectSLE(comment, patient, fid);
		}
		else if(comment.getModule().contains("ss flowsheet")) {
			return redirectSS(comment, patient, fid);
		}
		else if(comment.getModule().contains("lab")) {
			return redirectLab(comment, patient, fid);
		}
		else if(comment.getModule().contains("mex")) {
			return redirectMex(comment, patient, fid);
		}
		else if(comment.getModule().contains("sledaa")) {
			return redirectSledaa(comment, patient, fid);
		}
		else if(comment.getModule().contains("sledai")) {
			return redirectSledai(comment, patient, fid);
		} 
		else if(comment.getModule().contains("flare")) {
			return redirectFlare(comment, patient, fid);
		} 
		
		else if(comment.getModule().contains("archive" )){
			return "redirect:/archives_table.it?id=" + patient.getId();
		} 
		else { 
			return "redirect:/view_doctor_reports.it?y=" + LocalDate.now().getYear();
		}
		return null;
			
	}
	
	
	
	private String redirectReports(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("checkup details")) {
			return "redirect:/visit_details.it?id=" + patient.getId() + "&m=" + LocalDate.now().getMonthOfYear() + "&y=" + LocalDate.now().getYear();
		} else if(comment.getFunction().contains("forms count")) {
			return "redirect:/basdai_reports.it?id=" + patient.getId() + "&m=" + LocalDate.now().getMonthOfYear() + "&y=" + LocalDate.now().getYear();
		} else {
			return "redirect:/view_reports.it?id=" + patient.getId() + "&y=" + LocalDate.now().getYear();
		}
	}

/**
 * ADMIN - no problem sa edit
 * */
		
	private String redirectAdminNurse(Comment comment, long id) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/create_nurse_assembler.it"; 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_nurse_profile.it?id=" +id; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/edit_nurse.it?id=" + id; 
		} else {
			return "redirect:/view_nurses.it"; 
		} 	
	}

	private String redirectDisease(Comment comment, long id) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/add_disease_assembler.it"; 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_disease.it?id=" +id; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/edit_disease.it?id=" + id; 
		} else {
			return "redirect:/view_diseases.it"; 
		} 	
	}

	private String redirectAdminDoc(Comment comment, long id) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/create_doctor_assembler.it"; 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_doctor_profile.it?id=" +id; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/edit_doctor.it?id=" + id; 
		} else {
			return "redirect:/view_doctors.it"; 
		} 		}

	private String redirectMeds(Comment comment, long id) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/add_medicine_assembler.it"; 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_medicine.it?id=" +id; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/edit_medicine.it?id=" + id; 
		} else {
			return "redirect:/view_medicines.it"; 
		} 	
	}
	
	/**
	 * Doctor
	 * */
	
	private String redirectPatientProfile(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/create_patient_assembler.it"; 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_patient_profile.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_patient_profile.it?id=" + patient.getId(); 
		} else if(comment.getUser().equalsIgnoreCase("nurse") && comment.getFunction().equalsIgnoreCase("table")) {
			return "redirect:/view_all_patients.it";
		} else {
			return "redirect:/view_patients.it"; 
		} 	
	}
	
	private String redirectHistory(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_patient_history.it?id=" + patient.getId(); 
		} else {
			return "redirect:/view_patient_history.it?id=" + patient.getId(); 
		} 
	}
	
	private String redirectCheckUp(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/check_up_sessions_assembler.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_checkup_session.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_checkup_session.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else {
			return "redirect:/view_checkup_sessions.it?id=" + patient.getId(); 
		} 	
	}
	
	private String redirectMedications(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/create_medications_and_prescriptions_assembler.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_pres_meds.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_pres_meds.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else {
			return "redirect:/view_medications_and_prescriptions.it?id=" + patient.getId(); 
		} 	
	}
	
	private String redirectTransactions(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/transaction_assembler.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_transaction.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_transaction.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else {
			return "redirect:/transactions_table.it?id=" + patient.getId(); 
		} 	
	}
	
	@Autowired
	private FormsDao<Appointment> appointmentsDao;
	private String redirectAppointments(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/appointments_assembler.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_checkup_session.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_checkup_session.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getModule().contains("header")) {
			return "redirect:/view_appointments.it";
		}
		else {
			return "redirect:/appointments_table.it?id=" + patient.getId(); 
		} 	
	}
	
	/**
	 * Forms Tab
	 * */
	
	private String redirectBasdai(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/BASDAI_form_assembler.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_basdai.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_basdai.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else {
			return "redirect:/BASDAI_table.it?id=" + patient.getId(); 
		} 		
	}
	
	private String redirectBasfi(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/BASFI_form_assembler.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_basfi.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_basfi.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else {
			return "redirect:/BASFI_table.it?id=" + patient.getId(); 
		} 		
	}
	
	@Autowired
	private FormsDao<BASG> basgDao;
	private String redirectBasg(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/BASG_form_assembler.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_basg.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_basg.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else {
			return "redirect:/BASG_table.it?id=" + patient.getId(); 
		} 		
	}

	private String redirectDamage(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/damage_index_form_assembler.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_damage_index.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_damage_index.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else {
			return "redirect:/damage_index_SLE_table.it?id=" + patient.getId(); 
		} 	
	}

	private String redirectMyopathy(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/inflammatory_myopath_form_assembler.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_inflammatory_myopath.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_inflammatory_myopath.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else {
			return "redirect:/inflammatory_myopath_table.it?id=" + patient.getId(); 
		} 		
	}

	private String redirectSLE(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/SLE_flowsheet_form_assembler.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_SLE_flowsheet.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_SLE_flowsheet.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else {
			return "redirect:/SLE_flowsheet_table.it?id=" + patient.getId(); 
		} 		
	}
	
	private String redirectSS(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/SS_flowsheet_form_assembler.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_SS_flowsheet.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_SS_flowsheet.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else {
			return "redirect:/SS_flowsheet_table.it?id=" + patient.getId(); 
		} 	
	}

	private String redirectLab(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/laboratory_request_assembler.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_lab_request.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_lab_request.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("table")){
			return "redirect:/lab_request_table.it?id=" + patient.getId();
		}else { //print
			return "redirect:/print.it?pid=" + patient.getId() + "&fid=" + fid; 
		}
	}
	
	private String redirectMex(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/MEXSLEDAI_form_assembler.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_MEXSLEDAI.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_MEXSLEDAI.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else {
			return "redirect:/MEXSLEDAI_table.it?id=" + patient.getId(); 
		} 		
	}

	private String redirectSledaa(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/SLEDAA_case_report_form_assembler.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_sledaa.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_sledaa.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else {
			return "redirect:/SLEDAA_table.it?id=" + patient.getId(); 
		} 	
	}

	private String redirectSledai(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/SLEDAI_score_form_assembler.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_sledai_score.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_sledai_score.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else {
			return "redirect:/SLEDAI_score_table.it?id=" + patient.getId(); 
		} 		
	}

	private String redirectFlare(Comment comment, Patient patient, long fid) {
		if(comment.getFunction().equalsIgnoreCase("create")) {
			return "redirect:/sle_flare_form_assembler.it?id=" + patient.getId(); 
		} else if(comment.getFunction().equalsIgnoreCase("view")) {
			return "redirect:/view_sle_flare_form.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else if(comment.getFunction().equalsIgnoreCase("edit")) {
			return "redirect:/view_sle_flare_form.it?pid=" + patient.getId() + "&fid=" + fid; 
		} else {
			return "redirect:/SLE_flare_table.it?id=" + patient.getId(); 
		} 	
	}


/**
 * NURSE
 * */


}
