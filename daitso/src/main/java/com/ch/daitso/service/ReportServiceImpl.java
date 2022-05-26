package com.ch.daitso.service;

import java.util.List;

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
	@Override
	public int getTotal(Report report) {
		return rd.getTotal(report);
	}
	@Override
	public List<Report> list(Report report) {
		return rd.list(report);
	}
	@Override
	public Report select(int report_num) {
		return rd.select(report_num);
	}
	@Override
	public int update(Report report) {
		return rd.update(report);
	}
}
