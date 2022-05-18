package com.ch.daitso.dao;

import java.util.List;

import com.ch.daitso.model.Member;

public interface MemberDao {

	// 아이디 중복 체크
	Member selectId(String id);

	// 별명 중복 체크
	Member selectNick(String nickName);

	// 회원가입
	int insert(Member member);

	// 내정보 수정
	int update(Member member);

	// 탈퇴
	int delete(String id);

	// 아이디 찾기
	Member selectFindId(Member member);

	// 비밀번호 찾기
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

	List<Member> list(Member member);
}
