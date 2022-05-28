package com.ch.daitso.model;

import lombok.Data;
import oracle.sql.DATE;

@Data
public class ChatHistory {
	
	private int chathistory_num;
	private int room_num;
	private String sender;
	private String text;
	private DATE send_time;

}
