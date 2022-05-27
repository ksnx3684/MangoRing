package com.project.mango.promotion;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.util.Pager;

@Mapper
public interface PromotionMapper {
	
	public int setPromotionAdd(PromotionVO promotionVO)throws Exception;	
	
	public List<PromotionVO> getList()throws Exception;
	
	

}
