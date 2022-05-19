package com.ch.daitso.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.daitso.dao.MypageDao;

@Service
public class MyPageServiceImpl implements MypageService{
	@Autowired
	private MypageDao myd;
}
