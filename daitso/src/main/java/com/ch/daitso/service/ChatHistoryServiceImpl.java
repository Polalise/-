package com.ch.daitso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.daitso.dao.ChatHistoryDao;
import com.ch.daitso.model.ChatHistory;

@Service
public class ChatHistoryServiceImpl implements ChatHistoryService {

	@Autowired
	private ChatHistoryDao chd;

	@Override
	public int insertChat(ChatHistory chathistory) {
		return chd.insertChat(chathistory);
	}

	@Override
	public List<ChatHistory> getChatHistory(int room_num) {
		return chd.getChatHistory(room_num);
	}

	@Override
	public List<ChatHistory> getChatHistory2(int room_num) {
		return chd.getChatHistory2(room_num);
	}
}
