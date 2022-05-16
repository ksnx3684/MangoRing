package com.project.mango.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {
	
	//fileAdd
	public int setFileAdd(ReviewFilesVO reviewFilesVO)throws Exception;
	
	//add
	public int setAdd(ReviewVO reviewVO)throws Exception;
	

}
