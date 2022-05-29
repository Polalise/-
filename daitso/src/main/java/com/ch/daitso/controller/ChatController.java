package com.ch.daitso.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.daitso.model.Chat;
import com.ch.daitso.model.ChatHistory;
import com.ch.daitso.model.Member;
import com.ch.daitso.model.Product;
import com.ch.daitso.service.ChatHistoryService;
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
	
	@Autowired
	private ChatHistoryService chs;
	
	@RequestMapping("chatRoom")
	public String chatRoom(Member member, Product product, HttpSession session, Model model, Chat chat, ChatHistory chathistory) {
		int result = 0;
		
		// 세션을 통해 아이디를 받아와서 해당 아이디로 회원 정보 가져와서 넘기기
		String id = (String)session.getAttribute("id");
		Member member2 = ms.selectId(id);
		model.addAttribute("member", member2);
		member2.getPhotoName();

		// chatRoom에 판매자 nickName 저장, 채팅거는 회원 nickName 저장
		// p_num을 통해서 product의 정보를 가져와서 seller_nick 저장
		Product product2 = ps.select(product.getP_num());

		chat.setUser2_nick(member2.getNickName());
		chat.setUser1_nick(product2.getP_writer());
		chat.setP_name(product2.getP_name());
		
		// 받아온 p_num을 chatRoom에 set하기
		chat.setP_num(product.getP_num());
		chat.setRoom_num(chat.getRoom_num());
		
		// 사진 정보 넣기
		chat.setUser2_photo(member2.getPhotoName());
		Member member3 = ms.selectNick(product2.getP_writer());
		chat.setUser1_photo(member3.getPhotoName());
		
		// 2명의 별명+게시글 번호로 방이 있는지 조회
		if ((cs.findChatRoom(chat.getUser1_nick(), chat.getUser2_nick(), chat.getP_num()) == null) && !(chat.getUser1_nick().equals(chat.getUser2_nick()))) {
			result = 1;
		} else if ((cs.findChatRoom(chat.getUser1_nick(), chat.getUser2_nick(), chat.getP_num()) != null) && !(chat.getUser1_nick().equals(chat.getUser2_nick()))) {
			
			// 채팅 기록 가져오기(이용자가 속한 모든 채팅 방 보여주기), 대체로 여기는 한 건
			int room_num = cs.findChatRoomNum(chat.getUser1_nick(), chat.getUser2_nick(), chat.getP_num());
			
			List<ChatHistory> log = chs.getChatHistory(room_num);
			model.addAttribute("log", log);
			
			// 접속한 사람의 별명으로 채팅방 리스트 뽑기
			List<Chat> chatlog = cs.findChatRoomLog(chat.getUser2_nick());
			model.addAttribute("chatlog", chatlog);
			
			result = -1;
		} else if (chat.getUser1_nick().equals(chat.getUser2_nick())) {
			// 결국 내 회원 별명을 게시글 별명으로 지정 하고
			chat.setUser1_nick(chat.getUser2_nick());

			// user1로 정보 불러오기(채팅 기록이 있는 경우)
			if(!(cs.findChatRoom2(chat.getUser1_nick(), chat.getP_num()).isEmpty())) { 
				if(chat.getRoom_num() == 0) {
					// 게시글 작성자가 게시글에 들어왔을때 채팅방 리스트 뽑기
					List<Chat> chatlog2 = cs.findChatRoomLog2(chat.getUser1_nick(), chat.getP_num());
					model.addAttribute("chatlog2", chatlog2);
									
					// 채팅 기록 가져오기(게시글 작성자가 본인 게시글에서 대화한 기록 가져오기)	
					// 방번호를 찾고
					List<Chat> chat2 = cs.findChatRoomNum2(chat);
					model.addAttribute("chat2", chat2);
						
					// 해당하는 룸넘에 대한거 가져오기	
					List<ChatHistory> log2 = chs.getChatHistory2(chat2.get(0).getRoom_num());
					model.addAttribute("log2", log2);
							
					// 가져오고 나서는 result를 바꿈
					result = -2;
				} else if (chat.getRoom_num() != 0){
					// 게시글 작성자가 게시글에 들어왔을때 채팅방 리스트 뽑기
					List<Chat> chatlog2 = cs.findChatRoomLog2(chat.getUser1_nick(), chat.getP_num());
					model.addAttribute("chatlog2", chatlog2);
					
					// 채팅 기록 가져오기(게시글 작성자가 본인 게시글에서 대화한 기록 가져오기)	
					// 방번호를 찾고
					List<Chat> chat2 = cs.findChatRoomNum3(chat);
					model.addAttribute("chat2", chat2);

					// 해당하는 룸넘에 대한거 가져오기
					List<ChatHistory> log2 = chs.getChatHistory2(chat2.get(0).getRoom_num());
					model.addAttribute("log2", log2);
				
					// 가져오고 나서는 result를 바꿈
					result = -2;
				}
		
			//	user1로 정보 불러오기(채팅 기록이 없는 경우)
			} else if (cs.findChatRoom2(chat.getUser1_nick(), chat.getP_num()).isEmpty()) {
				result = 2;
			}
			
		} 	
		// 결과값을 넘겨서 result에 맞게 화면 보여주기 위함
		model.addAttribute("result", result);
		model.addAttribute("product", product2);
		
			
		// 가장 최근 text불러오기
				
		return "/chat/chatRoom2";
	}
	
	@RequestMapping("createChatRoom")
	public String createChatRoom(Member member, Product product, HttpSession session, Model model, Chat chat) {
		// 세션을 통해 아이디를 받아와서 해당 아이디로 회원 정보 가져와서 넘기기
		String id = (String)session.getAttribute("id");
		Member member2 = ms.selectId(id);
		model.addAttribute("member", member2);

		// chatRoom에 판매자 nickName 저장, 채팅거는 회원 nickName 저장
		// p_num을 통해서 product의 정보를 가져와서 seller_nick 저장
		Product product2 = ps.select(product.getP_num());
		chat.setUser2_nick(member2.getNickName());
		chat.setUser1_nick(product2.getP_writer());
		chat.setP_name(product2.getP_name());
		
		// 받아온 p_num을 chatRoom에 set하기
		chat.setP_num(product.getP_num());
		
		// 사진 정보 넣기
		chat.setUser2_photo(member2.getPhotoName());
		Member member3 = ms.selectNick(product2.getP_writer());
		chat.setUser1_photo(member3.getPhotoName());
		
		// 채팅방 만들기(만들어지면 -1)
		cs.createChatRoom(chat);
		int result = -1;
		
		// 채팅 생성될 때 채팅방 번호 가져와서 뿌려주기
		model.addAttribute("product", product2);
		model.addAttribute("result", result);

		return "/chat/resultChatRoom";
	}
	
	// 채팅 리스트 눌렀을때 채팅방 정보 가져오기
	@RequestMapping("chatClick")
	public String chatClick(Member member, Chat chat, HttpSession session, Model model, Product product) {
		// 채팅방 번호로 채팅방 찾기
		Chat chat2 = cs.findChatInfo(chat.getRoom_num());		
		model.addAttribute("chat2", chat2);
		
		// product(p_num)정보 보내기
		product.setP_num(chat2.getP_num());
		model.addAttribute("product", product);
		return "redirect:chatRoom.do?p_num="+chat2.getP_num()+"&room_num="+chat2.getRoom_num();
	}
}
