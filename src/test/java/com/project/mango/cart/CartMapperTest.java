package com.project.mango.cart;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class CartMapperTest {

	@Autowired
	private CartMapper cartMapper;
	
	// @Test
	void cartList() throws Exception{
		CartVO cartVO = new CartVO();
		cartVO.setCartNum(1L);
		List<CartVO> list = cartMapper.cartList(cartVO);
		
		assertNotNull(list);
	}
	
	// @Test
	void cartListDelete() throws Exception{
		int result = cartMapper.cartListDelete(1L);
		
		assertEquals(1, result);
	}
	
	// @Test
	void cartOrder() throws Exception{
		CartVO cartVO = cartMapper.cartOrder(1L);
		
		assertNull(cartVO);
	}

}
