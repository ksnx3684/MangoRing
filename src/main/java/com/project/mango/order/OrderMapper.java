package com.project.mango.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.util.PackagePager;
import com.project.mango.util.ReservationPager;

@Mapper
public interface OrderMapper {

	public List<PaymentVO> getOrderList(PackagePager packagePager) throws Exception;
	public Long getOrderListCount(PackagePager packagePager) throws Exception;
	
}
