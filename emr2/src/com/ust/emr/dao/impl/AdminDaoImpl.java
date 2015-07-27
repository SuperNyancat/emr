package com.ust.emr.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ust.emr.dao.AdminDao;
import com.ust.emr.model.Disease;
import com.ust.emr.model.Doctor;
import com.ust.emr.model.Medicine;
import com.ust.emr.model.Nurse;
import com.ust.emr.utilities.DataAccessException;

@Transactional(readOnly=false)
@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	@Transactional(readOnly = true)
	public List<Doctor> getAllEnabledDoctors() throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Doctor d where d.user.enabled = '1'");
		sessionFactory.getCurrentSession().clear();
		@SuppressWarnings("unchecked")
		List<Doctor> doctors = (List<Doctor>) query.list();

		if (doctors.isEmpty()) {
			throw new DataAccessException("There are no doctors registered in the system.");
		} else {
			return doctors;
		}
	}

	@Override
	@Transactional(readOnly = true)
	public List<Nurse> getAllEnabledNurses() throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Nurse n where n.user.enabled='1'");
		sessionFactory.getCurrentSession().clear();
		
		@SuppressWarnings("unchecked")
		List<Nurse> nurses = (List<Nurse>) query.list();

		if (nurses.isEmpty()) {
			throw new DataAccessException("There are no nurses registered in the system.");
		} else {
			return nurses;
		}
	}

	@Override
	@Transactional(readOnly=true)
	public List<Doctor> searchDoctors(String string, String specialization) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();		
		String hql = "";
		
		if(string.length() == 0) {
			hql = "from Doctor d where d.user.enabled = '1' AND (d.specialization LIKE '%" + specialization + "%')";
		} else if (specialization.length() == 0) {
			hql = "from Doctor d where d.user.enabled = '1' AND (d.personInfo.firstName LIKE '%" + string + "%' OR d.personInfo.lastName LIKE '%" + string + "%')";
		} else {
			 hql = "from Doctor d where d.user.enabled = '1' AND (d.personInfo.firstName LIKE '%" + string + "%' OR d.personInfo.lastName LIKE '%" + string + 
						"%' AND d.specialization LIKE '%" + specialization + "%')";
		}
		
		Query query = session.createQuery(hql);
		sessionFactory.getCurrentSession().clear();
		@SuppressWarnings("unchecked")
		List<Doctor> doctors = (List<Doctor>) query.list();

		if (doctors.isEmpty()) {
			throw new DataAccessException("There are no doctors with that name.");
		} else {
			return doctors;
		}
	}

	@Override
	@Transactional(readOnly=true)
	public List<Nurse> searchNurses(String string) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();		
		String hql = "from Nurse d where d.personInfo.firstName LIKE '%" + string + "%' OR d.personInfo.lastName LIKE '%" + string + "%'";
		
		Query query = session.createQuery(hql);
		sessionFactory.getCurrentSession().clear();
		@SuppressWarnings("unchecked")
		List<Nurse> nurses = (List<Nurse>) query.list();

		if (nurses.isEmpty()) {
			throw new DataAccessException("There are no nurses with that name.");
		} else {
			return nurses;
		}

	}

	@Override
	public void AddMedicine(Medicine medicine) {
		Session session = sessionFactory.getCurrentSession();
		session.save(medicine);
	}

	@Override
	public void AddDisease(Disease disease) {
		Session session = sessionFactory.getCurrentSession();
		session.save(disease);
	}

	@Override
	@Transactional(readOnly=true)
	public Medicine getMedicineById(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Medicine where id = :id");
		sessionFactory.getCurrentSession().clear();
		query.setLong("id", id);
		
		Medicine medicine = (Medicine) query.uniqueResult();
		
		return medicine;
	}

	@Override
	@Transactional(readOnly=true)
	public Disease getDiseaseById(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Disease where id = :id");
		sessionFactory.getCurrentSession().clear();
		query.setLong("id", id);
		
		Disease disease = (Disease) query.uniqueResult();
		
		return disease;
	}

	@Override
	@Transactional(readOnly=true)
	public List<Medicine> getAllMedicines() throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Medicine");
		sessionFactory.getCurrentSession().clear();
		
