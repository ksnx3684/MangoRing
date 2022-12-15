//package com.project.mango.promotion;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//@SpringBootTest
//class PromotionMapperTest {
//	
//	@Autowired
//	private PromotionMapper promotionMapper;
//
//	@Test
//	void setPromotionAddTest() throws Exception{
//		PromotionVO promotionVO = new PromotionVO();
//		promotionVO.setRestaurantNum(1L);
//		promotionVO.setId("master");
//		promotionVO.setPromotionName("테스트중");
//		promotionVO.setPromotionDetail("테스트애드");
//		promotionVO.setDiscount(1000L);
//		int result = promotionMapper.setPromotionAdd(promotionVO);
//		
//		assertEquals(1, result);
//		
//		
//	}
//
//}
