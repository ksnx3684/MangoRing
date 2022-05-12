package com.project.mango.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	// 회원가입
	public int setAddMember(MemberVO memberVO) throws Exception {
		return memberMapper.setAddMember(memberVO);
	}
	
	// 로그인
	public MemberVO getLogin(MemberVO memberVO) throws Exception {
		return memberMapper.getLogin(memberVO);
	}
}
