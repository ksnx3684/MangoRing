package com.project.mango.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	// 회원가입
	public int setAddMember(MemberVO memberVO) throws Exception;
	
	// 로그인
	public MemberVO getLogin(MemberVO memberVO) throws Exception;
	
	// 중복 아이디 조회
	public MemberVO getId(MemberVO memberVO) throws Exception;

}
