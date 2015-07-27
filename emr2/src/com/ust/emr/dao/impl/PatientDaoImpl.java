package com.ust.emr.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ust.emr.dao.DoctorDao;
import com.ust.emr.dao.PatientDao;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Nurse;
import com.ust.emr.model.Patient;
import com.ust.emr.utilities.DataAccessException;

@Transactional
@Repository("patientDao")
public class PatientDaoImpl implements PatientDao{
	@Autowired
	private DoctorDao doctorDao;
	
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public void createPatientOfDoctor(Doctor doctor, Patient patient) {
		//TODO check if existing
		Session session = sessionFactory.getCurrentSession();
		session.save(patient);
	}

	@Override
	public Patient getPatientById(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Patient p where p.id = :id");
		query.setLong("id", id);
		Patient patient = (Patient) query.uniqueResult();
		return patient;
	}

	@Override
	public Patient getPatientByEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Patient where personInfo.email = :email");
		query.setParameter("email", email);
		Patient patient = (Patient) query.uniqueResult();
		return patient;
	}

	@Override
	public List<Patient> searchPatients(String name) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();		
		String hql = "from Patient d where d.enabled = '1' AND (d.personInfo.firstName LIKE '%" + name + "%' OR d.personInfo.lastName LIKE '%" + name + "%')";
		
		Query query = session.createQuery(hql);
		sessionFactory.getCurrentSession().clear();
		@SuppressWarnings("unchecked")
		List<Patient> patients = (List<Patient>) query.list();

		if (patients.isEmpty()) {
			throw new DataAccessException("There are no patients with that name.");
		} else {
			return patients;
		}
	}

	@Override
	public void update(Patient patient) {
		Session session = sessionFactory.getCurrentSession();
		session.update(patient);
	}

	@Override
	public void createPatient(Patient patient) {
		Session session = sessionFactory.getCurrentSession();
		session.save(patient);
	}

	
	

}
