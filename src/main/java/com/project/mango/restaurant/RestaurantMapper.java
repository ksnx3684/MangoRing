package com.project.mango.restaurant;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.menu.MenuVO;

@Mapper
public interface RestaurantMapper {
	
	public RestaurantVO getDetail(RestaurantVO restaurantVO)throws Exception;
	
	public List<MenuVO> getList(MenuVO menuVO)throws Exception;

}
