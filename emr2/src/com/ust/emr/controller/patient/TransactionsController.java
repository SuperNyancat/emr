package com.ust.emr.controller.patient;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
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
import com.ust.emr.model.Comment;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Nurse;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.Transaction;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class TransactionsController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private NurseDao nurseDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<Transaction> transactionDao;

	@Autowired
	private CommentsDao commentsDao;
	
	
	private int length = 0;
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/transaction_assembler.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("Transaction - assemble create");
		
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
			Patient patient = patientDao.getPatientById(id);
			model.addAttribute("patient", patient);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		model.addAttribute("form", new Transaction());
		return "patient/transaction/transaction-create";
	}
	

	@RequestMapping(value = "/create_transaction.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") Transaction form, @RequestParam("id") long id) {
		System.err.println("Transaction - create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = patientDao.getPatientById(id);
		User user;
		try {
			user = userDao.findUserByUsername(username);
//			addCurrentLoggedInUser(username,model);
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
			form.setBalance(getBalance(form).toString());
			form.setRevisionHistory(revisionHistory);
			
			form.setDoctor(patient.getCurrentDoctor());
			form.setPatient(patient);

			transactionDao.createForm(form);
		} catch (DataAccessException e) {
			if(e.getMessage().contains("Invalid")) {
				System.err.println("games");
				model.addAttribute("errorMessage", e.getMessage() + "! Please enter numeric characters only.");
				return "redirect:/transaction_assembler.it?id=" + patient.getId();
			}
		}
		model.addAttribute("patient", patient);
		
		return "redirect:/view_transaction.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}
	
	private BigDecimal getBalance(Transaction form) throws DataAccessException {
		BigDecimal balance = new BigDecimal("0.0");
		BigDecimal totalCharges = new BigDecimal("0.0");
		BigDecimal totalPayment= new BigDecimal("0.0");
		
		List<BigDecimal> charges_ = new ArrayList<>();
		List<BigDecimal> payment_ = new ArrayList<>();
		
		//str to BD
		int j = 0;
		for(String s: form.getCharges()) {
			if(s != null && s.length() != 0) {
				if(!s.matches("-?\\d+(\\.\\d+)?")) {
					throw new DataAccessException("Invalid Format");
				}
				System.out.println(s);
//				double b = Double.parseDouble(s);
				BigDecimal bd = new BigDecimal(s.trim());
				charges_.add(bd);
				j++;
			}
		}
		j = 0;
		for(String s: form.getPayment()) {
			if(s != null && s.length() != 0) {
				payment_.add(new BigDecimal(s.trim()));
				j++;
			}
		}
		
		length = charges_.size();
		System.err.println(length);
		for(int i = 0; i < length; i++) {
			totalCharges = totalCharges.add(charges_.get(i));
			System.out.println("total " + totalCharges);
			totalPayment = totalPayment.add(payment_.get(i));
			System.out.println("pay " + totalPayment);
		}
		form.setAmount(totalCharges.toString());
		balance = totalCharges.subtract(totalPayment);
		System.err.println(balance);
		return balance;
	}


	/**
	 * VIEW DETAILS
	 * */
	@RequestMapping(value = "view_transaction.it")
	public String viewTransactionDetails(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("Transaction - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
//			addCurrentLoggedInUser(username,model);
			User loggedInUser = userDao.findUserByUsername(username);
			if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				Doctor doctor = doctorDao.getDoctorByUsername(username);
				model.addAttribute("doctor", doctor);
			
			} else if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("nurse")) {
			
				Nurse nurse = nurseDao.getNurseByUser(loggedInUser);
				model.addAttribute("nurse", nurse);
			}
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("form", transactionDao.getFormById("Transaction", formId));
			model.addAttribute("length", length);

		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "patient/transaction/transaction-view";
	}


	/**
	 * PRINT
	 * */
	@RequestMapping(value = "transaction_print.it")
	public String print(HttpSession session, Model model, @RequestParam("pid") long patientId, @RequestParam("fid") long formId) {
		System.err.println("Transaction - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User loggedInUser = userDao.findUserByUsername(username);
			if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				Doctor doctor = doctorDao.getDoctorByUsername(username);
				model.addAttribute("doctor", doctor);
			} else if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("nurse")) {
				Nurse nurse = nurseDao.getNurseByUser(loggedInUser);
				model.addAttribute("nurse", nurse);
			}
			model.addAttribute("patient", patientDao.getPatientById(patientId));
			model.addAttribute("form", transactionDao.getFormById("Transaction", formId));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "patient/transaction/transaction-print";
	}
	
	
	/**
	 * TABLE
	 * */
	@RequestMapping("/transactions_table.it")
	public String transactionsTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("transaction table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = null;
		try {
//			addCurrentLoggedInUser(username,model);
			User loggedInUser = userDao.findUserByUsername(username);
			if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				Doctor doctor = doctorDao.getDoctorByUsername(username);
				model.addAttribute("doctor", doctor);
			
			} else if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("nurse")) {
		
				Nurse nurse = nurseDao.getNurseByUser(loggedInUser);
				model.addAttribute("nurse", nurse);
			}
			patient = patientDao.getPatientById(id);
			model.addAttribute("patient", patient);
			model.addAttribute("transactionForms", transactionDao.getAllForms("Transaction", patient));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "patient/transaction/transaction-table";
	}
	
	
	
	/**
	 * EDIT / UPDATE
	 * */
	@RequestMapping("edit_transaction.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") Transaction form) {
		System.err.println("Transaction - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
//			addCurrentLoggedInUser(username, model);
			User loggedInUser = userDao.findUserByUsername(username);
			if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				Doctor doctor = doctorDao.getDoctorByUsername(username);
				model.addAttribute("doctor", doctor);
		
			} else if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("nurse")) {
	
				Nurse nurse = nurseDao.getNurseByUser(loggedInUser);
				model.addAttribute("nurse", nurse);
			}
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("form", transactionDao.getFormById("Transaction", form.getId()));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		return "patient/transaction/transaction-edit";
	}
	
	@RequestMapping("update_transaction.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") Transaction form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("Transaction - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
			Patient patient = patientDao.getPatientById(pid);
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);
			form.setBalance(getBalance(form).toString());
			
			form.setDoctor(patient.getCurrentDoctor());
			form.setPatient(patient);
			form.setId(fid);
			transactionDao.updateForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		
		return "redirect:/view_transaction.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	
	/**
	 * DELETE 
	 * */
	@RequestMapping("/delete_transaction.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") Transaction form) {
		System.err.println("Transaction - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		transactionDao.deleteForm(form);
		
		return "redirect:/transactions_table.it?id=" + patientId;
	}
		
	/**
	 * search
	 * */
	@RequestMapping(value = "/search_transaction.it")
	public String search(HttpSession session, Model model, @RequestParam("month") String month, @RequestParam("day") String day,  @RequestParam("year") String year, @RequestParam("id") long id) {
		System.err.println("Transaction - search");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
//			addCurrentLoggedInUser(username,model);
			User loggedInUser = userDao.findUserByUsername(username);
			if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				Doctor doctor = doctorDao.getDoctorByUsername(username);
				model.addAttribute("doctor", doctor);
			
			} else if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("nurse")) {
			
				Nurse nurse = nurseDao.getNurseByUser(loggedInUser);
				model.addAttribute("nurse", nurse);
			}
			model.addAttribute("patient", patientDao.getPatientById(id));
			if(year.equalsIgnoreCase("year") || month.length() > 2 || day.length() > 2) {
				throw new DataAccessException("Invalid format! Please try again");
			}
						
			String date = year+"-"+month+"-"+day;
			model.addAttribute("transactionForms", transactionDao.getFormsByDate("Transaction", new LocalDate(date)));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
			
		
		return "patient/transaction/transaction-table";
	}
	
//	private void addCurrentLoggedInUser(String username, Model model) throws DataAccessException {
//		User loggedInUser = userDao.findUserByUsername(username);
//		if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("doctor")) {
//			Doctor doctor = doctorDao.getDoctorByUsername(username);
//			model.addAttribute("doctor", doctor);
//		} else if(loggedInUser.getRole().getRoleType().equalsIgnoreCase("nurse")) {
//			Nurse nurse = nurseDao.getNurseByUser(loggedInUser);
//			model.addAttribute("nurse", nurse);
//		}
//	}
}
