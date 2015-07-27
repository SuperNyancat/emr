package com.ust.emr.controller.forms;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Patient;
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
public class FormTabController {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private FormsDao<BASDAI> basdaiDao;
	
	@Autowired
	private CommentsDao commentsDao;
	
	@RequestMapping("/view_forms.it")
	public String viewFormsTab(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("VIEW FORMS TAB ASSEMBLER CONTROLLER");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "forms", "view");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		try {
			Doctor doctor = doctorDao.getDoctorByUsername(username);
			model.addAttribute("doctor", doctor);
			model.addAttribute("patient", patientDao.getPatientById(id));
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return "patient/form/view-form-tab";
	}
	
	
	
	
	/**
	 * FORM TABLES
	 * */
	
	// BASDAI
	@RequestMapping("/BASDAI_table.it")
	public String basdaiTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("basdai table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "basdai", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		
		Patient patient = null;
		try {
			Doctor doctor = doctorDao.getDoctorByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctor);
			model.addAttribute("patient", patient);
			model.addAttribute("basdaiForms", basdaiDao.getAllForms("BASDAI", patient));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/BASDAIForm/basdai-table";
	}
	
	
	@Autowired
	private FormsDao<BASFI> basfiDao;
	
	// BASFI 
	@RequestMapping("/BASFI_table.it")
	public String basfiTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("basfi table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);


		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "basfi", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		Patient patient = null;
		try {
			Doctor doctor = doctorDao.getDoctorByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctor);
			model.addAttribute("patient", patient);
			model.addAttribute("basfiForms", basfiDao.getAllForms("BASFI", patient));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/BASFIForm/basfi-table";
	}
	
	
	
	//BASG
	@Autowired
	private FormsDao<BASG> basgDao;
	
	@RequestMapping("/BASG_table.it")
	public String basgTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("basg table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "basg", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		
		Patient patient = null;
		try {
			Doctor doctor = doctorDao.getDoctorByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctor);
			model.addAttribute("patient", patient);
			model.addAttribute("basgForms", basgDao.getAllForms("BASG", patient));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/BASGForm/basg-table";
	}
	
	
	
	// SLEDAA
	@Autowired
	private FormsDao<SLEDAACaseReportForm> sledaaDao;
	@RequestMapping("/SLEDAA_table.it")
	public String sledaaTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("SLEDAA table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "sledaa", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		
		Patient patient = null;
		try {
			Doctor doctor = doctorDao.getDoctorByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctor);
			model.addAttribute("patient", patient);
			model.addAttribute("sledaaForms", sledaaDao.getAllForms("SLEDAACaseReportForm", patient));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/SLEDAACaseReportForm/sledaa-table";
	}
	
	
	
	// Flow sheet Myopath
	@Autowired
	private FormsDao<InflammatoryMyopathFlowSheet> myopathDao;
	
	@RequestMapping("/inflammatory_myopath_table.it")
	public String myopathTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("SLEDAA table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);


		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "myopathy", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		Patient patient = null;
		try {
			Doctor doctor = doctorDao.getDoctorByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctor);
			model.addAttribute("patient", patient);
			model.addAttribute("myopathForms", myopathDao.getAllForms("InflammatoryMyopathFlowSheet", patient));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/FlowSheetInflammatoryMyopath/myopath-table";
	}

	
	//Flow sheet SS
	@Autowired
	private FormsDao<SSFlowSheet> ssDao;
	
	@RequestMapping("/SS_flowsheet_table.it")
	public String ssTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("SSFlowSheet table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "ss", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		
		Patient patient = null;
		try {
			Doctor doctor = doctorDao.getDoctorByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctor);
			model.addAttribute("patient", patient);
			model.addAttribute("ssForms", ssDao.getAllForms("SSFlowSheet", patient));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/FlowSheetSS/ss-table";
	}

	
	
	//Flow sheet SLE
	@Autowired
	private FormsDao<SLEFlowSheet> sleDao;
	
	@RequestMapping("/SLE_flowsheet_table.it")
	public String sleTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("SLEFlowSheet table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);


		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "sle flow", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		Patient patient = null;
		try {
			Doctor doctor = doctorDao.getDoctorByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctor);
			model.addAttribute("patient", patient);
			model.addAttribute("sleForms", sleDao.getAllForms("SLEFlowSheet", patient));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/FlowSheetSLE/sle-table";
	}
	
	
	
	//Lab request
	@Autowired
	private FormsDao<LaboratoryRequest> labDao;
	
	@RequestMapping("/lab_request_table.it")
	public String labTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("LaboratoryRequest table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "lab", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		
		Patient patient = null;
		try {
			Doctor doctor = doctorDao.getDoctorByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctor);
			model.addAttribute("patient", patient);
			model.addAttribute("labForms", labDao.getAllForms("LaboratoryRequest", patient));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/LabRequest/lab-table";
	}
	
	
	
	// SLEDAI score
	@Autowired
	private FormsDao<SLEDAIScore> sledaiDao;
	
	@RequestMapping("/SLEDAI_score_table.it")
	public String sledaiTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("SLEDAIScore table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "sledai", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		
		Patient patient = null;
		try {
			Doctor doctor = doctorDao.getDoctorByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctor);
			model.addAttribute("patient", patient);
			model.addAttribute("sledaiForms", sledaiDao.getAllForms("SLEDAIScore", patient));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/SLEDAIScore/sledai-table";
	}
	
	// MEXSLEDAI score
	@Autowired
	private FormsDao<MEXSLEDAI> mexDao;
	
	@RequestMapping("/MEXSLEDAI_table.it")
	public String MEXSLEDAI(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("MEXSLEDAI table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "mex", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		
		Patient patient = null;
		try {
			Doctor doctor = doctorDao.getDoctorByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctor);
			model.addAttribute("patient", patient);
			model.addAttribute("mexForms", mexDao.getAllForms("MEXSLEDAI", patient));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/MEXSLEDAI/mex-table";
	}
	
	// SLEFLARE score
	@Autowired
	private FormsDao<SLEFlare> flareDao;
	
	@RequestMapping("/SLE_flare_table.it")
	public String SLEFlare(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("SLEFlare table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "flare", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		
		Patient patient = null;
		try {
			Doctor doctor = doctorDao.getDoctorByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctor);
			model.addAttribute("patient", patient);
			model.addAttribute("flareForms", flareDao.getAllForms("SLEFlare", patient));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/SLEFlare/flare-table";
	}
	
	
	// Damage index
	@Autowired
	private FormsDao<DamageIndexSLE> damageDao;
	
	@RequestMapping("/damage_index_SLE_table.it")
	public String DamageIndexSLE(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("DamageIndexSLE table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);

		
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "damage", "table");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		
		
		
		Patient patient = null;
		try {
			Doctor doctor = doctorDao.getDoctorByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctor);
			model.addAttribute("patient", patient);
			model.addAttribute("damageForms", damageDao.getAllForms("DamageIndexSLE", patient));
			
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "forms/DamageIndexSLE/damage-table";
	}
		
		
}
