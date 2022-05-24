package com.ch.daitso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.daitso.dao.MemberDao;
import com.ch.daitso.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao md;

	// 아이디 중복 체크
	@Override
	public Member selectId(String id) {
		return md.selectId(id);
	}

	// 별명 중복 체크
	@Override
	public Member selectNick(String nickName) {
		return md.selectNick(nickName);
	}

	// 회원 가입
	@Override
	public int insert(Member member) {
		return md.insert(member);
	}

	// 회원정보 수정
	@Override
	public int update(Member member) {
		return md.update(member);
	}

	// 탈퇴
	@Override
	public int delete(String id) {
		return md.delete(id);
	}

	// 아이디 찾기
	@Override
	public Member selectFindId(Member member) {
		return md.selectFindId(member);
	}

	// 비밀번호 찾기
	@Override
	public Member selectFindPassword(Member member) {
		return md.selectFindPassword(member);
	}

	// 비밀번호 찾기 후 비밀번호 변경
	@Override
	public int updatePassword(Member member) {
		return md.updatePassword(member);
	}
	@Override
	public int getMbTotal(Member member) {
		return md.getMbTotal(member); // 관리자 회원 개수를 알기 위함
	}

//	@Override
//	public List<Member> mbList(int startRow, int endRow) {
//		return md.mbList(startRow,endRow); // 관리자 회원 목록을 가져오기 위함
//	}

	@Override
	public int adminDelete(String id) {
		return md.adminDelete(id); 
	}

	@Override
	public Member select(String id) {
		return md.select(id); 
	}

	@Override
	public int adminRollback(String id) {
		return md.adminRollback(id); 
	}

	@Override
	public int adminUpdate(Member member) {
		return md.adminUpdate(member); 
	}

	@Override
	public List<Member> getList() {
		return md.getList(); 
	}

	@Override
	public int getCount() {
		return md.getCount(); 
	}

	@Override
	public int getCount2() {
		return md.getCount2(); 
	}

	@Override
	public List<Member> mbList(Member member) {
		return md.list(member);
	}

	// 별점 등급영향
	@Override
	public void star(int rating, String id) {
		md.star(rating, id);

	}
}
