package com.ch.daitso.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.daitso.service.EventService;
import com.ch.daitso.service.MemberService;
import com.ch.daitso.service.NoticeService;

@Controller
public class chartController {
	@Autowired
    NoticeService ns;
    @Autowired
    EventService es;
    @Autowired
    MemberService ms;
   // private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	/* @RequestMapping(value = "", method = RequestMethod.GET) */
    @RequestMapping("chart")
  	public String home(Locale locale, Model model)throws Exception {
   //게시글
  		int noticeCount = ns.getNoticeCount();
  		int eventCount = es.getEventCount();
   //회원 
  		int memberCount = ms.getCount();
  		int member2Count = ms.getCount2();

  		model.addAttribute("noticeCount", noticeCount);
  		model.addAttribute("eventCount", eventCount);
  		model.addAttribute("memberCount", memberCount);
  		model.addAttribute("member2Count", member2Count);
  		return "/admin/member/chartJs";

  	}
    
}
