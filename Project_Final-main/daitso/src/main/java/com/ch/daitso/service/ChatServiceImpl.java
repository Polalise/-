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
	public int getNum() {
		return cd.getNum();
	}

	@Override
	public int countByChatNick(String buyer_nick, String seller_nick) {
		return cd.countByChatNick(buyer_nick, seller_nick);
	}

	@Override
	public Chat findByChatNum(int room_num) {
		return cd.findByChatNum(room_num);
	}

	@Override
	public List<Chat> readChatHistory(Chat chatRoomTemp) {
		return cd.readChatHistory(chatRoomTemp);
	}

	@Override
	public Chat addChatRoom(Chat chat) {
		return cd.addChatRoom(chat);
	}
}
