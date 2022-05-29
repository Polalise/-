package com.ch.daitso.dao;

import java.util.List;

import com.ch.daitso.model.Reply;

public interface ReplyDao {

	int getMaxNum();

	int insert(Reply board);

	List<Reply> list(String id);

	void delete(Reply rb);

	void update(Reply rb);

	Reply selectReview(int p_num);

}
