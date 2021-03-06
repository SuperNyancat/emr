package com.ust.emr.dao.impl;

import java.util.List;

import org.apache.commons.collections.functors.FalsePredicate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Patient;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;

@Transactional(readOnly=false)
@Repository("doctorDao")
public class DoctorDaoImpl implements DoctorDao {
	@Autowired
	private UserDao userDao;
	
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	
	@Override
	@Transactional(readOnly=true)
	public Doctor getDoctorByUser(User user) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		Query searchUserTable = session.createQuery("from Doctor doc where doc.user.id=:userId");
		searchUserTable.setParameter("userId", user.getId());
		sessionFactory.getCurrentSession().clear();
		Doctor doctor = (Doctor) searchUserTable.uniqueResult();
		if(doctor == null) {
			throw new DataAccessException("null");
		}
		return doctor;
	}
	

	@Override
	public void createDoctor(Doctor doctor) {
		//TODO check if existing
		Session session = sessionFactory.getCurrentSession();
		session.save(doctor);
	}

	@Override
	@Transactional(readOnly=true)
	public Doctor getDoctorByUsername(String username) throws DataAccessException {
		User loggedInUser = userDao.findUserByUsername(username);
		return getDoctorByUser(loggedInUser);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Patient> getPatientsOfDoctor(Doctor doctor) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Patient p WHERE p.enabled = '1' AND (p.currentDoctor.id= :id OR p.previousDoctor.id=:id)");
		query.setParameter("id", doctor.getId());
		@SuppressWarnings("unchecked")
		List<Patient> patients = (List<Patient>) query.list();
		sessionFactory.getCurrentSession().clear();
		if (patients.isEmpty()) {
			throw new DataAccessException("You currently have no patients.");
		} else {
			return patients;
		}
	}

	@Override
	@Transactional(readOnly=true)
	public List<Doctor> getAllEnabledDoctors() throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Doctor d WHERE d.user.enabled = '1'");
		@SuppressWarnings("unchecked")
		List<Doctor> doctors = (List<Doctor>) query.list();
		sessionFactory.getCurrentSession().clear();
		if (doctors.isEmpty()) {
			throw new DataAccessException("There are no doctors in the system.");
		} else {
			return doctors;
		}
	}

	@Override
	@Transactional(readOnly=true)
	public Doctor getDoctorById(Long doctorId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Doctor where id = :doctorId");
		query.setLong("doctorId", doctorId);
		
		Doctor doctor = (Doctor) query.uniqueResult();		
		return doctor;
	}

	@Override
	public void updateDoctor(Doctor doctor) {
		Session session = sessionFactory.getCurrentSession();
		session.update(doctor);
		
	}

	@Override
	@Transactional(readOnly=true)
	public List<Doctor> getDoctorsOrderedBySpecialization() throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Doctor d ORDER BY d.specialization";
		
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Doctor> doctors = (List<Doctor>) query.list();
		sessionFactory.getCurrentSession().clear();
		if (doctors.isEmpty()) {
			throw new DataAccessException("There are no doctors in the system.");
		} else {
			return doctors;
		}
	}

	@Override
	@Transactional(readOnly=true)
	public List<Doctor> getDoctorsBySpecialization(String specialization) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Doctor d where d.specialization=:s";
		
		Query query = session.createQuery(hql);
		sessionFactory.getCurrentSession().clear();
		query.setParameter("s", specialization);
		@SuppressWarnings("unchecked")
		List<Doctor> doctors = (List<Doctor>) query.list();
		
		if (doctors.isEmpty()) {
			throw new DataAccessException("There are no doctors in the system.");
		} else {
			return doctors;
		}
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<Patient> getDisabledPatients(Doctor doctor) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Patient p WHERE p.enabled = '0' AND (p.currentDoctor.id= :id OR p.previousDoctor.id=:id)");
		query.setParameter("id", doctor.getId());
		@SuppressWarnings("unchecked")
		List<Patient> patients = (List<Patient>) query.list();
		sessionFactory.getCurrentSession().clear();
		
		if (patients.isEmpty()) {
			throw new DataAccessException("You currently have no disabled patients.");
		} else {
			return patients;
		}
	}
	
}
