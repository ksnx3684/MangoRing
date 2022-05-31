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
		System.out.println("여기오니 ?");
		ModelAndView mv = new ModelAndView();
		List<MemberVO> ar = memberService.getList(memberVO);
		mv.addObject("list", ar);
		mv.setViewName("manager/list");
		return mv;
	}
}
