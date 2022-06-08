package com.project.mango.order;

import java.sql.Date;
import java.util.List;

import com.project.mango.member.MemberVO;

import lombok.Data;

@Data
public class PaymentVO {

	private String payNum;
	private String id;
	private Long restaurantNum;
	private Long payCheck;
	private Long totalPrice;
	private Date payDate;
	private Long waiting;
	private Long status;
	private String payType;
	
	private List<PaymentDetailVO> paymentDetailVOs;
	private MemberVO memberVO;
	
}
