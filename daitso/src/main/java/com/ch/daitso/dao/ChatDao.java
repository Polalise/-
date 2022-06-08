package com.ch.daitso.dao;

import java.util.List;

import com.ch.daitso.model.Chat;

public interface ChatDao {

	Chat findChatRoom(String user1_nick, String user2_nick, int p_num);
	
	List<Chat> findChatRoom2(String user1_nick, int p_num);

	Object createChatRoom(Chat chat2);

	int findChatRoomNum(String user1_nick, String user2_nick, int p_num);

	List<Chat> findChatRoomLog(String user2_nick);

	Chat findChatInfo(int room_num);

	List<Chat> findChatRoomLog2(String user1_nick, int p_num);

	List<Chat> findChatRoomNum2(Chat chat);

	List<Chat> findChatRoomNum3(Chat chat);
 
}
