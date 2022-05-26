package com.ch.daitso.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.daitso.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sst;

	// 아이디 중복체크
	@Override
	public Member selectId(String id) {
		return sst.selectOne("memberns.selectId", id);
	}

	// 별명 중복 체크
	@Override
	public Member selectNick(String nickName) {
		return sst.selectOne("memberns.selectNick", nickName);
	}

	// 회원가입
	@Override
	public int insert(Member member) {
		return sst.insert("memberns.insert", member);
	}

	@Override
	public int update(Member member) {
		return sst.update("memberns.update", member);
	}

	@Override
	public int delete(String id) {
		return sst.delete("memberns.delete", id);
	}

	// 아이디 찾을때 회원 정보가 있는지 확인 하는 여부
	@Override
	public Member selectFindId(Member member) {
		return sst.selectOne("memberns.selectFindId", member);
	}

	// 비밀번호 찾을 때 회원정보 있는지 확인 하는 여부
	@Override
	public Member selectFindPassword(Member member) {
		return sst.selectOne("memberns.selectFindPassword", member);
	}

	// 비밀번호 찾기 후 비밀번호 변경
	@Override
	public int updatePassword(Member member) {
		return sst.update("memberns.updatePassword", member);
	}

	@Override
	public int getMbTotal(Member member) {
		return sst.selectOne("memberns.getMbTotal", member);
	}

	// @Override
	// public List<Member> mbList(int startRow, int endRow) {
//		/* selectList 는 변수 하나밖에 안들어가서 map으로 startRow,endRow 를 넣고 map을 변수로넣는다 */
//		Map<String, Integer> map = new HashMap<String, Integer>();
//	    map.put("startRow",startRow);
//	    map.put("endRow",endRow);
//		return sst.selectList("memberns.list",map);
	// }

	@Override
	public int adminDelete(String id) {
		return sst.update("memberns.adminDelete", id);
	}

	@Override
	public Member select(String id) {
		return sst.selectOne("memberns.select", id);
	}

	@Override
	public int adminRollback(String id) {
		return sst.update("memberns.adminRollback", id);
	}

	@Override
	public int adminUpdate(Member member) {
		System.out.println("member" + member.getAddress());
		System.out.println("member" + member.getName());
		System.out.println("member" + member.getPassword());
		System.out.println("member" + member.getNickName());

		return sst.update("memberns.adminUpdate", member);
	}

	@Override
	public List<Member> getList() {
		return sst.selectList("memberns.getList");
	}

	@Override
	public int getCount() {
		return sst.selectOne("memberns.getCount");
	}

	@Override
	public int getCount2() {
		return sst.selectOne("memberns.getCount2");
	}

	@Override
	public List<Member> list(Member member) {
		return sst.selectList("memberns.list", member);
	}

	// 별점 등급 영향
	@Override
	public void star(int rating, String id) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("rating", rating);
		map.put("id", id);
		sst.update("memberns.star", map);

	}

	@Override
	public void penalty(int score, String id) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("score", score);
		map.put("id", id);
		sst.update("memberns.star", map);

	}
}
