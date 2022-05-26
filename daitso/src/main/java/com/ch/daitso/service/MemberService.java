package com.ch.daitso.service;

import java.util.List;

import com.ch.daitso.model.Member;
import com.ch.daitso.model.Reply;

public interface MemberService {

	// 아이디 중복 체크
	Member selectId(String id);

	// 별명 중복 체크
	Member selectNick(String nickName);

	// 회원 가입
	int insert(Member member);

	// 개인정보 수정
	int update(Member member);

	// 탈퇴
	int delete(String id);

	// 이름과 메일로 아이디 찾기
	Member selectFindId(Member member);

	// 아이디와 메일로 비밀번호 찾기
	Member selectFindPassword(Member member);

	// 비밀번호 찾기 후 비밀번호 변경
	int updatePassword(Member member);
	
	int getMbTotal(Member member);

	//List<Member> mbList(int startRow, int endRow);

	int adminDelete(String id);

	Member select(String id);

	int adminRollback(String id);

	int adminUpdate(Member member);

	List<Member> getList();

	int getCount();

	int getCount2();

	List<Member> mbList(Member member);
	
	void star(int rating,String id);


}
