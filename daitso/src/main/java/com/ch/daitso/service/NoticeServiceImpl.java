package com.ch.daitso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.daitso.dao.NoticeDao;
import com.ch.daitso.model.NoticeBoard;


@Service
public class NoticeServiceImpl implements NoticeService {
   @Autowired
   private NoticeDao  nd;

@Override
public int getTotal(NoticeBoard board) {
	return nd.getTotal(board);
}

@Override
public List<NoticeBoard> list(NoticeBoard board) {
	return nd.list(board);
}

@Override
public int getMaxNum() {
	return nd.getMaxNum();
}

@Override
public int insert(NoticeBoard board) {
	return nd.insert(board);
}


@Override
public void updateReadCount(int num) {
	nd.updateReadCount(num);
	
}

@Override
public NoticeBoard select(int num) {
	return nd.select(num);
}


@Override
public int update(NoticeBoard board) {
	return nd.update(board);
}

@Override
public int delete(int num) {
	return nd.delete(num);
}


@Override
public int getNoticeCount() {
	return nd.getNoticeCount();
}

}
