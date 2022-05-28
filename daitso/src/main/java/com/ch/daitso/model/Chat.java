package com.ch.daitso.model;

import lombok.Data;
import oracle.sql.DATE;

@Data
public class Chat {

	private int room_num;
	private int p_num;
	private String user1_nick;
	private String user2_nick;
	private DATE chat_time;
	
	// 채팅을 저장할 파일
	private String c_fileName;
}
