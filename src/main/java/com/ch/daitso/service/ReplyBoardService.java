package com.ch.daitso.service;
import java.util.List;

import com.ch.daitso.model.ReplyBoard;
public interface ReplyBoardService {
	List<ReplyBoard> list(int bno);
	void insert(ReplyBoard rb);
	void update(ReplyBoard rb);
	void delete(ReplyBoard rb);

}