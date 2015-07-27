package com.ust.emr.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ust.emr.dao.CommentsDao;
import com.ust.emr.model.Comment;
import com.ust.emr.model.Doctor;
import com.ust.emr.utilities.DataAccessException;

@Transactional(readOnly=false)
@Repository("commentsDao")
public class CommentsDaoImpl implements CommentsDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public void saveComment(Comment comment) {
		Session session = sessionFactory.getCurrentSession();
		session.save(comment);
	}

	@Override
	@Transactional(readOnly=true)
	public List<Comment> getAllCommentsByUser(String user) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Doctor d where user = :user";
		
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<Comment> comments = (List<Comment>) query.list();
		sessionFactory.getCurrentSession().clear();
		query.setParameter("user", user);
		
		if (comments.isEmpty()) {
			throw new DataAccessException("There are no comments in the system.");
		} else {
			return comments;
		}
	}

	@Override
	public void updateComment(Comment comment) {
		Session session = sessionFactory.getCurrentSession();
		session.update(comment);
	}

	@Override
	public Comment getCommentById(long id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Comment where id = :id");
		query.setLong("id", id);
		
		Comment c = (Comment) query.uniqueResult();		
		return c;
	}

	@Override
	public Comment getLatestCommentAdded(String user, String module, String func) throws DataAccessException {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Comment c where c.user=:user AND c.module like '" + module + 
				"%' AND c.function=:function ORDER BY c.timestamp DESC");
		query.setParameter("user", user);
		query.setParameter("function", func);
		
		@SuppressWarnings("unchecked")
		List<Comment> comments = (List<Comment>) query.list();
		
		if (comments.isEmpty()) {
			throw new DataAccessException("There are no comments in the system.");
		} else {
			return comments.get(0);
		}
	}

}
