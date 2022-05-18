package com.ch.daitso.dao;

import java.util.List;

import com.ch.daitso.model.Reply;

public interface ReplyDao {

	int getMaxNum();

	int insert(Reply board);

	List<Reply> list(int num);

	void delete(Reply rb);

	void update(Reply rb);

}
