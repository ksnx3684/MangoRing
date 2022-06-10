package com.project.mango.promotion;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.member.MemberVO;
import com.project.mango.menu.MenuVO;
import com.project.mango.restaurant.RestaurantVO;

@Mapper
public interface PromotionMapper {
	
	public int setPromotionAdd(PromotionVO promotionVO)throws Exception;	
	
	public List<PromotionVO> getList(MemberVO memberVO)throws Exception;
	
	public List<RestaurantVO> nowPro(String site) throws Exception;
	
	public List<MenuVO> menulist(MenuVO menuVO) throws Exception;
	
	public int proCommit(Map<String, Object> map) throws Exception;
	
	public int proClear(RestaurantVO restaurantVO) throws Exception;
}
