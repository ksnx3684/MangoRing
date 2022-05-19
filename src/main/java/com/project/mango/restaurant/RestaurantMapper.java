package com.project.mango.restaurant;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RestaurantMapper {

	public RestaurantVO getList(RestaurantVO restaurantVO) throws Exception;
	
	public RestaurantVO getDetail(RestaurantVO restaurantVO) throws Exception;
	
	public int setRegistration(RestaurantVO restaurantVO) throws Exception;
	
	public int setFileAdd(RestaurantFileVO restaurantFileVO) throws Exception;
	
	public int setFileDelete(RestaurantFileVO restaurantFileVO) throws Exception;
	
	public RestaurantFileVO getFileDetail(RestaurantFileVO restaurantFileVO) throws Exception;
	
	public int setUpdate(RestaurantVO restaurantVO) throws Exception;
	
	public int setDelete(RestaurantVO restaurantVO) throws Exception;
	
	public int setRestaurantTag(Map<String, Long> map) throws Exception;
	
	public RestaurantVO getSelectedList(RestaurantVO restaurantVO) throws Exception;
	
	public int setAllTagDelete (RestaurantVO restaurantVO) throws Exception;
}
