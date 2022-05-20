package com.project.mango.menu;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.project.mango.restaurant.RestaurantVO;

@SpringBootTest
class MenuMapperTest {

	@Autowired
	private MenuMapper menuMapper;
	
	@Test
	void getListTest() throws Exception {
		RestaurantVO restaurantVO = new RestaurantVO();
		restaurantVO.setRestaurantNum(1L);

		List<MenuVO> menuVOs = menuMapper.getList(restaurantVO);
		
		assertNotNull(menuVOs);
	}

}
