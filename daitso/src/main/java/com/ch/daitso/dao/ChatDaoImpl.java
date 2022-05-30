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

	// 채팅방에 입장한 수로 몇명 채팅방에 들어와있는지 확인하기
		@Override
		public Chat findChatRoom(String user1_nick, String user2_nick, int p_num) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user1_nick", user1_nick);
		    map.put("user2_nick", user2_nick);  
		    map.put("p_num", p_num);
			return sst.selectOne("chatns.findChatRoom", map);
		}
		
		@Override
		public List<Chat> findChatRoom2(String user1_nick, int p_num) {
			Map<String, Object> map = new HashMap<String, Object>();
		    map.put("user1_nick", user1_nick);  
		    map.put("p_num", p_num);
			return sst.selectList("chatns.findChatRoom2", map);
		}

		// 채팅방 만들기
		@Override
		public Object createChatRoom(Chat chat2) {
			return sst.insert("chatns.createChatRoom", chat2);
		}

		// 채팅방 번호 조회
		@Override
		public int findChatRoomNum(String user1_nick, String user2_nick, int p_num) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user1_nick", user1_nick);
		    map.put("user2_nick", user2_nick);
		    map.put("p_num", p_num);
			return sst.selectOne("chatns.findChatRoomNum", map);
		}
		
		// 채팅방 번호 조회2
		@Override
		public List<Chat> findChatRoomNum2(Chat chat) {
			return sst.selectList("chatns.findChatRoomNum2", chat);
		}

	@Override
	public List<Chat> readChatHistory(Chat chatRoomTemp) {
		return sst.selectList("chatns.readChatHistory", chatRoomTemp);
	} 

	@Override
	public int addChatRoom(Chat chat) { 
		return sst.insert("chatns.addChatRoom", chat);
	}
		// 접속한 사람의 별명으로 채팅방 정보 가져오기
		@Override
		public List<Chat> findChatRoomLog(String user2_nick) {
			return sst.selectList("chatns.findChatRoomLog", user2_nick);
		}

		// room_num으로 채팅 정보 찾기
		@Override
		public Chat findChatInfo(int room_num) {
			return sst.selectOne("chatns.findChatInfo", room_num);
		}


		@Override
		public List<Chat> findChatRoomLog2(String user1_nick, int p_num) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user1_nick", user1_nick);
		    map.put("p_num", p_num);
			return sst.selectList("chatns.findChatRoomLog2", map);
		}

		@Override
		public List<Chat> findChatRoomNum3(Chat chat) {
			return sst.selectList("chatns.findChatRoomNum3", chat);
		}


		
}
