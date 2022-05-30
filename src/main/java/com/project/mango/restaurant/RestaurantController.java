package com.project.mango.restaurant;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.mango.menu.MenuVO;
import com.project.mango.review.ReviewService;
import com.project.mango.review.ReviewVO;

@Controller
@RequestMapping("/restaurant/*")
public class RestaurantController {
	
	@Autowired
	private RestaurantService restaurantService;
	@Autowired
	private ReviewService reviewService;

	
	@GetMapping("detail")
	public ModelAndView getDetailWM(RestaurantVO restaurantVO,ReviewVO reviewVO,MenuVO menuVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//레스토랑 정보 , 카테고리 종류
		restaurantVO = restaurantService.getDetailWM(restaurantVO);
	
		
		
		//MenuVO menuVO = restaurantService.getDetail(restaurantVO.getMenuVO());
		
		
		//리뷰 디테일로 가는 리스트
		//ReviewVO reviewVO =new ReviewVO();
		reviewVO.setRestaurantNum(restaurantVO.getRestaurantNum());
		System.out.println(restaurantVO.getRestaurantNum());
		System.out.println(reviewVO.getRseNum());
		System.out.println(reviewVO.getRssNum());
		List<ReviewVO> ar = reviewService.getListReview(reviewVO);
		
		
		System.out.println(menuVO.getMenuNum());
		
		menuVO.setRestaurantNum(restaurantVO.getRestaurantNum());
		List<MenuVO> menuAr = restaurantService.getListWM(menuVO);
		
		
		
		//전체 리뷰 카운트
		long count = reviewService.countReview(reviewVO);
		
		//맛있어요 리뷰 카운트
		long goodCount = reviewService.goodCount(reviewVO);
		
		//보통이에요 리뷰 카운트
		long normalCount = reviewService.normalCount(reviewVO);
		
		//별로에요 리뷰 카운트
		long badCount = reviewService.badCount(reviewVO);
		
		
		mv.addObject("count",count);	
		mv.addObject("goodCount",goodCount);
		mv.addObject("normalCount",normalCount);
		mv.addObject("badCount",badCount);
		mv.addObject("list",ar);
		mv.addObject("vo",restaurantVO.getCategoryVO()); //카테고리 종류
		mv.addObject("vo1",restaurantVO); //레스토랑 정보
		mv.addObject("menu",menuAr);
		mv.setViewName("restaurant/detail");
		return mv;
		
	}

}
