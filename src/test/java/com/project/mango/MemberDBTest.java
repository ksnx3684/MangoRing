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
//	@Test
	void getLogin() throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.getId();
		memberVO.getPw();
		assertNotNull(memberVO);
	}
	
	// 회원가입 테스트
	// 회원가입할 때 1(일반유저), 블랙시스트도 0(정상)으로 초기화
//	@Test
	void addTest() throws Exception {
		MemberVO memberVO = new MemberVO();
		Calendar cal = new GregorianCalendar();
		Date date = new Date(cal.getTimeInMillis());
		memberVO.setId("id2");
		memberVO.setPw("id2");
		memberVO.setName("아이디2");
		memberVO.setEmail("id2@gmail.com");
		memberVO.setPhone("010-9012-3456");
		memberVO.setGender(1L);
		memberVO.setJoinDate(date);
		memberVO.setUserType(1L);
	
		int result = memberMapper.setAddMember(memberVO);
		
		assertEquals(1, result);
		
	}
	
	// 회원정보수정 테스트
//	@Test
	void updateTest() throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("id1");
		memberVO.setName("아이디2");
		memberVO.setEmail("id2@gmail.com");
		memberVO.setPhone("010-9012-3456");
		memberVO.setAddress("테스트 주소");
		
		int result = memberMapper.setUpdate(memberVO);
		
		assertEquals(1, result);
	}
	
	// 회원정보
	@Test
	void deleteTest() throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("id3");
		memberVO.setPw("id3");
		
		int result = memberMapper.setDelete(memberVO);
		
		assertEquals(1, result);
	}

}
