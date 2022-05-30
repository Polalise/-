package com.ch.daitso.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.daitso.model.Reply;

@Repository
public class ReplyDaoImpl  implements ReplyDao{
    @Autowired
    private SqlSessionTemplate sst;

	@Override
	public int getMaxNum() {
		return sst.selectOne("replyns.getMaxNum");
	}

	@Override
	public int insert(Reply board) {
		return sst.insert("replyns.insert",board);
	}

	@Override
	public List<Reply> list(String id) {
		return sst.selectList("replyns.list", id);
	}

	@Override
	public void delete(Reply rb) {
		sst.update("replyns.delete",rb);
		
	}

	@Override
	public void update(Reply rb) {
		sst.update("replyns.update",rb);
		
	}

	@Override
	public Reply selectReview(int p_num) {
		return sst.selectOne("myPagens.selectReview",p_num);
	}
    
    
}
