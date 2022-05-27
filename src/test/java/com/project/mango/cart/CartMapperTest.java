package com.project.mango.cart;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.project.mango.order.PaymentDetailVO;
import com.project.mango.order.PaymentVO;

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
	
	// @Test
	void order() throws Exception{
		PaymentVO paymentVO = new PaymentVO();
		paymentVO.setId("ksnx3684");
		paymentVO.setTotalPrice(10000L);
		
		int result = cartMapper.order(paymentVO);
		
		assertEquals(1, result);
	}
	
	// @Test
	void detailOrder() throws Exception{
		PaymentDetailVO paymentDetailVO = new PaymentDetailVO();
		paymentDetailVO.setMenuNum(1L);
		paymentDetailVO.setMenuCount(1L);
		
		int result = cartMapper.detailOrder(paymentDetailVO);
		
		assertEquals(1, result);
	}

}
