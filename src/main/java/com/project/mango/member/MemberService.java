package com.project.mango.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;



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
	
	// 사용자 정의 검증 메서드 선언
	public boolean memberError(MemberVO memberVO, BindingResult bindingResult) throws Exception {
		
		// check가 false면 검증 성공 : error 없음
		// check가 true면 검증 실패 : error 있음
		boolean check = false;
		
		// 1. Annotation 기본 검증 결과
		check = bindingResult.hasErrors();
		
		// 2. Password가 일치하는지 수동 검증
		if(!memberVO.getPw().equals(memberVO.getCheckPw())) {
			check = true;
			bindingResult.rejectValue("checkPw", "memberjoin.password.notEqual");
		}
		
		// 3. ID 중복 검사
		MemberVO idCheck = memberMapper.getId(memberVO);
		if(idCheck != null) {
			check = true;
			bindingResult.rejectValue("id", "memberjoin.id.overlap");
		}
		
		return check;
	}
	
	public MemberVO getMyPage(MemberVO memberVO) throws Exception {
		return memberMapper.getMyPage(memberVO);
	}
}
