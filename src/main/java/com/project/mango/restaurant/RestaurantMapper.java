package com.project.mango.restaurant;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RestaurantMapper {

	public RestaurantVO getList(RestaurantVO restaurantVO) throws Exception;
	
	public RestaurantVO getDetail(RestaurantVO restaurantVO) throws Exception;
}
