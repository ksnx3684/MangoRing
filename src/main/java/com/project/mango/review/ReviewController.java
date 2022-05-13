package com.project.mango.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("add")
	public ModelAndView setAdd(ReviewVO reviewVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("review/add");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setAdd(ReviewVO reviewVO,ModelAndView mv)throws Exception{
		
		int result = reviewService.setAdd(reviewVO);
		
		
		mv.addObject("result",result);
		mv.setViewName("/coupon/add");
		return mv;
		
	}

}
