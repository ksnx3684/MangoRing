package com.project.mango.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.mango.member.MemberService;
import com.project.mango.member.MemberVO;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {
	
	@Autowired
	private MemberService memberService;
	

	@GetMapping("list")
	public ModelAndView getList(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MemberVO> ar = memberService.getList(memberVO);
		mv.addObject("list", ar);
		mv.setViewName("manager/list");
		return mv;
	}
	
	@GetMapping("memberChange")
	public ModelAndView getMemberChange(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MemberVO> ar = memberService.getMemberChange(memberVO);
		mv.addObject("memberChange", ar);
		mv.setViewName("manager/memberChange");
		return mv;
	}
	
	@GetMapping("memberChangeDetail")
	public ModelAndView getMemberChangeDetail(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO = memberService.getMemberChangeDetail(memberVO);
		mv.addObject("mv", memberVO);
		mv.setViewName("manager/memberChangeDetail");
		return mv;
	}
}
