package com.ust.emr.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ust.emr.dao.MedicationsAndPrescriptionsDao;
import com.ust.emr.model.Medication;
import com.ust.emr.model.MedicationsAndPrescriptions;
import com.ust.emr.model.Patient;
import com.ust.emr.utilities.DataAccessException;

@Transactional(readOnly=false)
@Repository("medsDao")
public class MedicationsAndPrescriptionsDaoImpl implements
		MedicationsAndPrescriptionsDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addMedication(
			MedicationsAndPrescriptions medicationsAndPrescriptions) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(medicationsAndPrescriptions);
	}

	@Override
	public List<MedicationsAndPrescriptions> getAllMedsOfPatient(Patient patient) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from MedicationsAndPrescriptions m where m.patient.id = :id");
//		query.setParameter("name", name);
		sessionFactory.getCurrentSession().clear();
		query.setLong("id", patient.getId());
		@SuppressWarnings("unchecked")
		List<MedicationsAndPrescriptions> objects = (List<MedicationsAndPrescriptions>) query.list();
		
		if (objects.isEmpty()) {
			throw new DataAccessException("There are no Medications and Prescriptions in the system.");
		} else {
			return objects;
		}
	}

	@Override
	public MedicationsAndPrescriptions getMedsById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addMedicine(Medication meds) {
		Session session = sessionFactory.getCurrentSession();
		
		session.save(meds);
	}

}
