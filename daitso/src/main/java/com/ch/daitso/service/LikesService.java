package com.ch.daitso.service;

import com.ch.daitso.model.Likes;

public interface LikesService {

	int addLikes(Likes likes);

	int deleteLikes(Likes likes);

	Likes searchList(String id, int p_num);

	int P_likeCount(int p_num);

}
