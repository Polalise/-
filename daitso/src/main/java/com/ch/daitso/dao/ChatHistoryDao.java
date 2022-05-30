package com.ch.daitso.dao;

import java.util.List;

import com.ch.daitso.model.ChatHistory;

public interface ChatHistoryDao {

	int insertChat(ChatHistory chathistory);

	List<ChatHistory> getChatHistory(int room_num);

	List<ChatHistory> getChatHistory2(int room_num);

}
