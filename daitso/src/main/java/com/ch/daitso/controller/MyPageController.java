package com.ch.daitso.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.daitso.model.*;
import com.ch.daitso.service.*;
import com.ch.daitso.service.LikesService;
import com.ch.daitso.service.MemberService;
import com.ch.daitso.service.MypageService;
import com.ch.daitso.service.ProductService;

@Controller
public class MyPageController {
	@Autowired
	private MypageService mys;
	
	@Autowired
	private ProductService ps;
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private LikesService ls;
	
	@Autowired
	private ReplyService rs;
	
	@RequestMapping("myProfile")
	public String myProfileForm(Member member,Product product,Mypage mypage,Model model, HttpSession session) {
		// 본인 아이디 정보 받아오기
		String id = (String)session.getAttribute("id");
		Member member2 = ms.selectId(id);
		model.addAttribute("member",member2);
		
		//내 좋아요 물품 및 카운트 정보 넘기기
		List<Mypage> likeList = mys.likeList(id);
		int likesCount = mys.likeCount(id);
		
		// 내 구매&판매 리스트
		List<Mypage> myBuyList = mys.myBuyList(id);
		List<Mypage> mySellList = mys.mySellList(id);
		// 구매 판매 카운팅
		int productCountB = mys.myBuyCount(id);
		int productCountS = mys.mySellCount(id);
		// 티어
		int tier = member2.getGrade();
		// 티어 최대점수
		int maxGrade = 0;
		// 티어 최소점수
		int minGrade = 0;
		// 티어 배경색
		String tierBC = "";
		if (tier <= 20) {
			maxGrade = 20;
			minGrade = 0;
			tierBC = "warning";
		} else if (tier > 20 && tier < 50) {
			maxGrade = 50;
			minGrade = 20;
			tierBC = "silver";
		} else if (tier >= 50 && tier < 100) {
			minGrade = 50;
			maxGrade = 100;
			tierBC = "gold";
		} else if (tier >= 100 && tier < 200) {
			minGrade = 100;
			maxGrade = 200;
			tierBC = "platinum";
		} else if (tier >= 200 && tier < 300) {
			minGrade = 200;
			maxGrade = 300;
			tierBC = "diamond";
		} else if (tier >= 300) {
			maxGrade = tier;
			tierBC = "vip";
		}
		model.addAttribute("minGrade",minGrade);
		model.addAttribute("maxGrade", maxGrade);
		model.addAttribute("tierBC", tierBC);
		// 구매&판매 정보 넘김
		model.addAttribute("myBuyList",myBuyList);
		model.addAttribute("mySellList",mySellList);
		model.addAttribute("myBuyCount",productCountB);
		model.addAttribute("mySellCount",productCountS);
		model.addAttribute("likeList",likeList);
		model.addAttribute("likesCount",likesCount);
		model.addAttribute("member",member2);
		
		return "/mypage/myProfile";
	}
	
	@RequestMapping("myBuyList")
	public String myBuyList(Model model, HttpSession session) {
		// 본인 아이디 정보 받아오기
		String id = (String)session.getAttribute("id");
		Member member2 = ms.selectId(id);
		model.addAttribute("member",member2);
		
		List<Mypage> myBuyList = mys.myBuyList(id);
		model.addAttribute("myBuyList",myBuyList);
		int productCountB = mys.myBuyCount(id);
		model.addAttribute("myBuyCount",productCountB);
		List<Reply> reply = rs.list(id);
		
		return"/mypage/buyList";
	}
	
	@RequestMapping("mySellList")
	public String mySellList(Model model, HttpSession session) {
		// 본인 아이디 정보 받아오기
		String id = (String) session.getAttribute("id");
		Member member2 = ms.selectId(id);
		model.addAttribute("member", member2);
		
		List<Mypage> mySellList = mys.mySellList(id);
		model.addAttribute("mySellList",mySellList);
		int productCountS = mys.mySellCount(id);
		model.addAttribute("mySellCount",productCountS);
		
		return "/mypage/sellList";
	}
	
	@RequestMapping("myLikeList")
	public String myLikeList(Model model, HttpSession session) {
		// 본인 아이디 정보 받아오기
		String id = (String) session.getAttribute("id");
		Member member2 = ms.selectId(id);
		model.addAttribute("member", member2);
		
		//내 좋아요 물품 및 카운트 정보 넘기기
		List<Mypage> likeList = mys.likeList(id);
		int likesCount = mys.likeCount(id);
		System.out.println("찜한 횟수 : " + likesCount);
		System.out.println("찜한 게시글 info : " + likeList);
		model.addAttribute("likeList",likeList);
		model.addAttribute("likesCount", likesCount);

		return "/mypage/likeList";
	}

	@RequestMapping("reviewList")
	public String reviewList(Model model, HttpSession session) {
		// 본인 아이디 정보 받아오기
		String id = (String) session.getAttribute("id");
		Member member2 = ms.selectId(id);
		model.addAttribute("member", member2);
		
		// 본인과 관련된 모든 리뷰 리스트
		List<Reply> MyReviewListAll = mys.MyReviewListAll(id);
		model.addAttribute("MyReviewListAll",MyReviewListAll);
		
		// 내가 구매한 물품의 리뷰 리스트
		List<Reply> MyReviewListBuy = mys.MyReviewListBuy(id);
		model.addAttribute("MyReviewListBuy",MyReviewListBuy);
		
		// 내가 판매한 물품의 리뷰 리스트
		List<Reply> MyReviewListSell = mys.MyReviewListSell(id);
		model.addAttribute("MyReviewListSell",MyReviewListSell);
		
		return "/mypage/reviewList";
	}
	
	@RequestMapping("reviewPop")
	public String reviewPop(int p_num,Model model) {
		// p_num 으로 해당 게시물 리뷰 불러옴
		Reply reply = rs.selectReview(p_num);
		Product product = ps.select(p_num);
		System.out.println("reply : " + reply);
		// 불러온 정보 전부 넘김
		model.addAttribute("product",product);
		model.addAttribute("reply",reply);
		return "admin/review/reviewPop";
	}
}
