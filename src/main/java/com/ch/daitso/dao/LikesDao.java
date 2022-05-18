package com.ch.daitso.dao;

import java.util.List;

import com.ch.daitso.model.Likes;

public interface LikesDao {

	int addLikes(Likes likes);

	int deleteLikes(Likes likes);

	Likes searchList(String id, int p_num);

}
