package com.ust.emr.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.joda.time.LocalDate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ust.emr.dao.FormsDao;
import com.ust.emr.model.Archives;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Patient;
import com.ust.emr.utilities.DataAccessException;

@Transactional(readOnly=false)
@Repository("formsDao")
public class FormsDaoImpl<T> implements FormsDao<T> {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void createForm(T object) {
		Session session = sessionFactory.getCurrentSession();
		session.save(object);
	}

	@Override
	public void updateForm(T object) {
		Session session = sessionFactory.getCurrentSession();
		session.update(object);
	}

	@Override
	public List<T> getAllForms(String name, Patient patient) throws DataAccessException {
		return getFormsDescending(name, patient);
	}
	@Override
	public List<T> getAllFormsAscending(String name, Patient patient) throws DataAccessException {
		return getFormsAscending(name, patient);
	}
	
	protected List<T> getFormsDescending(String name, Patient patient) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + name + " f WHERE f.patient.id = :id ORDER BY f.revisionHistory.dateCreated DESC";
		Query query = session.createQuery(hql);
		sessionFactory.getCurrentSession().clear();
		query.setLong("id", patient.getId());
		@SuppressWarnings("unchecked")
		List<T> objects = (List<T>) query.list();
		
		if (objects.isEmpty()) {
			throw new DataAccessException("There are no " + name + " forms in the system.");
		} else {
			return objects;
		}
	}
	protected List<T> getFormsAscending(String name, Patient patient) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + name + " f WHERE f.patient.id = :id ORDER BY f.revisionHistory.dateCreated ASC";
		Query query = session.createQuery(hql);
		sessionFactory.getCurrentSession().clear();
		query.setLong("id", patient.getId());
		@SuppressWarnings("unchecked")
		List<T> objects = (List<T>) query.list();
		
		if (objects.isEmpty()) {
			throw new DataAccessException("There are no " + name + " forms in the system.");
		} else {
			return objects;
		}
	}
	

	@Override
	public List<T> getFormsByDate(String name, LocalDate date) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + name + " n where n.revisionHistory.dateCreated = :date ";
		Query query = session.createQuery(hql);
		query.setParameter("date", date);
		@SuppressWarnings("unchecked")
		List<T> objects = (List<T>) query.list();
		
		if (objects.isEmpty()) {
			throw new DataAccessException("There are no " + name + " forms in the system on that day.");
		} else {
			return objects;
		}
	}
	
	

	@Override
	public T getFormById(String name, Long id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + name + " n where n.id = :id";
		Query query = session.createQuery(hql);
		query.setLong("id", id);
		@SuppressWarnings("unchecked")
		T object =  (T) query.uniqueResult();
		return object;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getPreviousTwo(String entityName, Patient patient) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + entityName + " f where f.patient.id=:id ORDER BY f.revisionHistory.dateCreated DESC";
		Query query = session.createQuery(hql);
		query.setLong("id", patient.getId());
		query.setMaxResults(3);
		
		List<T> objects = (List<T>) query.list();
		if (objects.isEmpty()) {
			throw new DataAccessException("There are no " + entityName + " forms in the system.");
		} else {
			return objects;
		}
	}

	
	@Override
	public List<T> getAllImagesInArchive(String name, Archives archives) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + name + " f WHERE f.archives.id = :id";
		Query query = session.createQuery(hql);
		sessionFactory.getCurrentSession().clear();
		query.setLong("id", archives.getId());
		
		@SuppressWarnings("unchecked")
		List<T> objects = (List<T>) query.list();
		
		if (objects.isEmpty()) {
			throw new DataAccessException("There are no " + name + " forms in the system.");
		} else {
			return objects;
		}
	}

	@Override
	public T getFormByPatient(String name, Patient patient) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + name + " n where n.patient.id = :id";
		Query query = session.createQuery(hql);
		query.setLong("id", patient.getId());
		@SuppressWarnings("unchecked")
		T object =  (T) query.uniqueResult();
		return object;
	}

	@Override
	public List<T> getLatestForms(String name, int max, Doctor doctor) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + name + " f WHERE doctor.id = :id ORDER BY f.date DESC";
		Query query = session.createQuery(hql);
		query.setLong("id", doctor.getId());
		query.setMaxResults(max);
		
		@SuppressWarnings("unchecked")
		List<T> objects = (List<T>) query.list();
		
		if (objects.isEmpty()) {
			throw new DataAccessException("There are no " + name + " forms in the system.");
		} else {
			return objects;
		}
	}

	@Override
	public T getImageInArchive(String name, Archives archives) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + name + " f WHERE f.archives.id = :id";
		Query query = session.createQuery(hql);
		sessionFactory.getCurrentSession().clear();
		query.setLong("id", archives.getId());
		
		@SuppressWarnings("unchecked")
		T object =  (T) query.uniqueResult();
		return object;
	}

	@Override
	public T getFormByDate(String name, LocalDate date, Patient patient) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + name + " f where f.patient.id=:id AND f.revisionHistory.dateCreated=:date";
		Query query = session.createQuery(hql);
		query.setLong("id", patient.getId());
		query.setParameter("date", date);

		@SuppressWarnings("unchecked")
		T object =  (T) query.uniqueResult();
		return object;
	}

	@Override
	public void deleteForm(T object) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(object);
	}

	@Override
	public List<T> getImagesByFileName(String name, String fileName, Archives archive) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + name + " f WHERE f.archives.id = :id AND f.filename like '%" + fileName + "%'";
		Query query = session.createQuery(hql);
		sessionFactory.getCurrentSession().clear();
		query.setLong("id", archive.getId());
		
		@SuppressWarnings("unchecked")
		List<T> objects = (List<T>) query.list();
		
		if (objects.isEmpty()) {
			throw new DataAccessException("There are no images of the name \"" + fileName + "\" in the system.");
		} else {
			return objects;
		}
	}

	@Override
	public List<T> getFormsByDateModified(String name, Patient patient, int year, int month)	throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + name + " n where n.patient.id = :id and (n.revisionHistory.dateModified >= :dateLower and n.revisionHistory.dateModified < :dateUpper)";
		Query query = session.createQuery(hql);
		query.setParameter("id", patient.getId());
		query.setParameter("dateLower", year+month+"01");
		query.setParameter("dateUpper", year+month+getLimitByMonth(month, year));
		@SuppressWarnings("unchecked")
		List<T> objects = (List<T>) query.list();
		
		if (objects.isEmpty()) {
			throw new DataAccessException("There are no " + name + " forms in the system on that day.");
		} else {			
			return objects;
		}
	}

	private int getLimitByMonth(int month, int year) {
		if(month == 9 && month == 4 && month == 6 && month == 11) {
			return 30;
		} else if(month == 2) {
			if(year % 2 == 0) {
				return 29;
			} else {
				return 28;
			}
		} else {
			return 31;
		}
	}

	@Override
	public T getFirstForm(String name, Patient patient) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + name + " f WHERE f.patient.id = :id ORDER BY f.revisionHistory.dateCreated ASC";
		Query query = session.createQuery(hql);
		sessionFactory.getCurrentSession().clear();
		query.setLong("id", patient.getId());
		@SuppressWarnings("unchecked")
		T object =  (T) query.uniqueResult();
		return object;
	}

}
