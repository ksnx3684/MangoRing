package com.project.mango.order;

import java.sql.Date;

import lombok.Data;

@Data
public class PaymentVO {

	private String payNum;
	private Long payCheck;
	private Long totalPrice;
	private Date payDate;
	private Long waiting;
	private Long status;
	private String payType;
	private String id;
	
}
