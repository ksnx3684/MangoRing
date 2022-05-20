package com.project.mango.notice;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.project.mango.notice.NoticeMapper;
import com.project.mango.notice.NoticeVO;

@SpringBootTest
class NoticeMapperTest {

	@Autowired
	private NoticeMapper noticeMapper;
	
	//@Test
	void setAddTest() throws Exception{
		for(int i=0;i<100;i++) {
			if(i%10==0) {
				Thread.sleep(1000);
			}
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setTitle("titleAdd" + i);
		noticeVO.setId("idAdd"+i);
		noticeVO.setContents("contentsAdd"+i);
		
		int result = noticeMapper.setAdd(noticeVO);
		}
		System.out.println("finish");
	}

}
