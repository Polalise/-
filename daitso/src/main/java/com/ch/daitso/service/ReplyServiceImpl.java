package com.ch.daitso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.daitso.dao.ReplyDao;
import com.ch.daitso.model.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDao rd;

	@Override
	public int getMaxNum() {
		return rd.getMaxNum();
	}

	@Override
	public int insert(Reply board) {
		return rd.insert(board);
	}

	@Override
	public List<Reply> list(String id) {
		return rd.list(id);
	}

	@Override
	public void delete(Reply rb) {
		rd.delete(rb);
	}

	@Override
	public void update(Reply rb) {
		rd.update(rb);
	}

}
