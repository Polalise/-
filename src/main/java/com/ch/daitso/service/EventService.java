package com.ch.daitso.service;

import java.util.List;

import com.ch.daitso.model.EventBoard;

public interface EventService {

	int getTotal(EventBoard board);

	List<EventBoard> list(EventBoard board);

	int getMaxNum();

	int insert(EventBoard board);

	void updateReadCount(int e_num);

	EventBoard select(int e_num);

	int update(EventBoard board);

	int delete(int e_num);

	int getEventCount();

}
