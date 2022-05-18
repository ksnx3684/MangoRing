package com.project.mango.restaurant;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {
	
	public CategoryVO getDetail(CategoryVO categoryVO)throws Exception;

}
