package com.ch.daitso.dao;

import java.util.List;

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

	@Override
	public int getTotal(Report report) {
		return sst.selectOne("reportns.getTotal",report);
	}

	@Override
	public List<Report> list(Report report) {
		return sst.selectList("reportns.list",report);
	}

	@Override
	public Report select(int report_num) {
		return sst.selectOne("reportns.select",report_num);
	}

	@Override
	public int update(Report report) {
		return sst.update("reportns.update",report);
	}

	@Override
	public int getTotal2(String id) {
		return sst.selectOne("reportns.getTotal2",id);
	}

	@Override
	public List<Report> list2(String id) {
		return sst.selectList("reportns.list2",id);
	}

//	@Override
//	public int getTotal2(String reporter_id) {
//		return sst.selectOne("reportns.getTotal2",reporter_id);
//	}
//
//	@Override
//	public List<Report> list2(String reporter_id) {
//		return sst.selectList("reportns.list2",reporter_id);
//	}
//
//	@Override
//	public int getTotal3(String criminal_id) {
//		return sst.selectOne("reportns.getTotal3",criminal_id);
//	}
//
//	@Override
//	public List<Report> list3(String criminal_id) {
//		return sst.selectList("reportns.list3",criminal_id);
//	}
}
