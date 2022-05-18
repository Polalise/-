package com.ch.daitso.dao;

import com.ch.daitso.model.Report;

public interface ReportDao {

	int addReport(Report report);

	int report_getMaxNum();

}
