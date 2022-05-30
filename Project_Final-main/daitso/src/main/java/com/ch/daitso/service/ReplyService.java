package com.ch.daitso.service;

import java.util.List;

import com.ch.daitso.model.Reply;

public interface ReplyService {

	int getMaxNum();

	int insert(Reply board);

	List<Reply> list(String id);

	void delete(Reply rb);

	void update(Reply rb);

}
