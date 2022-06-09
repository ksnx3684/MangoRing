package com.project.mango.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.member.MemberVO;
import com.project.mango.order.PaymentDetailVO;
import com.project.mango.order.PaymentVO;
import com.project.mango.restaurant.RestaurantVO;

@Mapper
public interface CartMapper {

	// cartCheck
	public List<CartVO> cartCheck(CartVO cartVO) throws Exception;
	
	// cartAdd
	public int cartAdd(CartVO cartVO) throws Exception;
	
	// cartList
	public List<CartVO> cartList(CartVO cartVO) throws Exception;
	
	// cartCountPlus
	public int cartCountPlus(CartVO cartVO) throws Exception;
	
	// cartCountMinus
	public int cartCountMinus(CartVO cartVO) throws Exception;
	
	// cartListDelete
	public int cartListDelete(Long caNum) throws Exception;
	
	// cartOrder
	public CartVO cartOrder(Long cartNum) throws Exception;

	// packingOrder
	public CartVO packingOrder(Long menuNum) throws Exception;
	
	// clear
	public int clear(MemberVO memberVO) throws Exception;
	
	// order
	public int order(PaymentVO paymentVO) throws Exception;
	
	// detailOrder
	public int detailOrder(PaymentDetailVO paymentDetailVO) throws Exception;
	
	// payOrderComplete
	public int payOrderComplete(PaymentVO paymentVO) throws Exception;
	
	// accountnum
	public String accountnum(Long l) throws Exception;
}
