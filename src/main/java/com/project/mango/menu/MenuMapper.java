package com.project.mango.menu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.restaurant.RestaurantVO;

@Mapper
public interface MenuMapper {

	public List<MenuVO> getList(RestaurantVO restaurantVO) throws Exception;
	
	public int setAdd(MenuVO menuVO) throws Exception;
	
	public int setFileAdd(MenuFileVO menuFileVO) throws Exception;
	
	public int setFileDelete(MenuFileVO menuFileVO) throws Exception;
	
	public MenuFileVO getFileDetail(MenuFileVO menuFileVO) throws Exception;
	
	public int setUpdate(MenuVO menuVO) throws Exception;
	
	public int setDelete(MenuVO menuVO) throws Exception;
	
	
}
