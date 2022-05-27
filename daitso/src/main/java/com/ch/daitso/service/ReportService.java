package com.ch.daitso.service;

import java.util.List;

import com.ch.daitso.model.Report;

public interface ReportService {

	int addReport(Report report);

	int report_getMaxNum();

	//총 글수 구하기
	int getTotal(Report report);
    //신고 내역리스트 가져오기 (관리자)
	List<Report> list(Report report);
    //상세보기 
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
