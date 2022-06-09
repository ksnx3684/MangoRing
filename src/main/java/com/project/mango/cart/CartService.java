package com.project.mango.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.mango.member.MemberVO;
import com.project.mango.order.PaymentDetailVO;
import com.project.mango.order.PaymentVO;

@Service
@Transactional(rollbackFor = Exception.class)
public class CartService {

	@Autowired
	private CartMapper cartMapper;
	
	public List<CartVO> cartCheck(CartVO cartVO) throws Exception{
		return cartMapper.cartCheck(cartVO);
	}
	
	public int cartAdd(CartVO cartVO) throws Exception{
		return cartMapper.cartAdd(cartVO);
	}
	
	public List<CartVO> cartList(CartVO cartVO) throws Exception{
		return cartMapper.cartList(cartVO);
	}
	
	public int cartCountPlus(CartVO cartVO) throws Exception{
		return cartMapper.cartCountPlus(cartVO);
	}
	
	public int cartCountMinus(CartVO cartVO) throws Exception{
		return cartMapper.cartCountMinus(cartVO);
	}
	
	public int cartListDelete(Long caNum) throws Exception{
		return cartMapper.cartListDelete(caNum);
	}
	
	public CartVO cartOrder(Long cartNum) throws Exception{
		return cartMapper.cartOrder(cartNum);
	}
	
	public CartVO packingOrder(Long menuNum) throws Exception{
		return cartMapper.packingOrder(menuNum);
	}
	
	public int clear(MemberVO memberVO) throws Exception{
		return cartMapper.clear(memberVO);
	}
	
	public int order(PaymentVO paymentVO) throws Exception{
		return cartMapper.order(paymentVO);			
	}
	
	public int detailOrder(PaymentDetailVO paymentDetailVO) throws Exception{
		return cartMapper.detailOrder(paymentDetailVO);
	}
	
	public int payOrderComplete(PaymentVO paymentVO) throws Exception{
		return cartMapper.payOrderComplete(paymentVO);
	}

}