//		query.setParameter("stat", 1);
		@SuppressWarnings("unchecked")
		List<Medicine> medicines= (List<Medicine>) query.list();

		if (medicines.isEmpty()) {
			throw new DataAccessException("There are no medicines registered in the system.");
		} else {
			return medicines;
		}
	}

	@Override
	@Transactional(readOnly=true)
	public List<Disease> getAllDiseases() throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Disease");
		sessionFactory.getCurrentSession().clear();
		
//		query.setParameter("stat", 1);
		@SuppressWarnings("unchecked")
		List<Disease> diseases= (List<Disease>) query.list();

		if (diseases.isEmpty()) {
			throw new DataAccessException("There are no diseases registered in the system.");
		} else {
			return diseases;
		}
	}

	@Override
	@Transactional(readOnly=true)
	public List<Disease> searchDisease(String name) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();		
		String hql = "from Disease d where d.name LIKE '%" + name + "%'";
		
		Query query = session.createQuery(hql);
		sessionFactory.getCurrentSession().clear();
		@SuppressWarnings("unchecked")
		List<Disease> diseases = (List<Disease>) query.list();

		if (diseases.isEmpty()) {
			throw new DataAccessException("There are no diseases with that name.");
		} else {
			return diseases;
		}
	}
	
		@Override
		@Transactional(readOnly=true)
		public List<Medicine> searchMedicine(String genericName, String brandName) throws DataAccessException {
			Session session = sessionFactory.getCurrentSession();		
			String hql = "";
			if((genericName.length() == 0 || genericName.equals("")) && brandName.length() != 0) {
				hql = "from Medicine d where d.brandName LIKE '%" + brandName + "%'";
			} else if(brandName.length() == 0 && genericName.length() != 0) {
				hql = "from Medicine d where d.genericName LIKE '%" + genericName + "%'";
			} else {
				hql = "from Medicine d where d.genericName LIKE '%" + genericName + "%' OR d.brandName LIKE '%" + brandName + "%'";
			}
			
			Query query = session.createQuery(hql);
			sessionFactory.getCurrentSession().clear();
			@SuppressWarnings("unchecked")
			List<Medicine> medicines = (List<Medicine>) query.list();

			if (medicines.isEmpty()) {
				throw new DataAccessException("There are no medicines with that name.");
			} else {
				return medicines;
			}
		}

		@Override
		public void updateDisease(Disease disease) {
			Session session = sessionFactory.getCurrentSession();
			session.update(disease);
		}

		@Override
		public void updateMedicine(Medicine medicine) {
			Session session = sessionFactory.getCurrentSession();
			session.update(medicine);
		}

		@Override
		@Transactional(readOnly = true)
		public List<Doctor> getAllDisabledDoctors() throws DataAccessException {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Doctor d where d.user.enabled = '0'");
			sessionFactory.getCurrentSession().clear();
			@SuppressWarnings("unchecked")
			List<Doctor> doctors = (List<Doctor>) query.list();

			if (doctors.isEmpty()) {
				throw new DataAccessException("There are no disabled doctors in the system.");
			} else {
				return doctors;
			}
		}

		@Override
		@Transactional(readOnly = true)
		public List<Nurse> getAllDisabledNurses() throws DataAccessException {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Nurse n where n.user.enabled='0'");
			sessionFactory.getCurrentSession().clear();
			
			@SuppressWarnings("unchecked")
			List<Nurse> nurses = (List<Nurse>) query.list();

			if (nurses.isEmpty()) {
				throw new DataAccessException("There are no disabled nurses in the system.");
			} else {
				return nurses;
			}
		}
	
}
