package com.project.mango.start;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.mango.promotion.PromotionService;
import com.project.mango.restaurant.RestaurantVO;

@Controller
public class HomeController {
	
	@Autowired
	private PromotionService promotionService;

	@GetMapping("/")
	public String start(Model model) throws Exception{
		
		List<RestaurantVO> seoul = promotionService.nowPro("서울");
		model.addAttribute("seoul", seoul);
		List<RestaurantVO> busan = promotionService.nowPro("부산");
		model.addAttribute("busan", busan);
		List<RestaurantVO> incheon = promotionService.nowPro("인천");
		model.addAttribute("incheon", incheon);
		List<RestaurantVO> daegu = promotionService.nowPro("대구");
		model.addAttribute("daegu", daegu);
		List<RestaurantVO> daejeon = promotionService.nowPro("대전");
		model.addAttribute("daejeon", daejeon);
		List<RestaurantVO> gwangju = promotionService.nowPro("광주");
		model.addAttribute("gwangju", gwangju);
		
		return "index";
	}
}
