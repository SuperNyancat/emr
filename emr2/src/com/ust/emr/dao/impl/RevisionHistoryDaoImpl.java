package com.ust.emr.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ust.emr.dao.RevisionHistoryDao;
import com.ust.emr.model.RevisionHistory;
@Transactional(readOnly=false)
@Repository("revisionHistoryDao")
public class RevisionHistoryDaoImpl implements RevisionHistoryDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public void saveHistory(RevisionHistory revisionHistory) {
		Session session = sessionFactory.getCurrentSession();
		session.save(revisionHistory);
	}

	@Override
	public RevisionHistory getRevisionHistoryById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHistory(RevisionHistory history) {
		Session session = sessionFactory.getCurrentSession();
		session.update(history);
	}

}
