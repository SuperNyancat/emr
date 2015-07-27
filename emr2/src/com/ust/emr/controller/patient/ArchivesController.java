package com.ust.emr.controller.patient;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.ust.emr.dao.CommentsDao;
import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.FormsDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.ArchiveForm;
import com.ust.emr.model.Archives;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Image;
import com.ust.emr.model.Patient;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;


@Controller
public class ArchivesController {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private FormsDao<Archives> archivesDao;
	
	@Autowired
	private FormsDao<Image> imageDao;
	
	@Autowired
	private CommentsDao commentsDao;
	
	/**
	 * CREATE
	 * */
	@RequestMapping("/archives_assembler.it")
	public String setUpUpload(HttpSession session, Model model, @RequestParam("id") long id) {
		System.err.println("archives - assembler");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "archives", "view");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
			try {
				User user = userDao.findUserByUsername(username);
				model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
				model.addAttribute("patient", patientDao.getPatientById(id));
				
				
				model.addAttribute("form", new ArchiveForm());
			} catch (DataAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return "patient/archives/archives-create";
	}
		
	@RequestMapping("create_archives.it")
	public String create(HttpSession session, HttpServletRequest request, Model model, @ModelAttribute("form") ArchiveForm form, @RequestParam("id") long id) {
		System.err.println("archives - create");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
	
		Patient patient  = null;
		try {
			User user = userDao.findUserByUsername(username);
			patient = patientDao.getPatientById(id);
			model.addAttribute("doctor", doctorDao.getDoctorByUser(user));
				
			List<MultipartFile> files = new ArrayList<>();
			for(CommonsMultipartFile f: form.getImages()) {
				if(f.getSize() > 0 && f.getOriginalFilename() != null ) {
					files.add(f);
				}
			}
			
			int size = 1000000;
			String[] absolutePath = new String[files.size()];
			String[] relativePath = new String[files.size()];
			InputStream inputStream = null;
			OutputStream outputStream = null;
			int i = 0;
			for(MultipartFile file : files) {
				if (file.getSize() > 0) {
					inputStream = file.getInputStream();
					if (file.getSize() > size) {
						System.out.println("File Size:::" + file.getSize());
						session.setAttribute("errorMessage", "File size must be less than 1000KB ");
						return "redirect:/archives_assembler.it?id=" + id;
					}
					
					System.out.println("size::" + file.getSize());
					relativePath[i] = file.getOriginalFilename();
					absolutePath[i] = request.getSession().getServletContext().getRealPath("") + "/" + relativePath[i];
					outputStream = new FileOutputStream(absolutePath[i]);
					System.out.println("fileName:" + file.getOriginalFilename());
	
					int readBytes = 0;
					byte[] buffer = new byte[size];
					while ((readBytes = inputStream.read(buffer, 0, size)) != -1) {
						outputStream.write(buffer, 0, readBytes);
					}
					outputStream.close();
					inputStream.close();
					i++;
				}
			}
			
			Archives archives = archivesDao.getFormByPatient("Archives", patient);
			 if(archives == null) {
				archives = new Archives();        
		        archives.setPatient(patient);
		        archivesDao.createForm(archives); 
			 } 
			 
			 for(int j = 0; j < files.size(); j++) {
				 Image image = new Image();
				 image.setFilename(files.get(j).getOriginalFilename());
				 image.setAbsolutePath(absolutePath[j]);
				 image.setRelativePath(relativePath[j]);
				 image.setArchives(archives);
				 imageDao.createForm(image);
			 }
			


		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/archives_table.it?id=" + patient.getId();
	}

	/**
	 * TABLE-LIKE DETAILS
	 * */
	@RequestMapping(value = "archives_table.it")
	public String viewArchives(HttpSession session, Model model, @RequestParam("id") long patientId) {
		System.err.println("Archives - TABLE");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "archives", "view");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		Patient patient = patientDao.getPatientById(patientId);
		try {
			model.addAttribute("doctor", doctorDao.getDoctorByUsername(username));
			model.addAttribute("patient", patient);
			Archives archives = archivesDao.getFormByPatient("Archives", patient);
			System.err.println(archives == null);
			if(archives == null) {
				return "redirect:/archives_assembler.it?id=" + patientId;
			}
			
			List<Image> images = imageDao.getAllImagesInArchive("Image", archives);
			model.addAttribute("images", images);
		} catch (DataAccessException e) {
			model.addAttribute("errorMessage", e.getMessage());
		}
		
		return "patient/archives/archives-view";
	}

	
	
/**
 * SEARCH
 * */
	@RequestMapping(value = "/search_archive.it")
	public String search(HttpSession session, Model model, @RequestParam("id") long patientId, @RequestParam("filename") String fileName) {
		System.err.println("Archives - search");
		String username = session.getAttribute("user").toString();
		session.setAttribute("user", username);
		/**
		 * COMMENTS // DELETE LATER
		 * */
		try {
			Comment comment = commentsDao.getLatestCommentAdded("doctor", "archives", "view");
			model.addAttribute("comment", comment);
		} catch (DataAccessException e1) {
			model.addAttribute("comment", new Comment());
		}
		/**
		 * end comment
		 * */
		Patient patient = patientDao.getPatientById(patientId);
		try {
			model.addAttribute("doctor", doctorDao.getDoctorByUsername(username));
			model.addAttribute("patient", patient);
			Archives archives = archivesDao.getFormByPatient("Archives", patient);
			
			if(archives == null) {
				return "redirect:/archives_assembler.it?id=" + patientId;
			}
			
			List<Image> images = imageDao.getImagesByFileName("Image", fileName, archives);
			model.addAttribute("images", images);
		} catch (DataAccessException e) {
			session.setAttribute("errorMessage", e.getMessage());
		}

		return "patient/archives/archives-view";
	}
	
}

