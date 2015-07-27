package com.ust.emr.controller.patient;

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

import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.RevisionHistoryDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;
import com.ust.emr.model.User;
import com.ust.emr.model.history.HistoryUpdate;
import com.ust.emr.model.history.InitialHistory;
import com.ust.emr.model.history.MedsUpdate;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class HistoryUpdateController {
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private NurseDao nurseDao;
	
	@Autowired
	private RevisionHistoryDao revisionHistoryDao;
	
	@Autowired
	private FormsDao<HistoryUpdate> histoDao;
	
	
	/**
	 * CREATE
	 * */
	@RequestMapping(value = "/uh_assemble.it")
	public String assembleForm(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("updated histo - assemble create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("patient", patientDao.getPatientById(id));
			addLoggedInUser(model,user);
		} catch (DataAccessException e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
		}
		model.addAttribute("form", new HistoryUpdate());
		return "patient/history/update-create";
	}
	
	@RequestMapping(value = "/uh_create.it", method = RequestMethod.POST)
	public String create(HttpSession session, Model model, @ModelAttribute("form") HistoryUpdate form, @RequestParam("id") long id) {
		System.err.println("update histo - create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		Patient patient = null;
		
		try {
			User user = userDao.findUserByUsername(username);
			patient = patientDao.getPatientById(id);
			
			RevisionHistory revisionHistory = new RevisionHistory(LocalDate.now(), user);
			revisionHistoryDao.saveHistory(revisionHistory);
			List<MedsUpdate> meds = validatedMeds(form);
			
			form.setRevisionHistory(revisionHistory);
			form.setMedsUpdates(meds);
			form.setPatient(patient);
			histoDao.createForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();			
		}
		
		
		return "redirect:/uh_view.it?pid=" + patient.getId() + "&fid=" + form.getId();
	}

	
	/**
	 * VIEW
	 * */
	@RequestMapping(value = "/uh_view.it")
	public String view(HttpSession session, Model model, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("update histo - view");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user = userDao.findUserByUsername(username);
			model.addAttribute("patient", patientDao.getPatientById(pid));
			addLoggedInUser(model, user);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		
		model.addAttribute("form", histoDao.getFormById("HistoryUpdate", fid));
		return "patient/history/update-view";
	}
	
	
	/**
	 * EDIT / UPDATE
	 * */
	@RequestMapping(value = "/uh_edit.it")
	public String edit(HttpSession session, Model model, @ModelAttribute("form") HistoryUpdate form) {
		System.err.println("updated histo - edit");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user =  userDao.findUserByUsername(username);
			model.addAttribute("patient", patientDao.getPatientById(form.getPatient().getId()));
			addLoggedInUser(model, user);
			model.addAttribute("form", histoDao.getFormById("HistoryUpdate", form.getId()));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		return "patient/history/update-edit";
	}
	
	@RequestMapping(value = "/uh_update.it", method = RequestMethod.POST)
	public String update(HttpSession session, Model model, @ModelAttribute("form") HistoryUpdate form, @RequestParam("pid") long pid, @RequestParam("fid") long fid) {
		System.err.println("updated histo - update");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		try {
			User user =  userDao.findUserByUsername(username);
			Patient patient = patientDao.getPatientById(pid);
			
			RevisionHistory revisionHistory = form.getRevisionHistory(); 
			revisionHistory.setDateModified(LocalDate.now());
			revisionHistory.setModifiedBy(user);
			List<MedsUpdate> meds = validatedMeds(form);
			
			form.setPatient(patient);
			form.setRevisionHistory(revisionHistory);
			form.setMedsUpdates(meds);
			histoDao.updateForm(form);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
			e.printStackTrace();
		}
		return "redirect:uh_view?pid=" + form.getPatient().getId() + "&fid=" + form.getId();
	}
			
	
	
	
	/**
	 * TABLE
	 * */
	@Autowired
	private FormsDao<InitialHistory> initDao;
	@RequestMapping("/uh_table.it")
	public String basfiTable(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("update histo table");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = null;
		try {
			User user = userDao.findUserByUsername(username);
			addLoggedInUser(model, user);
			patient = patientDao.getPatientById(id);
			model.addAttribute("patient", patient);
			List<HistoryUpdate> forms = histoDao.getAllForms("HistoryUpdate", patient);
			List<String> updates = getUpdatesFromForms(forms);
			model.addAttribute("uhForms", forms);
			model.addAttribute("updates", updates);
			
			model.addAttribute("initHisto", initDao.getFormByPatient("InitialHistory", patient));
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "patient/history/update-table";
	}
	
	
	
	private List<String> getUpdatesFromForms(List<HistoryUpdate> forms) {
		List<String> updates = new ArrayList<>();
		
		
		for(HistoryUpdate h : forms) {
			String update = "";
			
			if(h.getIllness().equalsIgnoreCase("yes")) {
				update += "New illness; ";
			}
			if(h.getHealthCare().equalsIgnoreCase("yes")) {
				update += "Seen healthcare providers; ";
			}
			if(h.getXrayLab().equalsIgnoreCase("yes")) {
				update += "Had x-ray, lab, or other procedures; ";
			}
			if(h.getFamilyHistoChange().equalsIgnoreCase("yes")) {
				update += "Changes in family history; ";
			}
			if(h.getSocialHistoChange().equalsIgnoreCase("yes")) {
				update += "Changes in social history; ";
			}
			if(h.getNewAllergies().equalsIgnoreCase("yes")) {
				update += "New allergies or reactions to medications; ";
			}
			if(h.getMedsChange().equalsIgnoreCase("yes")) {
				update += "Started/changed/stopped any medications; ";
			}
			updates.add(update);
		}
		
		return updates;
	}

	/**
	 * DELETE
	 * */
	@RequestMapping("/uh_delete.it")
	public String delete(HttpSession session, Model model, @ModelAttribute("form") HistoryUpdate form) {
		System.err.println("update histo - delete");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		long patientId = form.getPatient().getId();
		histoDao.deleteForm(form);
		
		return "redirect:/uh_table.it?id=" + patientId;
	}
	
	
	/**
	 * additional methods
	 * */
	
	private List<MedsUpdate> validatedMeds(HistoryUpdate form) {
		List<MedsUpdate> meds = new ArrayList<>();
		for(MedsUpdate u : form.getMedsUpdates()) {
			if(!u.getName().isEmpty() && !u.getStatus().isEmpty()) {
				meds.add(u);
			}
		}
		
		return meds;
	}
	private void addLoggedInUser(Model model, User user) throws DataAccessException {
		if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
		} else if(user.getRole().getRoleType().equalsIgnoreCase("nurse")) {
			model.addAttribute("nurse", nurseDao.getNurseByUser(user));
		}
	}
}
