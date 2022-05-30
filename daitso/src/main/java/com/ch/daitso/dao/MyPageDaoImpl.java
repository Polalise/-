package com.ch.daitso.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.daitso.model.*;

@Repository
public class MyPageDaoImpl implements MypageDao{
	@Autowired
	private SqlSessionTemplate sst;
	
//	내 좋아요 리스트
	public List<Mypage> likeList(String id) {
		return sst.selectList("myPagens.likeList", id);
	}

//	내 구매 리스트
	public List<Mypage> myBuyList(String id) {
		return sst.selectList("myPagens.myBuyList", id);
	}

//	내 판매 리스트
	public List<Mypage> mySellList(String id) {
		return sst.selectList("myPagens.mySellList", id);
	}

//	내 좋아요 횟수
	public int likeCount(String id) {
		return sst.selectOne("myPagens.likeCount", id);
	}

//	내 구매 횟수
	public int myBuyCount(String id) {
		return sst.selectOne("myPagens.myBuyCount", id);
	}

	
//	내 판매 횟수
	public int mySellCount(String id) {
		return sst.selectOne("myPagens.mySellCount", id);
	}

	public int changeStatus(Product product) {
		return sst.update("myPagens.changeStatus", product);
	}

	public int mySellCountN(String id) {
		return sst.selectOne("myPagens.mySellCountN", id);
	}

	public int mySellCountI(String id) {
		return sst.selectOne("myPagens.mySellCountI", id);
	}

	public int mySellCountY(String id) {
		return sst.selectOne("myPagens.mySellCountY", id);
	}

	public List<Reply> MyReviewListAll(String id) {
		return sst.selectList("myPagens.MyReviewListAll", id);
	}

	public List<Reply> MyReviewListBuy(String id) {
		return sst.selectList("myPagens.MyReviewListBuy", id);
	}

	public List<Reply> MyReviewListSell(String id) {
		return sst.selectList("myPagens.MyReviewListSell", id);
	}

	public void reviewInsertSuccess(int p_num) {
		sst.update("myPagens.reviewInsertSuccess",p_num);
	}

}
