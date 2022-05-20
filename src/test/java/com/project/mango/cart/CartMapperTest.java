package com.project.mango.cart;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class CartMapperTest {

	@Autowired
	private CartMapper cartMapper;
	
	@Test
	void cartlist() throws Exception{
		CartVO cartVO = new CartVO();
		cartVO.setCartNum(1L);
		List<CartVO> list = cartMapper.cartlist(cartVO);
		
		assertNotNull(list);
	}

}
