package com.project.mango.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {

	public ModelAndView manage()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("manager/manage");
		return mv;
	}
}
