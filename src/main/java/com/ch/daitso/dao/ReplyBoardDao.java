package com.ch.daitso.dao;
import java.util.List;

import com.ch.daitso.model.ReplyBoard;
public interface ReplyBoardDao {
	List<ReplyBoard> list(int bno);
	void insert(ReplyBoard rb);
	void update(ReplyBoard rb);
	void delete(ReplyBoard rb);
}