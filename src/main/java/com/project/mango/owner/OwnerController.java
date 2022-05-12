package com.project.mango.owner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.mango.restaurant.RestaurantService;
import com.project.mango.restaurant.RestaurantVO;

@Controller
@RequestMapping(value="owner/*")
public class OwnerController {
	
	@Autowired
	private RestaurantService restaurantService;
	
	@GetMapping("list")
	public ModelAndView getList() throws Exception {
		ModelAndView mv = new ModelAndView();
		RestaurantVO restaurantVO = new RestaurantVO();
		//임시 (로그인 추가되면 수정)
		restaurantVO.setId("owner1");
		restaurantVO = restaurantService.getList(restaurantVO);
		
		mv.addObject("restaurantVO", restaurantVO);
		mv.setViewName("owner/list");
		
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView setAdd(RestaurantVO restaurantVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		restaurantVO = restaurantService.getDetail(restaurantVO);
		
		mv.addObject("restaurantVO", restaurantVO);
		mv.setViewName("owner/add");
		
		return mv;
	}
	

}
