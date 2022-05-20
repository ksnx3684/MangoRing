package com.project.mango.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CartMapper {

	// cartlist
	public List<CartVO> cartlist(CartVO cartVO) throws Exception;
}
