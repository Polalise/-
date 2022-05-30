package com.ch.daitso.dao;

import java.util.List;

import com.ch.daitso.model.Report;

public interface ReportDao {

	int addReport(Report report);

	int report_getMaxNum();

	int getTotal(Report report);

	List<Report> list(Report report);

	Report select(int report_num);

	int update(Report report);

//	//신고한사람
//	int getTotal2(String reporter_id);
//	List<Report> list2(String reporter_id);
//
//	//신고당한사람
//	int getTotal3(String criminal_id);
//	List<Report> list3(String criminal_id);

	int getTotal2(String id);

	List<Report> list2(String id);

}
