package com.ch.daitso.dao;

import java.util.List;

import com.ch.daitso.model.NoticeBoard;


public interface NoticeDao {

	int getTotal(NoticeBoard board);

	List<NoticeBoard> list(NoticeBoard board);

	int getMaxNum();

	int insert(NoticeBoard board);



	void updateReadCount(int num);

	NoticeBoard select(int num);



	int update(NoticeBoard board);

	int delete(int num);



	int getNoticeCount();

}
