package com.project.mango.promotion;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
