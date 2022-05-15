package com.project.mango.search;

import lombok.Data;

@Data
public class SearchVO {

	private String address;
	private String detailAddress;
	private float star;
	private String name;
	private Long parkingCheck;
	private Long kidCheck;
	private Long[] tagNum;
	
}
