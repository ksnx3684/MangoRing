package com.project.mango.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.util.Pager;

@Mapper
public interface BoardMapper {

	//list
	public List<BoardVO> getList(Pager pager) throws Exception;
	
	//detail
	public BoardVO getDetail(BoardVO boardVO) throws Exception;
	
	//add
	public int setAdd(BoardVO boardVO) throws Exception;
	
	//update
	public int setUpdate(BoardVO boardVO)throws Exception;
	
	//delete
	public int setDelete (BoardVO boardVO) throws Exception;
	
	//totalCount
	public Long getTotalCount(Pager pager) throws Exception;
	
}
