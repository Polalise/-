package com.ch.daitso.service;

import java.util.List;

import com.ch.daitso.model.*;

public interface MypageService {

	List<Mypage> likeList(String id);

	List<Mypage> myBuyList(String id);

	List<Mypage> mySellList(String id);

	int myBuyCount(String id);

	int mySellCount(String id);

	int likeCount(String id);

	List<Product> likeListInfo(List<Mypage> likeList);


}
