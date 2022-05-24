package com.ch.daitso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.daitso.dao.MypageDao;
import com.ch.daitso.model.*;

@Service
public class MyPageServiceImpl implements MypageService{
	@Autowired
	private MypageDao myd;

	public List<Mypage> likeList(String id) {
		return myd.likeList(id);
	}

	public List<Mypage> myBuyList(String id) {
		return myd.myBuyList(id);
	}

	public List<Mypage> mySellList(String id) {
		return myd.mySellList(id);
	}

	public int myBuyCount(String id) {
		return myd.myBuyCount(id);
	}

	public int mySellCount(String id) {
		return myd.mySellCount(id);
	}

	public int likeCount(String id) {
		return myd.likeCount(id);
	}

}
