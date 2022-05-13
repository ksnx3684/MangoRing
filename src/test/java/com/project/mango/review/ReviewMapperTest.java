package com.project.mango.review;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ReviewMapperTest {
	
	@Autowired
	private ReviewMapper reviewMapper;

	@Test
	void setAddTest()throws Exception {
		ReviewVO reviewVO= new ReviewVO();
		
		reviewVO.setStar(1.0F);
		reviewVO.setContents("testContents2");
		int result = reviewMapper.setAdd(reviewVO);
		assertEquals(1, result);
		
	}

}
