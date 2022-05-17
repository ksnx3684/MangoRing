package com.project.mango.member;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 로그인 GET 방식
	@GetMapping("login")
	public String setAddMember(Model model, @ModelAttribute MemberVO memberVO) throws Exception {
		
		return "member/login";
	}
	
	// 로그인 POST 방식
	@PostMapping("login")
	public String setAddMember(HttpSession session, @Valid MemberVO memberVO, BindingResult bindingResult) throws Exception {
			
		memberVO = memberService.getLogin(memberVO);
		String viewPath = "member/login";
		
		if(memberVO != null) {
			session.setAttribute("member", memberVO);
			viewPath = "redirect:../";
		}
		
		return viewPath;
	}
	
	// 마이페이지
	@GetMapping("myPage")
	public String myPage(HttpSession session, Model model) throws Exception {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		memberVO = memberService.getMyPage(memberVO);
		model.addAttribute("vo", memberVO);
		
		return "member/myPage";
	}
	
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 약관동의 GET 방식
	@GetMapping("joinCheck")
	public String setJoinCheck() throws Exception {
		
		return "member/joinCheck";
	}
	
	// 회원가입 GET 방식
	@GetMapping("join")
	public String setJoin(@ModelAttribute MemberVO memberVO) throws Exception {
		
		return "member/join";
	}
	
	// 회원가입 POST 방식
	@PostMapping("join")
	public String setJoin(Model model, @Valid MemberVO memberVO, BindingResult bindingResult) throws Exception {
		
		if(memberService.memberError(memberVO, bindingResult)) {
			return "member/join";
		}
		
		int result = memberService.setAddMember(memberVO);
		model.addAttribute("vo", memberVO);
		
		return "redirect:/";
	}
}
