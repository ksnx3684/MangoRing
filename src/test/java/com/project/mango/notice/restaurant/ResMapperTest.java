//package com.project.mango.notice.restaurant;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//@SpringBootTest
//class ResMapperTest {
//
//	@Autowired
//	private ResMapper resMapper;
//	
//	//@Test
//	void setAddTest() throws Exception{
//		for(Long i=0L;i<100;i++) {
//			if(i%10==0) {
//				Thread.sleep(1000);
//			}
//			ResNoticeVO resNoticeVO = new ResNoticeVO();
//			resNoticeVO.setTitle("TitleAdd"+i);
//			resNoticeVO.setId("idAdd"+i);
//			resNoticeVO.setContents("contentsAdd"+i);
//		
//			
//			int result = resMapper.setAdd(resNoticeVO);
//		}
//		System.out.println("끄으읕~!");
//	}
//
//}
