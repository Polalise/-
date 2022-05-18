package com.ch.daitso.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.daitso.dao.ReportDao;
import com.ch.daitso.model.Report;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDao rd;

	// 신고하기
	public int addReport(Report report) {
		return rd.addReport(report);
	}
	// 신고게시글 번호 자동증가
	public int report_getMaxNum() {
		return rd.report_getMaxNum();
	}
}
