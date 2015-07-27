package com.ust.emr.controller.admin;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.ArchiveForm;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Image;
import com.ust.emr.model.Nurse;
import com.ust.emr.model.Patient;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Controller
public class UploadProfilePictureController {
	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private NurseDao nurseDao;
	
	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private FormsDao<Image> imageDao;

	
	@RequestMapping("/upload_prof_pic_assembler.it")
	public String uploadAssembler(Model model, HttpSession session, @RequestParam("id") long id, @RequestParam("key") String key) {
		System.err.println("upload profile picture assembler");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		try {
			User user = userDao.findUserByUsername(username);
			if(key.equalsIgnoreCase("p")) {
				if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
					model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
				} else if(user.getRole().getRoleType().equalsIgnoreCase("nurse")) {
					model.addAttribute("nurse", nurseDao.getNurseByUser(user));
				}
				model.addAttribute("patient", patientDao.getPatientById(id));
			} else {
				if(key.equalsIgnoreCase("d")) {
					model.addAttribute("doctor", doctorDao.getDoctorById(id));
				} else if (key.equalsIgnoreCase("n")) {
					model.addAttribute("nurse", nurseDao.getNurseById(id));
				}
				model.addAttribute("adminUser", user);
			}
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("form", new ArchiveForm());
		return "ProfilePicture/upload-pic";
	}

	@RequestMapping(value = "/upload_photo.it")
	public String uploadPhoto(HttpSession session, HttpServletRequest request, Model model, @ModelAttribute("form") ArchiveForm form, @RequestParam("id") long id, @RequestParam("key") String key) {
		System.err.println("uplaod profile photo");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
	
//		Patient patient  = null;
		try {
			User user = userDao.findUserByUsername(username);
//			patient = patientDao.getPatientById(id);
//			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
				
			MultipartFile file = form.getImages().get(0);
			
			String absolutePath = null;
			String relativePath = null;
			InputStream inputStream = null;
			OutputStream outputStream = null;
			
			if (file.getSize() > 0) {
				inputStream = file.getInputStream();
				if (file.getSize() > 100000) {
					System.out.println("File Size:::" + file.getSize());
					return "redirect:/upload_prof_pic_assembler?id=" + id + "&key=" + key;
				}
				
				System.out.println("size::" + file.getSize());
				relativePath = "images/profilepic/" + file.getOriginalFilename();
				absolutePath = request.getSession().getServletContext().getRealPath("") + "/" + relativePath;
				outputStream = new FileOutputStream(absolutePath);
				System.out.println("fileName:" + file.getOriginalFilename());

				int readBytes = 0;
				byte[] buffer = new byte[100000];
				while ((readBytes = inputStream.read(buffer, 0, 100000)) != -1) {
					outputStream.write(buffer, 0, readBytes);
				}
				outputStream.close();
				inputStream.close();
				
			}			
			
			// users
			if(user.getRole().getRoleType().equalsIgnoreCase("administrator")) {
				model.addAttribute("adminUser", user);
				
				if(key.equalsIgnoreCase("d")) {
					Doctor doctor = doctorDao.getDoctorById(id);
					doctor.setRelativePath(relativePath);
					doctor.setFileName(file.getOriginalFilename());
					doctor.setId(id);
					doctorDao.updateDoctor(doctor);
					
					return "redirect:/view_doctor_profile.it?id=" + doctor.getId();
				} else if(key.equalsIgnoreCase("n")) {
					System.err.println("nurse upload pic");
					Nurse nurse = nurseDao.getNurseById(id);
					nurse.setRelativePath(relativePath);
					nurse.setFileName(file.getOriginalFilename());
					nurse.setId(id);
					nurseDao.updateNurse(nurse);
					
					return "redirect:/view_nurse_profile.it?id=" + nurse.getId();
				}		
				
			}
			else {
				Patient patient = patientDao.getPatientById(id);
				if(user.getRole().getRoleType().equalsIgnoreCase("doctor")) {
					Doctor doctor = doctorDao.getDoctorByUser(user);
					patient.setRelativePath(relativePath);
					patient.setFileName(file.getOriginalFilename());
					patientDao.update(patient);
					model.addAttribute("doctor", doctor);
					model.addAttribute("patient", patient);
					
				} else if (user.getRole().getRoleType().equalsIgnoreCase("nurse")) {
					Nurse nurse = nurseDao.getNurseByUser(user);
					patient.setRelativePath(relativePath);
					patient.setFileName(file.getOriginalFilename());
					patientDao.update(patient);
					model.addAttribute("patient", patient);					
					model.addAttribute("nurse", nurse);
				}
				
				return "redirect:/view_patient_profile.it?id=" + patient.getId();
			}

		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return "";
	}
	
	@RequestMapping(value = "/patient_dp.it")
	public String uploadPatientDP(HttpSession session, HttpServletRequest request, Model model, @ModelAttribute("form") ArchiveForm form, @RequestParam("id") long id, @RequestParam("key") String key) {
		System.err.println("patient dp");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		
		Patient patient = null;	
		
		try {
			patient = patientDao.getPatientById(id);
			MultipartFile file = form.getImages().get(0);			
			String absolutePath = null;
			String relativePath = null;
			InputStream inputStream = null;
			OutputStream outputStream = null;
			String fileName_Original = null;
			if (file.getSize() > 0) {
				inputStream = file.getInputStream();
				if (file.getSize() > 100000) {
					System.out.println("File Size:::" + file.getSize());
					return "redirect:/upload_prof_pic_assembler?id=" + id + "&key=" + key;
				}
				fileName_Original = file.getOriginalFilename();
				System.out.println("size::" + file.getSize());
				relativePath = fileName_Original;
				absolutePath = request.getSession().getServletContext().getRealPath("") + "/" + relativePath;
				outputStream = new FileOutputStream(absolutePath);
				System.out.println("fileName:" + file.getOriginalFilename());

				int readBytes = 0;
				byte[] buffer = new byte[100000];
				while ((readBytes = inputStream.read(buffer, 0, 100000)) != -1) {
					outputStream.write(buffer, 0, readBytes);
				}
				outputStream.close();
				inputStream.close();
				
			} 		
			
			patient.setRelativePath(relativePath);
			patient.setFileName(fileName_Original);
			patientDao.update(patient);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return "redirect:/view_patient_profile.it?id=" + patient.getId();
	}
}
