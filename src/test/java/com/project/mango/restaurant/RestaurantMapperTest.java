package com.project.mango.restaurant;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class RestaurantMapperTest {

	@Autowired
	private RestaurantMapper restaurantMapper;
	
	@Test
	void getListTest() throws Exception {
		RestaurantVO restaurantVO = new RestaurantVO();
		restaurantVO.setId("owner1");
		restaurantVO = restaurantMapper.getList(restaurantVO);
		
		assertNotNull(restaurantVO);
	}

}
