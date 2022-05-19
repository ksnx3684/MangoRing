package com.project.mango.hashtag;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HashtagMapper {

	public List<HashtagVO> getList() throws Exception;
	
}
