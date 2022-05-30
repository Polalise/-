package com.ch.daitso.service;

import java.util.List;

import com.ch.daitso.model.ChatHistory;

public interface ChatHistoryService {

	int insertChat(ChatHistory chathistory);

	List<ChatHistory> getChatHistory(int room_num);

	List<ChatHistory> getChatHistory2(int room_num);

}
