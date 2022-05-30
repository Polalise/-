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

	int changeStatus(Product product);
	
	int mySellCountN(String id);
	
	int mySellCountI(String id);
	
	int mySellCountY(String id);

	List<Reply> MyReviewListAll(String id);

	List<Reply> MyReviewListBuy(String id);

	List<Reply> MyReviewListSell(String id);

	void reviewInsertSuccess(int p_num);

}
