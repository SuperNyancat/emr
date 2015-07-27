package com.ust.emr.dao;

import com.ust.emr.model.RevisionHistory;

public interface RevisionHistoryDao {
	
	void saveHistory(RevisionHistory revisionHistory);
	void updateHistory(RevisionHistory history);
	
	RevisionHistory getRevisionHistoryById(Long id);
}
