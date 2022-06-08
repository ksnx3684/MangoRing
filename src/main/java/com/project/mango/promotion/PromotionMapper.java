package com.project.mango.promotion;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.restaurant.RestaurantVO;
import com.project.mango.util.Pager;

@Mapper
public interface PromotionMapper {
	
	public int setPromotionAdd(PromotionVO promotionVO)throws Exception;	
	
	public List<PromotionVO> getList()throws Exception;
	
	public List<RestaurantVO> nowPro(String site) throws Exception;
	
//	public List<RestaurantVO> prolist() throws Exception;
	
	public List<RestaurantVO> menulist() throws Exception;
	
	public int proCommit(RestaurantVO restaurantVO) throws Exception;
	
	public int proClear(RestaurantVO restaurantVO) throws Exception;
}
