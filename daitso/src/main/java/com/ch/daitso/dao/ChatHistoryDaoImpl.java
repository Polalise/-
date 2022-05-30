package com.ch.daitso.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.daitso.model.ChatHistory;

@Repository
public class ChatHistoryDaoImpl implements ChatHistoryDao {

	@Autowired
	private SqlSessionTemplate sst;

	// 채팅 기록 남기기
	@Override
	public int insertChat(ChatHistory chathistory) {
		return sst.insert("chathistoryns.insertChat", chathistory);
	}

	// 채팅 기록 불러오기
	@Override
	public List<ChatHistory> getChatHistory(int room_num) {
		return sst.selectList("chathistoryns.getChatHistory", room_num);
	}

	// 채팅 기록 불러오기2
	@Override
	public List<ChatHistory> getChatHistory2(int room_num) {
		return sst.selectList("chathistoryns.getChatHistory2", room_num);
	}
}
