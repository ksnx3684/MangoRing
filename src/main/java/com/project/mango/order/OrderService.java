package com.project.mango.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mango.restaurant.RestaurantVO;
import com.project.mango.util.PackagePager;
import com.project.mango.util.ReservationPager;

@Service
public class OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	public List<PaymentVO> getOrderList(PackagePager packagePager) throws Exception {
		
		packagePager.setPerPage(5);
		packagePager.makeRow();
		packagePager.makeNum(orderMapper.getOrderListCount(packagePager));
		
		return orderMapper.getOrderList(packagePager);
	}
	
	public PaymentVO getOrderDetail(PaymentVO paymentVO) throws Exception {
		return orderMapper.getOrderDetail(paymentVO);
	}
	
	public int setWaitingUpdate(PaymentVO paymentVO) throws Exception {
		return orderMapper.setWaitingUpdate(paymentVO);
	}
	
	public int setVisitUpdate(PaymentVO paymentVO) throws Exception {
		return orderMapper.setVisitUpdate(paymentVO);
	}
	
}
