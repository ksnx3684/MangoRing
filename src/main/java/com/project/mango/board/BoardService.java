package com.project.mango.board;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.mango.util.Pager;

@Service
public interface BoardService {
	
	//list
	public List<BoardVO> getList(Pager pager) throws Exception;
	
	//detail
	public BoardVO getDetail(BoardVO boardVO) throws Exception;
	
	//add
	public int setAdd(BoardVO boardVO) throws Exception;
	
	//update
	public int setUpdate(BoardVO boardVO)throws Exception;
	
	//delete
	public int setDelete(BoardVO boardVO) throws Exception;
	
	//totalCount
	public Long getTotalCount(Pager pager) throws Exception;

}
