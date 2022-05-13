package com.project.mango.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 로그인 GET 방식
	@GetMapping("login")
	public String setAddMember(MemberVO memberVO) throws Exception {
		
		return "member/login";
	}
	
	// 로그인 POST 방식
	@PostMapping("login")
	public String setAddMember(HttpSession session, MemberVO memberVO) throws Exception {
		
		memberVO = memberService.getLogin(memberVO);
		String viewPath = "member/login";
		
		if(memberVO != null) {
			session.setAttribute("member", memberVO);
			viewPath = "redirect:../";
		}
		
		return viewPath;
	}
	
	// 약관동의 GET 방식
	@GetMapping("joinCheck")
	public String setJoinCheck() throws Exception {
		
		return "member/joinCheck";
	}

}
