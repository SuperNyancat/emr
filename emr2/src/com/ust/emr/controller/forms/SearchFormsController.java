package com.ust.emr.controller.forms;

import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Doctor;
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
public class SearchFormsController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private NurseDao nurseDao;

	@Autowired
	private UserDao userDao;


	
	// BASDAI
	@Autowired
	private FormsDao<BASDAI> basdaiDao;
	
	@RequestMapping(value = "/search_basdai.it")
	public String searchBASDAI(HttpSession session, Model model, @RequestParam("month") String month, @RequestParam("day") String day,  @RequestParam("year") String year, @RequestParam("id") long id) {
		System.err.println("BASDAI - search");
		
		try {
			addCurrentLoggedInUser(session,model,id);
			if(year.equalsIgnoreCase("year") || month.length() > 2 || day.length() > 2) {
				throw new DataAccessException("Invalid format! Please try again");
			}
			
			String date = year+"-"+month+"-"+day;
			model.addAttribute("basdaiForms", basdaiDao.getFormsByDate("BASDAI", new LocalDate(date)));
		} catch (DataAccessException e) {
			session.setAttribute("errorSearch", e.getMessage());
		}
					
		return "forms/BASDAIForm/basdai-table";
	}
	
	
	
	// BASfi
	@Autowired
	private FormsDao<BASFI> basfiDao;
	
	@RequestMapping(value = "/search_basfi.it")
	public String searchBASFI(HttpSession session, Model model, @RequestParam("month") String month, @RequestParam("day") String day,  @RequestParam("year") String year, @RequestParam("id") long id) {
		System.err.println("BASFI - search");
		
		try {
			if(year.equalsIgnoreCase("year") || month.length() > 2 || day.length() > 2) {
				throw new DataAccessException("Invalid format! Please try again");
			}
			addCurrentLoggedInUser(session,model,id);
			String date = year+"-"+month+"-"+day;
			model.addAttribute("basfiForms", basfiDao.getFormsByDate("BASFI", new LocalDate(date)));
		} catch (DataAccessException e) {
			session.setAttribute("errorSearch", e.getMessage());
		}
					
		return "forms/BASFIForm/basfi-table";
	}
	
	
	
	//BASG
	@Autowired
	private FormsDao<BASG> basgDao;
	
	@RequestMapping(value = "/search_basg.it")
	public String searchBASG(HttpSession session, Model model, @RequestParam("month") String month, @RequestParam("day") String day,  @RequestParam("year") String year, @RequestParam("id") long id) {
		System.err.println("BASG - search");
		
		try {
			if(year.equalsIgnoreCase("year") || month.length() > 2 || day.length() > 2) {
				throw new DataAccessException("Invalid format! Please try again");
			}
			addCurrentLoggedInUser(session,model,id);
			String date = year+"-"+month+"-"+day;
			model.addAttribute("basgForms", basgDao.getFormsByDate("BASG", new LocalDate(date)));
		} catch (DataAccessException e) {
			session.setAttribute("errorSearch", e.getMessage());
		}
					
		return "forms/BASGForm/basg-table";
	}
	
	
	/**
	 * search
	 * */
	
	@Autowired
	private FormsDao<DamageIndexSLE> damageDao;
	
	@RequestMapping(value = "/search_damage_index_sle.it")
	public String searchDamageIndexSLE(HttpSession session, Model model, @RequestParam("month") String month, @RequestParam("day") String day,  @RequestParam("year") String year, @RequestParam("id") long id) {
		System.err.println("DamageIndexSLE - search");
		
		try {
			if(year.equalsIgnoreCase("year") || month.length() > 2 || day.length() > 2) {
				throw new DataAccessException("Invalid format! Please try again");
			}
			addCurrentLoggedInUser(session,model,id);
			String date = year+"-"+month+"-"+day;
			model.addAttribute("damageForms", damageDao.getFormsByDate("DamageIndexSLE", new LocalDate(date)));
		} catch (DataAccessException e) {
			session.setAttribute("errorSearch", e.getMessage());
		}
					
		return "forms/DamageIndexSLE/damage-table";
	}
	
	
	
	// Myopathy
	@Autowired
	private FormsDao<InflammatoryMyopathFlowSheet> myopathDao;
	
	@RequestMapping(value = "/search_inflammatory_myopath.it")
	public String searchInflammatoryMyopathFlowSheet(HttpSession session, Model model, @RequestParam("month") String month, @RequestParam("day") String day,  @RequestParam("year") String year, @RequestParam("id") long id) {
		System.err.println("InflammatoryMyopathFlowSheet - search");
		
		try {
			if(year.equalsIgnoreCase("year") || month.length() > 2 || day.length() > 2) {
				throw new DataAccessException("Invalid format! Please try again");
			}
			addCurrentLoggedInUser(session,model,id);
			String date = year+"-"+month+"-"+day;
			model.addAttribute("myopathForms", myopathDao.getFormsByDate("InflammatoryMyopathFlowSheet", new LocalDate(date)));
		} catch (DataAccessException e) {
			session.setAttribute("errorSearch", e.getMessage());
		}
					
		return "forms/FlowSheetInflammatoryMyopath/myopath-table";
	}
	
	
	//SLE flowsheeet
	@Autowired
	private FormsDao<SLEFlowSheet> sleDao;
	
	@RequestMapping(value = "/search_sle_flowsheet.it")
	public String searchSLEFlowSheet(HttpSession session, Model model, @RequestParam("month") String month, @RequestParam("day") String day,  @RequestParam("year") String year, @RequestParam("id") long id) {
		System.err.println("SLEFlowSheet - search");
		
		try {
			if(year.equalsIgnoreCase("year") || month.length() > 2 || day.length() > 2) {
				throw new DataAccessException("Invalid format! Please try again");
			}
			addCurrentLoggedInUser(session,model,id);
			String date = year+"-"+month+"-"+day;
			model.addAttribute("sleForms", sleDao.getFormsByDate("SLEFlowSheet", new LocalDate(date)));
		} catch (DataAccessException e) {
			session.setAttribute("errorSearch", e.getMessage());
		}
					
		return "forms/FlowSheetSLE/sle-table";
	}
	
	
	// SS flowsheet
	@Autowired
	private FormsDao<SSFlowSheet> ssDao;
	
	@RequestMapping(value = "/search_ss_flowsheet.it")
	public String searchSSFlowSheet(HttpSession session, Model model, @RequestParam("month") String month, @RequestParam("day") String day,  @RequestParam("year") String year, @RequestParam("id") long id) {
		System.err.println("SSFlowSheet - search");
		
		try {
			if(year.equalsIgnoreCase("year") || month.length() > 2 || day.length() > 2) {
				throw new DataAccessException("Invalid format! Please try again");
			}
			addCurrentLoggedInUser(session,model,id);
			String date = year+"-"+month+"-"+day;
			model.addAttribute("ssForms", ssDao.getFormsByDate("SSFlowSheet", new LocalDate(date)));
		} catch (DataAccessException e) {
			session.setAttribute("errorSearch", e.getMessage());
		}
					
		return "forms/FlowSheetSS/ss-table";
	}
	
	
	
	// Lab request
	@Autowired
	private FormsDao<LaboratoryRequest> labDao;
	
	@RequestMapping(value = "/search_lab_request.it")
	public String searchLaboratoryRequest(HttpSession session, Model model, @RequestParam("month") String month, @RequestParam("day") String day,  @RequestParam("year") String year, @RequestParam("id") long id) {
		System.err.println("InflammatoryMyopathFlowSheet - search");
		
		try {
			if(year.equalsIgnoreCase("year") || month.length() > 2 || day.length() > 2) {
				throw new DataAccessException("Invalid format! Please try again");
			}
			addCurrentLoggedInUser(session,model,id);
			String date = year+"-"+month+"-"+day;
			model.addAttribute("labForms", labDao.getFormsByDate("LaboratoryRequest", new LocalDate(date)));
		} catch (DataAccessException e) {
			session.setAttribute("errorSearch", e.getMessage());
		}
					
		return "forms/LabRequest/lab-table";
	}
	
	
	
	// mex sledai
	@Autowired
	private FormsDao<MEXSLEDAI> mexDao;
	
	@RequestMapping(value = "/search_mex_sledai.it")
	public String searchMEXSLEDAI(HttpSession session, Model model, @RequestParam("month") String month, @RequestParam("day") String day,  @RequestParam("year") String year, @RequestParam("id") long id) {
		System.err.println("InflammatoryMyopathFlowSheet - search");
		
		try {
			if(year.equalsIgnoreCase("year") || month.length() > 2 || day.length() > 2) {
				throw new DataAccessException("Invalid format! Please try again");
			}
			addCurrentLoggedInUser(session,model,id);
			String date = year+"-"+month+"-"+day;
			model.addAttribute("mexForms", mexDao.getFormsByDate("MEXSLEDAI", new LocalDate(date)));
		} catch (DataAccessException e) {
			session.setAttribute("errorSearch", e.getMessage());
		}
					
		return "forms/MEXSLEDAI/mex-table";
	}
	
	
	
	// sledaa
	@Autowired
	private FormsDao<SLEDAACaseReportForm> sledaaDao;
	
	@RequestMapping(value = "/search_sledaa_case_report.it")
	public String searchSLEDAACaseReportForm(HttpSession session, Model model, @RequestParam("month") String month, @RequestParam("day") String day,  @RequestParam("year") String year, @RequestParam("id") long id) {
		System.err.println("sledaa - search");
		
		try {
			if(year.equalsIgnoreCase("year") || month.length() > 2 || day.length() > 2) {
				throw new DataAccessException("Invalid format! Please try again");
			}
			addCurrentLoggedInUser(session,model,id);
			String date = year+"-"+month+"-"+day;
			model.addAttribute("sledaaForms", sledaaDao.getFormsByDate("SLEDAACaseReportForm", new LocalDate(date)));
		} catch (DataAccessException e) {
			session.setAttribute("errorSearch", e.getMessage());
		}
					
		return "forms/SLEDAACaseReportForm/sledaa-table";
	}
	
	
	
	//SLEDAIScore
	@Autowired
	private FormsDao<SLEDAIScore> sledaiDao;
	
	@RequestMapping(value = "/search_sledai_score.it")
	public String searchSLEDAIScore(HttpSession session, Model model, @RequestParam("month") String month, @RequestParam("day") String day,  @RequestParam("year") String year, @RequestParam("id") long id) {
		System.err.println("SLEDAIScore - search");
		
		try {
			if(year.equalsIgnoreCase("year") || month.length() > 2 || day.length() > 2) {
				throw new DataAccessException("Invalid format! Please try again");
			}
			addCurrentLoggedInUser(session,model,id);
			String date = year+"-"+month+"-"+day;
			model.addAttribute("sledaiForms", sledaiDao.getFormsByDate("SLEDAIScore", new LocalDate(date)));
		} catch (DataAccessException e) {
			session.setAttribute("errorSearch", e.getMessage());
		}
					
		return "forms/SLEDAIScore/sledai-table";
	}
	
	
	
	//SLEFlare
	@Autowired
	private FormsDao<SLEFlare> flareDao;
	
	@RequestMapping(value = "/search_sle_flare.it")
	public String searchSLEFlare(HttpSession session, Model model, @RequestParam("month") String month, @RequestParam("day") String day,  @RequestParam("year") String year, @RequestParam("id") long id) {
		System.err.println("SLEFlare - search");
		
		try {
			if(year.equalsIgnoreCase("year") || month.length() > 2 || day.length() > 2) {
				throw new DataAccessException("Invalid format! Please try again");
			}
			addCurrentLoggedInUser(session,model,id);
			String date = year+"-"+month+"-"+day;
			model.addAttribute("flareForms", flareDao.getFormsByDate("SLEFlare", new LocalDate(date)));
		} catch (DataAccessException e) {
			session.setAttribute("errorSearch", e.getMessage());
		}
					
		return "forms/SLEFlare/flare-table";
	}
	
	
	private void addCurrentLoggedInUser(HttpSession session, Model model, long id) throws DataAccessException {
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		Doctor doctor = doctorDao.getDoctorByUsername(username);
		model.addAttribute("doctor", doctor);
		model.addAttribute("patient", patientDao.getPatientById(id));
	}
}
