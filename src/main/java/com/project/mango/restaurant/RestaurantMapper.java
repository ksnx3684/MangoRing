package com.project.mango.restaurant;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.member.MemberVO;
import com.project.mango.menu.MenuVO;

	

import java.util.Map;



@Mapper
public interface RestaurantMapper {
	
	public RestaurantVO getDetailWM(RestaurantVO restaurantVO)throws Exception;
	
	public List<MenuVO> getListWM(MenuVO menuVO)throws Exception;

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
	
	public RestaurantVO getRestaurantNum(MemberVO memberVO) throws Exception;
	
	//권한변경 디테일 조회
	public RestaurantVO getMemberChangeDetail(MemberVO memberVO) throws Exception;
	
	//리스트출력
	public List<RestaurantVO> getResList(RestaurantVO restaurantVO) throws Exception;

}
