package com.ch.daitso.dao;

import java.util.List;

import com.ch.daitso.model.*;

public interface MypageDao {

	List<Mypage> likeList(String id);

	List<Mypage> myBuyList(String id);

	List<Mypage> mySellList(String id);

	int myBuyCount(String id);

	int mySellCount(String id);

	int likeCount(String id);

}
