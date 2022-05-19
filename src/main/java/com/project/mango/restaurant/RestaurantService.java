package com.project.mango.restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mango.menu.MenuVO;

@Service
public class RestaurantService {
	
	@Autowired
	private RestaurantMapper restaurantMapper;

	public RestaurantVO getDetail(RestaurantVO restaurantVO)throws Exception{
		return restaurantMapper.getDetail(restaurantVO); 
	}
	
	public List<MenuVO> getList(MenuVO menuVO)throws Exception{
		return restaurantMapper.getList(menuVO);
	}
	
}
