package com.ch.daitso.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDaoImpl implements MypageDao{
	@Autowired
	private SqlSessionTemplate sst;
}
