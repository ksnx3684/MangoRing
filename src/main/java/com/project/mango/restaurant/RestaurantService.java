package com.project.mango.restaurant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RestaurantService {

	@Autowired
	private RestaurantMapper restaurantMapper;
	
	public RestaurantVO getList(RestaurantVO restaurantVO) throws Exception {
		return restaurantMapper.getList(restaurantVO);
	}
	
	public RestaurantVO getDetail(RestaurantVO restaurantVO) throws Exception {
		return restaurantMapper.getDetail(restaurantVO);
	}
	
}
