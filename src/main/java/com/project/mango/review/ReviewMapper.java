package com.project.mango.review;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {
	
	
	//add
	public int setAdd(ReviewVO reviewVO)throws Exception;
	

}
