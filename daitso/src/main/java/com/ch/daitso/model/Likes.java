package com.ch.daitso.model;

import lombok.Data;

@Data
public class Likes {
	private int p_num;
	
	// 평점용
    private float reviewAvg;
    
    // 조인용
    private String id;
    
	// paging용
	private int startRow;
	private int endRow;
	
	// 검색용
	private String search;
	private String keyword;
}
