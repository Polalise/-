package com.ch.daitso.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.daitso.model.Likes;

@Repository
public class LikesDaoImpl implements LikesDao {
	@Autowired
	private SqlSessionTemplate sst;

	public int addLikes(Likes likes) {
		return sst.insert("likesns.addLikes", likes);
	}

	public int deleteLikes(Likes likes) {
		return sst.delete("likesns.deleteLikes", likes);
	}

	public Likes searchList(String id, int p_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("p_num", p_num);
		return sst.selectOne("likesns.searchList",map);
	}

}
