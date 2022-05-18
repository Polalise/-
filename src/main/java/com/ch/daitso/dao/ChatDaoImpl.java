package com.ch.daitso.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.daitso.model.Chat;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int getNum() {
		return sst.selectOne("chatns.getNum");
	}

	@Override
	public int countByChatNick(String buyer_nick, String seller_nick) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("buyer_nick", buyer_nick);
	    map.put("seller_nick", seller_nick);
		return sst.selectOne("chatns.countByChatNick", map);
	}

	@Override
	public Chat findByChatNum(int room_num) {
		return sst.selectOne("chatns.findByChatNum", room_num);
	}

	@Override
	public List<Chat> readChatHistory(Chat chatRoomTemp) {
		return sst.selectList("chatns.readChatHistory", chatRoomTemp);
	}

	@Override
	public Chat addChatRoom(Chat chat) {
		return sst.insert("chatns.addChatRoom", chat);
	}
}
