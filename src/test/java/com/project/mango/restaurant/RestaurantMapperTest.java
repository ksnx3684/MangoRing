//package com.project.mango.restaurant;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//
//
//import java.util.List;
//
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//@SpringBootTest
//class RestaurantMapperTest {
//
//	@Autowired
//	private RestaurantMapper restaurantMapper;
//	
//	//@Test
//	void getListTest() throws Exception {
//		RestaurantVO restaurantVO = new RestaurantVO();
//		restaurantVO.setId("owner1");
//		restaurantVO = restaurantMapper.getList(restaurantVO);
//		
//		assertNotNull(restaurantVO);
//	}
//	
//	//@Test
//	void getDetailTest() throws Exception {
//		RestaurantVO restaurantVO = new RestaurantVO();
//		restaurantVO.setRestaurantNum(1L);
//		
//		restaurantVO = restaurantMapper.getDetail(restaurantVO);
//		
//		assertNotNull(restaurantVO);
//	}
//	
//	@Test
//	void getSelectedListTest() throws Exception {
//		RestaurantVO restaurantVO = new RestaurantVO();
//		restaurantVO.setRestaurantNum(1L);
//		
//		RestaurantVO tagList = restaurantMapper.getSelectedList(restaurantVO);
//
//		assertNotNull(tagList);
//
//	}
//
//}
