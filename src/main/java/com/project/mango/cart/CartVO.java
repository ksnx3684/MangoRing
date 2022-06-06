package com.project.mango.cart;

import java.util.List;

import com.project.mango.menu.MenuVO;

import lombok.Data;

@Data
public class CartVO {

	private Long cartNum;
	private String id;
	private Long menuNum;
	private Long menuCount;
	
	private MenuVO menuVOs;
//	private List<MenuVO> menuVOss;
}
