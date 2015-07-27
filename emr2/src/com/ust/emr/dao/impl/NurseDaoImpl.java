package com.ust.emr.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ust.emr.dao.NurseDao;
import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Nurse;
import com.ust.emr.model.Patient;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;
@Transactional(readOnly=false)
@Repository("nurseDao")
public class NurseDaoImpl implements NurseDao {
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
	public Nurse getNurseByUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		Query searchUserTable = session.createQuery("from Nurse where user.id = :userId");
		sessionFactory.getCurrentSession().clear();
		System.out.println(user.getId());
		searchUserTable.setParameter("userId", user.getId());
		Nurse nurse = (Nurse) searchUserTable.uniqueResult();
		if(nurse == null) {
			System.err.println("nurse is null");
		}
		return nurse;
	}

	@Override
	public void createNurse(Nurse nurse) {
		System.err.println("NurseDao - create nurse");
		Session session = sessionFactory.getCurrentSession();
		session.save(nurse);
	}

	@Override
	@Transactional(readOnly=true)
	public Nurse getNurseById(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Nurse where id = :id");
		sessionFactory.getCurrentSession().clear();
		query.setLong("id", id);
		
		Nurse nurse = (Nurse) query.uniqueResult();
		
		return nurse;
	}

	@Override
	public void updateNurse(Nurse nurse) {
		Session session = sessionFactory.getCurrentSession();
		session.update(nurse);
	}
	
	@Override
	public List<Patient> viewAllPatients() throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Patient");
		sessionFactory.getCurrentSession().clear();
		
		@SuppressWarnings("unchecked")
		List<Patient> patients = (List<Patient>) query.list();
		if (patients.isEmpty()) {
			throw new DataAccessException("There are no patients in the system!");
		} else {
			return patients;
		}
	}

}
