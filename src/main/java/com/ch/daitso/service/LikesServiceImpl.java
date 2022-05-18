package com.ch.daitso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.daitso.dao.LikesDao;
import com.ch.daitso.model.Likes;

@Service
public class LikesServiceImpl implements LikesService {
	@Autowired
	private LikesDao ld;

	public int addLikes(Likes likes) {
		return ld.addLikes(likes);
	}

	public int deleteLikes(Likes likes) {
		return ld.deleteLikes(likes);
	}

	public Likes searchList(String id, int p_num) {
		return ld.searchList(id, p_num);
	}


}
