package com.ust.emr.dao;

import java.util.List;

import com.ust.emr.model.Comment;
import com.ust.emr.utilities.DataAccessException;

public interface CommentsDao {

	void saveComment(Comment comment);
	void updateComment(Comment comment);
	List<Comment> getAllCommentsByUser(String user) throws DataAccessException;
	Comment getCommentById(long id);
//	Comment getLatestCommentAdded() throws DataAccessException;
	Comment getLatestCommentAdded(String user, String module, String func)
			throws DataAccessException;
}
