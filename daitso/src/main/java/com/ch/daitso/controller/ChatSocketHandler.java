package com.ch.daitso.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class ChatSocketHandler extends TextWebSocketHandler{
	
	// 채팅하기 위해서 연결된 Session을 저장 할 map
	private Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();
	
	// 연결 됐을 때 : 연결된 클라이언트의 정보를 map에 저장
	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		users.put(session.getId(), session);
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		session.sendMessage(new TextMessage(obj.toJSONString()));
	}
	
	// 연결 해지했을 때 : 연결된 정보를 삭제
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session.getId());
		super.afterConnectionClosed(session, status);
	}
	
	// 메세지가 왔을 때 : 연결된 모든 클라이언트에게 메세지 전달
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 연결된 유저의 정보만 가져옴
//		Collection<WebSocketSession> sessions = users.values();
		
		String msg = message.getPayload();
		JSONObject obj = JsonToObjectParser(msg);
		for (String key : users.keySet()) {
			WebSocketSession wss = users.get(key);
			try {
				wss.sendMessage(new TextMessage(obj.toJSONString()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	private static JSONObject JsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}
}
