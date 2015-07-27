package com.ust.emr.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ust.emr.dao.UserDao;
import com.ust.emr.model.Address;
import com.ust.emr.model.Role;
import com.ust.emr.model.User;
import com.ust.emr.utilities.DataAccessException;
@Transactional
@Repository("userDao")
public class UserDaoImpl implements UserDao {

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public User findUserByUsername(String username) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		
		Query searchUserTable = session.createQuery("from User where username=:username");
		searchUserTable.setParameter("username", username);
		sessionFactory.getCurrentSession().clear();
		User user = (User) searchUserTable.uniqueResult();
		if(user == null) {
			throw new DataAccessException("null");
		}
		return user;
	}

	@Override
	public void saveUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
	}

	@Override
	public void saveAddresses(List<Address> addresses) {
		Session session = sessionFactory.getCurrentSession();
		for(Address a: addresses) {
			session.save(a);
		}
	}

	@Override
	public Role getRoleByRoleType(String roleType) {
		Session session = sessionFactory.getCurrentSession();
		Query searchUserTable = session.createQuery("from Role where roleType=:role");
		searchUserTable.setParameter("role", roleType);
		sessionFactory.getCurrentSession().clear();
		Role role = (Role) searchUserTable.uniqueResult();
		if(role==null) {
			System.err.println("ROLE IS NULL");
		}
		return role;
	}

	@Override
	public User findUserById(Long id) {
		Session session = sessionFactory.getCurrentSession();
		
		Query searchUserTable = session.createQuery("from User where id=:id");
		searchUserTable.setParameter("id", id);
		sessionFactory.getCurrentSession().clear();
		User user = (User) searchUserTable.uniqueResult();
		return user;
	}

	@Override
	public void updateUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.update(user);
	}
	


}
