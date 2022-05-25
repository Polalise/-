package com.ch.daitso.dao;

import java.util.List;

import com.ch.daitso.model.Report;

public interface ReportDao {

	int addReport(Report report);

	int report_getMaxNum();

	int getTotal(Report report);

	List<Report> list(Report report);

	Report select(int report_num);

}
