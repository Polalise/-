package com.ch.daitso.dao;

import java.util.List;

import com.ch.daitso.model.Chat;

public interface ChatDao {

	int getNum();

	int countByChatNick(String buyer_nick, String seller_nick);

	Chat findByChatNum(int room_num);

	List<Chat> readChatHistory(Chat chatRoomTemp);

	Chat addChatRoom(Chat chat);

}
