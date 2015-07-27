package com.ust.emr.utilities;

import java.util.ArrayList;
import java.util.List;

import com.ust.emr.model.history.HistoryUpdate;

public class HistoUpdateOfPatientReport {
	public List<HistoryUpdate> histoUpdates = new ArrayList<>();
	public int count;
	public int month;

	public List<HistoryUpdate> getHistoUpdates() {
		return histoUpdates;
	}

	public int getCount() {
		return count;
	}

	public void setHistoUpdates(List<HistoryUpdate> histoUpdates) {
		this.histoUpdates = histoUpdates;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	@Override
	public String toString() {
		return "HistoUpdateOfPatientReport [histoUpdates=" + histoUpdates
				+ ", count=" + count + ", month=" + month + "]";
	}
	
	

}
