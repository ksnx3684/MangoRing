package com.project.mango.promotion;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mango.restaurant.RestaurantVO;
import com.project.mango.util.Pager;

@Service
public class PromotionService {

	@Autowired
	private PromotionMapper promotionMapper;
	
	public int setPromotionAdd(PromotionVO promotionVO)throws Exception{
		return promotionMapper.setPromotionAdd(promotionVO); 
	}
	
	public List<PromotionVO> getList()throws Exception{

		return promotionMapper.getList();
	}
	
	public List<RestaurantVO> nowPro(String site) throws Exception{
		return promotionMapper.nowPro(site);
	}
	
//	public List<RestaurantVO> prolist() throws Exception{
//		return promotionMapper.prolist();
//	}
	
	public List<RestaurantVO> menulist() throws Exception{
		return promotionMapper.menulist();
	}
	
	public int proCommit(RestaurantVO restaurantVO) throws Exception{
		return promotionMapper.proCommit(restaurantVO);
	}
	
	public int proClear(RestaurantVO restaurantVO) throws Exception{
		return promotionMapper.proClear(restaurantVO);
	}
}
