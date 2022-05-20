package com.project.mango.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class CartService {

	@Autowired
	private CartMapper cartMapper;
	
	public List<CartVO> cartlist(CartVO cartVO) throws Exception{
		return cartMapper.cartlist(cartVO);
	}
}
