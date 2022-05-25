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

}
