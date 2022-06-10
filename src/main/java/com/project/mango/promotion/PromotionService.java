package com.project.mango.promotion;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mango.member.MemberVO;
import com.project.mango.menu.MenuVO;
import com.project.mango.restaurant.RestaurantVO;

@Service
public class PromotionService {

	@Autowired
	private PromotionMapper promotionMapper;
	
	public int setPromotionAdd(PromotionVO promotionVO)throws Exception{
		return promotionMapper.setPromotionAdd(promotionVO); 
	}
	
	public List<PromotionVO> getList(MemberVO memberVO )throws Exception{

		return promotionMapper.getList(memberVO);
	}
	
	public List<RestaurantVO> nowPro(String site) throws Exception{
		return promotionMapper.nowPro(site);
	}
	
	public List<MenuVO> menulist(MenuVO menuVO) throws Exception{
		return promotionMapper.menulist(menuVO);
	}
	
	public int proCommit(Map<String, Object> map) throws Exception{
		return promotionMapper.proCommit(map);
	}
	
	public int proClear(RestaurantVO restaurantVO) throws Exception{
		return promotionMapper.proClear(restaurantVO);
	}
}
