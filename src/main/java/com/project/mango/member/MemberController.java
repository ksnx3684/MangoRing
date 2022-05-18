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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 로그인 GET 방식
	@GetMapping("login")
	public String getLogin(Model model, @ModelAttribute MemberVO memberVO) throws Exception {
		
		return "member/login";
	}
	
	// 로그인 POST 방식
	@PostMapping("login")
	public String getLogin(HttpSession session, @Valid MemberVO memberVO, BindingResult bindingResult) throws Exception {
			
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
	public String getMyPage(HttpSession session, Model model) throws Exception {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		memberVO = memberService.getMyPage(memberVO);
		model.addAttribute("vo", memberVO);
		
		return "member/myPage";
	}
	
	// 회원정보 수정 GET 방식
	@GetMapping("update")
	public ModelAndView setUpdate(HttpSession session, MemberVO memberVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		memberVO = (MemberVO)session.getAttribute("member");
		memberVO = memberService.getMyPage(memberVO);
		mv.addObject("vo", memberVO);
		mv.setViewName("member/update");
	
		return mv;
	}
	
	// 회원정보 수정 POST 방식
	@PostMapping("update")
	public String setUpdate(HttpSession session, Model model, MemberVO memberVO) throws Exception {
		MemberVO sessionVO = (MemberVO)session.getAttribute("member");
		// 매개변수로 받은 memberVO에는 id 정보가 없어서 session에서 받아와야 함
		memberVO.setId(sessionVO.getId());
		int result = memberService.setUpdate(memberVO);
		model.addAttribute("vo", memberVO);
		return "redirect:./myPage";
	}
	
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 회원 탈퇴 GET 방식
	@GetMapping("delete")
	public String setDelete() throws Exception {
		
		return "member/delete";
	}
	
	// 회원 탈퇴 POST 방식
	@PostMapping("delete")
	public String setDelete(HttpSession session, MemberVO vo, 
			RedirectAttributes rttr) throws Exception {
		
		// 세션에 있는 member를 가져와 memberVO 변수에 넣어줌
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		// 세션에 있는 비밀번호
		String sessionPass = memberVO.getPw();
		// vo로 들어오는 비밀번호
		String voPass = vo.getPw();
		
		if(!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:./delete";
		}
		
		int result = memberService.setDelete(memberVO);
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
		
		return "redirect:./login";
	}
}
