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
import com.ust.emr.model.CheckUpRecord;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.MedicationsAndPrescriptions;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.model.forms.BASDAI;
import com.ust.emr.model.forms.BASFI;
import com.ust.emr.model.forms.BASG;
import com.ust.emr.model.forms.DamageIndexSLE;
import com.ust.emr.model.forms.InflammatoryMyopathFlowSheet;
import com.ust.emr.model.forms.LaboratoryRequest;
import com.ust.emr.model.forms.MEXSLEDAI;
import com.ust.emr.model.forms.SLEDAACaseReportForm;
import com.ust.emr.model.forms.SLEDAIScore;
import com.ust.emr.model.forms.SLEFlare;
import com.ust.emr.model.forms.SLEFlowSheet;
import com.ust.emr.model.forms.SSFlowSheet;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class CheckUpSessionsTabController {
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
	private FormsDao<CheckUpRecord> checkupDao;

	@Autowired
	private CommentsDao commentsDao;
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/check_up_sessions_assembler.it")
	public String assemble(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("check up session - assembler");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);

			if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
				/**
				 * COMMENTS // DELETE LATER
				 * */
				try {
					Comment comment = commentsDao.getLatestCommentAdded("doctor", "check-up", "create");
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
					Comment comment = commentsDao.getLatestCommentAdded("nurse", "check-up", "create");
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
			
			model.addAttribute("patient", patientDao.getPatientById(id));
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("checkUp", new CheckUpRecord());
		return "patient/checkUpSessions/checkup-create";
	}
	
	@RequestMapping(value = "/create_checkup_session.it", method=RequestMethod.POST)
	public String addForm(HttpSession session, Model model, @ModelAttribute("form") CheckUpRecord form, @RequestParam("id") long id) {
		System.err.println("CheckUpRecord - create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		Patient patient = patientDao.getPatientById(id);
		
		try {
			user = userDao.findUserByUsername(username);
			
			if(form.getHeightFeet().length() > 1 || form.getHeightInches().length() > 2) {
				model.addAttribute("errorMessage", "Invalid format! Please specify height.");
				return "redirect:/check_up_sessions_assembler.it?id=" + patient.getId();
			}
			
			if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
			} else if (user.getRole().getRoleType().equalsIgnoreCase("nurse")) {
				model.addAttribute("nurse", nurseDao.getNurseByUser(user));
			}
			
			RevisionHistory revisionHistory = new RevisionHistory(LocalDate.now(), user);
			revisionHistoryDao.saveHistory(revisionHistory);
			
			form.setRevisionHistory(revisionHistory);
			form.setBMI(getBMI(form));
			form.setBSA(getBSA(form));
			form.setPatient(patient);
			checkupDao.createForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		return "redirect:/view_checkup_session.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}
	
	@Autowired
	private FormsDao<MedicationsAndPrescriptions> medsDao;
	

	/**
	 * VIEW
	 * */
	@RequestMapping(value = "/view_checkup_session.it")
	public String view(HttpSession session, Model model, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("checkupsessions - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		try {
			User user = userDao.findUserByUsername(username);
			Patient patient = patientDao.getPatientById(pid);
			CheckUpRecord checkUpRecord = checkupDao.getFormById("CheckUpRecord", fid);
			
			if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
				/**
				 * COMMENTS // DELETE LATER
				 * */
				try {
					Comment comment = commentsDao.getLatestCommentAdded("doctor", "check-up", "view");
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
					Comment comment = commentsDao.getLatestCommentAdded("nurse", "check-up", "view");
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
			putAllFormsDoneToday(checkUpRecord, model);
			model.addAttribute("medsForms", medsDao.getFormByDate("MedicationsAndPrescriptions", checkUpRecord.getRevisionHistory().getDateCreated(), patient));
			model.addAttribute("patient", patient);
			model.addAttribute("form", checkUpRecord);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "patient/checkUpSessions/checkup-view";
	}

	
	

		
	/**
	 * TABLE
	 * */

	@RequestMapping("/view_checkup_sessions.it")
	public String checkupTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("checkupsessions table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		Patient patient = null;
		try {
			patient = patientDao.getPatientById(id);
			User user = userDao.findUserByUsername(username);
			
			if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
				/**
				 * COMMENTS // DELETE LATER
				 * */
				try {
					Comment comment = commentsDao.getLatestCommentAdded("doctor", "check-up", "table");
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
					Comment comment = commentsDao.getLatestCommentAdded("nurse", "check-up", "table");
					model.addAttribute("comment", comment);
				} catch (DataAccessException e1) {
					model.addAttribute("comment", new Comment());
				}
				/**
				 * end comment
				 * */
				model.addAttribute("nurse", nurseDao.getNurseByUser(user));
			}
			model.addAttribute("patient", patient);
			model.addAttribute("checkUpSessions", checkupDao.getAllForms("CheckUpRecord", patient));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "patient/checkUpSessions/checkup-table";
	}
	

	/**
	 * EDIT / UPDATE
	 * */
	@RequestMapping("edit_checkup.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") CheckUpRecord form) {
		System.err.println("CheckUpRecord - setup edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		try {
			User user = userDao.findUserByUsername(username);
			
			if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
				model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
				/**
				 * COMMENTS // DELETE LATER
				 * */
				try {
					Comment comment = commentsDao.getLatestCommentAdded("doctor", "check-up", "edit");
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
					Comment comment = commentsDao.getLatestCommentAdded("nurse", "check-up", "edit");
					model.addAttribute("comment", comment);
				} catch (DataAccessException e1) {
					model.addAttribute("comment", new Comment());
				}
				/**
				 * end comment
				 * */
				model.addAttribute("nurse", nurseDao.getNurseByUser(user));
			}
			
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			model.addAttribute("form", checkupDao.getFormById("CheckUpRecord", form.getId()));
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "patient/checkUpSessions/checkup-edit";
	}
	
	@RequestMapping("update_checkup.it")
	public String update(HttpSession session, Model model, @ModelAttribute("form") CheckUpRecord form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("CheckUpRecord - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		User user;
		try {
			user = userDao.findUserByUsername(username);
					
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);
			form.setBMI(getBMI(form));
			form.setBSA(getBSA(form));
			
			form.setId(fid);
			checkupDao.updateForm(form);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "redirect:/view_checkup_session.it?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
	
	/**
	 * search
	 * */
	@RequestMapping(value = "/search_checkup.it")
	public String search(HttpSession session, Model model, @RequestParam("month") String month, @RequestParam("day") String day,  @RequestParam("year") String year, @RequestParam("id") long id) {
		System.err.println("Checkup - search");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "check-up", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		
		try {
			if(year.equalsIgnoreCase("year") || month.length() > 2 || day.length() > 2) {
				throw new DataAccessException("Invalid format! Please try again");
			}
			
			String date = year+"-"+month+"-"+day;
			model.addAttribute("checkUpSessions", checkupDao.getFormsByDate("CheckUpRecord", new LocalDate(date)));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
			
		
		return "patient/checkUpSessions/checkup-table";
	}
	
	
	/**
	 * DELETE 
	 * */
	@RequestMapping("/delete_checkup.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") CheckUpRecord form) {
		System.err.println("CheckUpRecord - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		checkupDao.deleteForm(form);
		
		return "redirect:/view_checkup_sessions.it?id=" + patientId;
	}
	
	
	/**
	 * HELPER METHODS
	 * */
	
	private String getBMI(CheckUpRecord checkUpRecord) {
		double feet=Integer.parseInt(checkUpRecord.getHeightFeet()), feetToInches=0, inches=Double.parseDouble(checkUpRecord.getHeightInches()), totalHeightInInches=0, totalWeightInPounds=Integer.parseInt(checkUpRecord.getWeight());
        
        feetToInches = feet*12;
        totalHeightInInches = feetToInches + inches;
        return Double.toString(round((totalWeightInPounds/(totalHeightInInches*totalHeightInInches))*703, 2, BigDecimal.ROUND_HALF_UP));
	}
	
	private String getBSA(CheckUpRecord checkUpRecord) {
		double feet=Double.parseDouble(checkUpRecord.getHeightFeet()), feetToInches=0, 
				initialInches=Double.parseDouble(checkUpRecord.getHeightInches()), 
				height=0, weight=Double.parseDouble(checkUpRecord.getWeight()), bsa=0; //height = inches weight = lbs
        
        feetToInches = feet*12;
        height = feetToInches + initialInches;
        bsa = Math.sqrt((height*weight)/3131);
        return Double.toString(round(bsa, 2, BigDecimal.ROUND_HALF_UP));
	}
	
	private double round(double unrounded, int precision, int roundingMode)
	{
	    BigDecimal bd = new BigDecimal(unrounded);
	    BigDecimal rounded = bd.setScale(precision, roundingMode);
	    return rounded.doubleValue();
	}

	
	/**
	 * additional features
	 * */
	private void putAllFormsDoneToday(CheckUpRecord checkUpRecord, Model model) {
		List<String> formsToday = new ArrayList<>();
		LocalDate date = checkUpRecord.getRevisionHistory().getDateCreated();
		
		if(basdaiDao.getFormByDate("BASDAI", date, checkUpRecord.getPatient()) != null) {
			formsToday.add("BASDAI");
		}
		if(checkupDao.getFormByDate("BASG", date, checkUpRecord.getPatient()) != null) {
			formsToday.add("BASG");
		}
		if(basfiDao.getFormByDate("BASFI", date, checkUpRecord.getPatient()) != null) {
			formsToday.add("BASFI");
		}
		if(damageDao.getFormByDate("DamageIndexSLE", date, checkUpRecord.getPatient()) != null) {
			formsToday.add("Damage Index SLE");
		}
		if(myopathyDao.getFormByDate("InflammatoryMyopathFlowSheet", date, checkUpRecord.getPatient()) != null) {
			formsToday.add("Inflammatory Myopathy Flow Sheet");
		}
		if(sleDao.getFormByDate("SLEFlowSheet", date, checkUpRecord.getPatient()) != null) {
			formsToday.add("SLE Flow Sheet");
		}
		if(ssDao.getFormByDate("SSFlowSheet", date, checkUpRecord.getPatient()) != null) {
			formsToday.add("SS Flow Sheet");
		}
		if(mexDao.getFormByDate("MEXSLEDAI", date, checkUpRecord.getPatient()) != null) {
			formsToday.add("MEX SLEDAI");
		}
		if(flareDao.getFormByDate("SLEFlare", date, checkUpRecord.getPatient()) != null) {
			formsToday.add("SLE Flare");
		}
		if(sledaiDao.getFormByDate("SLEDAIScore", date, checkUpRecord.getPatient()) != null) {
			formsToday.add("SLEDAI Score");
		}
		if(sledaaDao.getFormByDate("SLEDAACaseReportForm", date, checkUpRecord.getPatient()) != null) {
			formsToday.add("SLEDAA Case Report Form");
		}
		if(labDao.getFormByDate("LaboratoryRequest", date, checkUpRecord.getPatient()) != null) {
			formsToday.add("Laboratory Request Form");
		}
		
		model.addAttribute("physicalExamination", formsToday);
		
	}
	@Autowired
	private FormsDao<BASDAI> basdaiDao;
	@Autowired
	private FormsDao<BASG> basgDao;
	@Autowired
	private FormsDao<BASFI> basfiDao;
	@Autowired
	private FormsDao<DamageIndexSLE> damageDao;
	@Autowired
	private FormsDao<InflammatoryMyopathFlowSheet> myopathyDao;
	@Autowired
	private FormsDao<SLEFlowSheet> sleDao;
	@Autowired
	private FormsDao<SSFlowSheet> ssDao;
	@Autowired
	private FormsDao<LaboratoryRequest> labDao;
	@Autowired
	private FormsDao<MEXSLEDAI> mexDao;
	@Autowired
	private FormsDao<SLEFlare> flareDao;
	@Autowired
	private FormsDao<SLEDAIScore> sledaiDao;
	@Autowired
	private FormsDao<SLEDAACaseReportForm> sledaaDao;

}

