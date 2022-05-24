package com.ch.daitso.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.daitso.model.ReplyBoard;
@Repository
public class ReplayBoardDaoImpl implements ReplyBoardDao {
	@Autowired
	private SqlSessionTemplate sst;
	public List<ReplyBoard> list(int bno) {
		return sst.selectList("rboardns.r_list", bno);
	}
	public void insert(ReplyBoard rb) {
		System.out.println("rb:" + rb);
		sst.insert("rboardns.insert", rb);		
	}
	public void update(ReplyBoard rb) {
		sst.update("rboardns.update", rb);
	}
	public void delete(ReplyBoard rb) {
		System.out.println("rb:" + rb);
		sst.update("rboardns.delete",rb);
	}
}