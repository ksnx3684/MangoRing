package com.project.mango.hashtag;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HashtagService {

	@Autowired
	private HashtagMapper hashtagMapper;

	public List<HashtagVO> getList() throws Exception {
		return hashtagMapper.getList();
	}
	
}
