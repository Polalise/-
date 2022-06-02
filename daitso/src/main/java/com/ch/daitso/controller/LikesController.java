package com.ch.daitso.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.daitso.model.Likes;
import com.ch.daitso.service.LikesService;
import com.ch.daitso.service.MemberService;

@Controller
public class LikesController {
	@Autowired
	private LikesService ls;
	@Autowired
	private MemberService ms;

	@RequestMapping(value = "addLikes",produces = "text/html;charset=utf-8")
	@ResponseBody
	public String addAction(Likes likes, Model model) {
		int result = ls.addLikes(likes);
		model.addAttribute("likes",likes);
		return result+"";
	}
	
	@RequestMapping(value = "deleteLikes",produces = "text/html;charset=utf-8")
	@ResponseBody
	public String delAction(Likes likes, Model model) {
		int result = ls.deleteLikes(likes);
		model.addAttribute("likes",likes);
		return result+"";
	}
}
