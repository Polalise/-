package com.ch.daitso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.daitso.dao.ChatDao;
import com.ch.daitso.model.Chat;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDao cd;

	@Override
	public Chat findChatRoom(String user1_nick, String user2_nick, int p_num) {
		return cd.findChatRoom(user1_nick, user2_nick, p_num);
	}

	@Override
	public void createChatRoom(Chat chat) {
		cd.createChatRoom(chat);
	}

	@Override
	public int findChatRoomNum(String user1_nick, String user2_nick, int p_num) {
		return cd.findChatRoomNum(user1_nick, user2_nick, p_num);
	}

	@Override
	public List<Chat> findChatRoomLog(String user2_nick) {
		return cd.findChatRoomLog(user2_nick);
	}

	@Override
	public List<Chat> findChatRoom2(String user1_nick, int p_num) {
		return cd.findChatRoom2(user1_nick, p_num);
	}

	@Override
	public List<Chat> findChatRoomLog2(String user1_nick, int p_num) {
		return cd.findChatRoomLog2(user1_nick, p_num);
	}

	@Override
	public List<Chat> findChatRoomNum2(Chat chat) {
		return cd.findChatRoomNum2(chat);
	}

	@Override
	public Chat findChatInfo(int room_num) {
		return cd.findChatInfo(room_num);
	}

	@Override
	public List<Chat> findChatRoomNum3(Chat chat) {
		return cd.findChatRoomNum3(chat);
	}

	
}
