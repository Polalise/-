package com.ch.daitso.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.daitso.dao.ReplyBoardDao;
import com.ch.daitso.model.ReplyBoard;
@Service
public class ReplyBoardServiceImpl implements ReplyBoardService {
	@Autowired
	private ReplyBoardDao rbd;
	public List<ReplyBoard> list(int bno) {
		return rbd.list(bno);
	}
	public void insert(ReplyBoard rb) {
		rbd.insert(rb);		
	}
	public void update(ReplyBoard rb) {
		rbd.update(rb);
	}
	public void delete(ReplyBoard rb) {
		rbd.delete(rb);
	}

}