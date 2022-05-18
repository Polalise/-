package com.ch.daitso.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.daitso.model.Report;

@Repository
public class ReportDaoImpl implements ReportDao{
	
	@Autowired
	private SqlSessionTemplate sst;

	public int addReport(Report report) {
		return sst.insert("reportns.insert",report);
	}

	public int report_getMaxNum() {
		return sst.selectOne("reportns.report_getMaxNum");
	}
}
