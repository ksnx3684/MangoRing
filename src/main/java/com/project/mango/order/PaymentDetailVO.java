package com.project.mango.order;

import com.project.mango.menu.MenuVO;

import lombok.Data;

@Data
public class PaymentDetailVO {

	private Long payDetailNum;
	private Long payNum;
	private Long menuNum;
	private Integer menuCount;
	
	private MenuVO menuVO;
	
}
