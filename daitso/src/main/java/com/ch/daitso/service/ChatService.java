package com.ch.daitso.service;

import java.util.List;

import com.ch.daitso.model.Chat;

public interface ChatService {

	Chat findChatRoom(String user1_nick, String user2_nick, int p_num);

	void createChatRoom(Chat chat);

	int findChatRoomNum(String user1_nick, String user2_nick, int p_num);

	List<Chat> findChatRoomLog(String user2_nick);

	List<Chat> findChatRoom2(String user1_nick, int p_num);

	List<Chat> findChatRoomLog2(String user1_nick, int p_num);

	List<Chat> findChatRoomNum2(Chat chat);

	Chat findChatInfo(int room_num);

	List<Chat> findChatRoomNum3(Chat chat);


}
