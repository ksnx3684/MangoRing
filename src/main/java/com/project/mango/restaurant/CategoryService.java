package com.project.mango.restaurant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryMapper categoryMapper;
	
	public CategoryVO getDetail(CategoryVO categoryVO)throws Exception{
		return categoryMapper.getDetail(categoryVO); 
	}
	
	

}
