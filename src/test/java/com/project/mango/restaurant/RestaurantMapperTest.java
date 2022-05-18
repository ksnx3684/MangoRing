package com.project.mango.restaurant;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
@SpringBootTest
class RestaurantMapperTest {
	
	@Autowired
	private CategoryMapper categoryMapper;

	@Test
	void getDetailTest() throws Exception{
		CategoryVO categoryVO = new CategoryVO();
		categoryVO.setCategoryNum(1L);
		
		categoryVO = categoryMapper.getDetail(categoryVO);
		
		assertNotNull(categoryVO);
	}

}
