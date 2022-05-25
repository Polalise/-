package com.ch.daitso.model;

import lombok.Data;
import oracle.sql.DATE;

@Data
public class Chat {

	private int room_num;
	private String seller_nick;
	private String buyer_nick;
	private String text;
	private DATE chat_time;
	
	// 채팅을 저장할 파일
	private String c_fileName;
}
