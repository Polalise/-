package com.ch.daitso.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.daitso.model.Chat;
import com.ch.daitso.model.Member;
import com.ch.daitso.model.Product;
import com.ch.daitso.service.ChatService;
import com.ch.daitso.service.MemberService;
import com.ch.daitso.service.ProductService;

@Controller
public class ChatController {

	@Autowired
	private ChatService cs;
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private ProductService ps;
	
	@RequestMapping("chatRoom")
	public String chatRoom(Member member, Product product, HttpSession session, Model model, Chat chat) {
		// 세션을 통해 아이디를 받아와서 해당 아이디로 회원 정보 가져와서 넘기기
		String id = (String)session.getAttribute("id");
		Member member2 = ms.selectId(id);
		model.addAttribute("member", member2);

		// chatRoom에 판매자 nickName 저장, 채팅거는 회원 nickName 저장
		// p_num을 통해서 product의 정보를 가져와서 seller_nick 저장
		Product product2 = ps.select(product.getP_num());
		chat.setBuyer_nick(member2.getNickName());
		chat.setSeller_nick(product2.getP_writer());
				
		// 채팅 방에 들어가있는 아이디 수로 이미 채팅방이 있는지 확인
		if (cs.countByChatNick(chat.getBuyer_nick(), chat.getSeller_nick()) > 0) {
			// 채팅방 번호로 채팅방 정보 가져오기
            Chat chatRoomTemp = cs.findByChatNum(chat.getRoom_num());
            // 존재하는 채팅 기록 가져오기
            List<Chat> chatHistory = cs.readChatHistory(chatRoomTemp);
            
            model.addAttribute("chatHistory", chatHistory);
		} else {
			// 채팅방이 생겨날 때 마다 채팅방 번호 1씩 증가(2명 들어오면 늘어나는 걸로 해야겠다)
			int num = cs.getNum();
//			chat.setRoom_num(num);
//			Chat chat2 = cs.addChatRoom(chat);
//			cs.createFile();
			
		}
		
		
		
		return "/chat/chatRoom";
	}
}
