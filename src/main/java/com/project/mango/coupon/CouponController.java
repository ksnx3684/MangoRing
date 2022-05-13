package com.project.mango.coupon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/coupon/*")
public class CouponController {
	
	@GetMapping("add")
	public ModelAndView setAdd(CouponVO couponVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("coupon/add");
		return mv;
	}
	

}
