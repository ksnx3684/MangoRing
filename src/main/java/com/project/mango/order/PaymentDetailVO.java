package com.project.mango.order;

import com.project.mango.menu.MenuVO;

import lombok.Data;

@Data
public class PaymentDetailVO {

	private Long payDetailNum;
	private String payNum;
	private Long menuNum;
	private Long menuCount;
	
	private MenuVO menuVO;
	
}
