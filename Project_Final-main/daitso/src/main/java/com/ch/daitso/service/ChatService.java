package com.ch.daitso.service;

import java.util.List;

import com.ch.daitso.model.Chat;

public interface ChatService {

	int getNum();

	int countByChatNick(String buyer_nick, String seller_nick);

	Chat findByChatNum(int room_num);

	List<Chat> readChatHistory(Chat chatRoomTemp);

	Chat addChatRoom(Chat chat);

}
