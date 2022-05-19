package com.ch.daitso.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.daitso.model.Member;
import com.ch.daitso.model.Product;
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
	public String myProfileForm(Member member,Product product,Model model, HttpSession session) {
		// 본인 아이디 정보 받아오기
		String id = (String)session.getAttribute("id");
		Member member2 = ms.selectId(id);
		return "/mypage/myProfile";
	}
	
}
