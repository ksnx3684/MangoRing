package com.project.mango.restaurant;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.mango.review.ReviewService;
import com.project.mango.review.ReviewVO;

@Controller
@RequestMapping("/restaurant/*")
public class RestaurantController {
	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ReviewService reviewService;

	
	@GetMapping("detail")
	public ModelAndView getDetail(CategoryVO categoryVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//레스토랑 정보 , 카테고리 종류
		categoryVO = categoryService.getDetail(categoryVO);
		System.out.println(categoryVO.getRestaurantVO().getRestaurantName());
		System.out.println(categoryVO.getCategoryName());
		
		//리뷰 디테일로 가는 리스트
		ReviewVO reviewVO =new ReviewVO();
		reviewVO.setRestaurantNum(categoryVO.getRestaurantVO().getRestaurantNum());
		
		List<ReviewVO> ar = reviewService.getListReview(reviewVO);
		System.out.println();
		
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
		mv.addObject("vo",categoryVO); //카테고리 종류
		mv.addObject("vo1",categoryVO.getRestaurantVO()); //레스토랑 정보
		mv.setViewName("restaurant/detail");
		return mv;
		
	}

}
