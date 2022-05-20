package com.ch.daitso.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.daitso.model.*;
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
	
	@RequestMapping("myProfileForm")
	public String myProfileForm(Member member,Product product,Mypage mypage,Model model, HttpSession session) {
		// 본인 아이디 정보 받아오기
		String id = (String)session.getAttribute("id");
		Member member2 = ms.selectId(id);
		model.addAttribute("member",member2);
		
		//내 좋아요 물품 및 카운트 정보 넘기기
		List<Mypage> likeList = mys.likeList(id);
		List<Product> likeListInfo = mys.likeListInfo(likeList);
		int likesCount = mys.likeCount(id);
		
		// 내 구매&판매 리스트
		List<Mypage> myBuyList = mys.myBuyList(id);
		List<Mypage> mySellList = mys.mySellList(id);
		// 구매 판매 카운팅
		int productCountB = mys.myBuyCount(id);
		int productCountS = mys.mySellCount(id);
		// 구매&판매 정보 넘김
		model.addAttribute("myBuyList",myBuyList);
		model.addAttribute("mySellList",mySellList);
		model.addAttribute("myBuyCount",productCountB);
		model.addAttribute("mySellCount",productCountS);
		model.addAttribute("likeListInfo",likeListInfo);
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
		List<Product> likeListInfo = mys.likeListInfo(likeList);
		int likesCount = mys.likeCount(id);
		
		model.addAttribute("likeList",likeList);
		model.addAttribute("likeListInfo",likeListInfo);
		model.addAttribute("likesCount", likesCount);
		
		return "/mypage/likeList";
	}

}
