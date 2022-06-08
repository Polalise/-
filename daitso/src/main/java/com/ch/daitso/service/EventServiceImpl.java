package com.ch.daitso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.daitso.dao.EventDao;
import com.ch.daitso.model.EventBoard;

@Service
public class EventServiceImpl implements EventService {
   @Autowired 
   private EventDao ed;

@Override
public int getTotal(EventBoard board) {
	return ed.getTotal(board);
}

@Override
public List<EventBoard> list(EventBoard board) {
	return ed.list(board);
}

@Override
public int getMaxNum() {
	return ed.getMaxNum();
}

@Override
public int insert(EventBoard board) {
	return ed.insert(board);
}

@Override
public void updateReadCount(int e_num) {
	ed.updateReadCount(e_num);
	
}

@Override
public EventBoard select(int e_num) {
	return ed.select(e_num);
}

@Override
public int update(EventBoard board) {
	return ed.update(board);
}

@Override
public int delete(int e_num) {
	return ed.delete(e_num);
}

@Override
public int getEventCount() {
	return ed.getEventCount();
}

@Override
public List<EventBoard> list2() {
	return ed.list2();
}
}
