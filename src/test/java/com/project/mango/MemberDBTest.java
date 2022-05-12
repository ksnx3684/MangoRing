package com.project.mango;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.project.mango.member.MemberMapper;
import com.project.mango.member.MemberVO;

@SpringBootTest
class MemberDBTest {
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private MemberMapper memberMapper;
	
	// DB 연결 테스트
//	@Test
	void DBConnect() throws Exception {
		assertNotNull(dataSource.getConnection());
	}
	
	// 로그인 테스트
	@Test
	void getLogin() throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.getId();
		memberVO.getPw();
		assertNotNull(memberVO);
	}
	
	// 회원가입 테스트
//	@Test
	void addTest() throws Exception {
		MemberVO memberVO = new MemberVO();
		Calendar cal = new GregorianCalendar();
		Date date = new Date(cal.getTimeInMillis());
		memberVO.setId("id1");
		memberVO.setPw("id1");
		memberVO.setName("아이디1");
		memberVO.setEmail("id1@gmail.com");
		memberVO.setPhone("010-1234-5678");
		memberVO.setGender(0L);
		memberVO.setJoinDate(date);
		memberVO.setUserType(1L);
		memberVO.setBusinessNum("1234");
		memberVO.setPostCode("123-45");
		memberVO.setAddress("서울특별시 마포구 서교동");
		memberVO.setDetailAddress("447-5 풍성빌딩");
		memberVO.setExtraAddress("2,3,4층");
		memberVO.setBlackList(0L);
		
		int result = memberMapper.setAddMember(memberVO);
		
		assertEquals(1, result);
		
	}

}
