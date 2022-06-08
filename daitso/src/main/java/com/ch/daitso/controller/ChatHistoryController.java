                                                                           package com.ch.daitso.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ch.daitso.model.Chat;
import com.ch.daitso.model.ChatHistory;
import com.ch.daitso.model.Member;
import com.ch.daitso.model.Product;
import com.ch.daitso.service.ChatHistoryService;
import com.ch.daitso.service.ChatService;
import com.ch.daitso.service.MemberService;
import com.ch.daitso.service.ProductService;

@Controller
public class ChatHistoryController {

	@Autowired
	private ChatHistoryService chs;
	
	@Autowired
	private ChatService cs;
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private ProductService ps;
	
	@RequestMapping(value = "saveMessage", produces = "text/html;charset=utf-8")
	public String saveMessage(@RequestParam("msg") String msg, @RequestParam("nickname") String nickname, HttpSession session, ChatHistory chathistory, Chat chat, Model model, Product product) {
		
		// ajax로 넘어온 닉네임과 메세지 데이터
		chathistory.setSender(nickname);
		chathistory.setText(msg);
		
		String id = (String)session.getAttribute("id");
		Member member2 = ms.selectId(id);
		model.addAttribute("member", member2);

		// chatRoom에 판매자 nickName 저장, 채팅거는 회원 nickName 저장
		// p_num을 통해서 product의 정보를 가져와서 seller_nick 저장
		Product product2 = ps.select(product.getP_num());

		chat.setUser2_nick(member2.getNickName());
		chat.setUser1_nick(product2.getP_writer());
		
		// 받아온 p_num을 chatRoom에 set하기
		chat.setP_num(product.getP_num());
		
		if (!(chat.getUser1_nick().equals(chat.getUser2_nick()))) {
			// 해당되는 채팅방 번호 가져오는 method
			int room_num = cs.findChatRoomNum(chat.getUser1_nick(), chat.getUser2_nick(), chat.getP_num());
			chathistory.setRoom_num(room_num);
			
			// chathistory에 채팅 내용 저장
			int result = chs.insertChat(chathistory);
			
			model.addAttribute("result", result);
		} else if ((chat.getUser1_nick().equals(chat.getUser2_nick()))) {
			int room_num = chat.getRoom_num();
			chathistory.setRoom_num(room_num);
			
			// chathistory에 채팅 내용 저장
			chs.insertChat(chathistory);
		}
		
		
		return "/chat/chatRoom2";
	}
}
