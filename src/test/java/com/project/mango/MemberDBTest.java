//package com.project.mango;
//
//import static org.junit.jupiter.api.Assertions.assertEquals;
//import static org.junit.jupiter.api.Assertions.assertNotNull;
//
//import java.sql.Date;
//import java.util.Calendar;
//import java.util.GregorianCalendar;
//
//import javax.sql.DataSource;
//
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import com.project.mango.member.MemberFileVO;
//import com.project.mango.member.MemberMapper;
//import com.project.mango.member.MemberVO;
//import com.project.mango.restaurant.RestFileVO;
//import com.project.mango.restaurant.RestaurantVO;
//import com.project.mango.wishlist.WishlistVO;
//
//@SpringBootTest
//class MemberDBTest {
//	
//	@Autowired
//	private DataSource dataSource;
//	
//	@Autowired
//	private MemberMapper memberMapper;
//	
//	// DB 연결 테스트
////	@Test
//	void DBConnect() throws Exception {
//		assertNotNull(dataSource.getConnection());
//	}
//	
//	// 로그인 테스트
////	@Test
//	void getLogin() throws Exception {
//		MemberVO memberVO = new MemberVO();
//		memberVO.getId();
//		memberVO.getPw();
//		assertNotNull(memberVO);
//	}
//	
//	// 회원가입 테스트
//	// 회원가입할 때 1(일반유저), 블랙시스트도 0(정상)으로 초기화
////	@Test
//	void addTest() throws Exception {
//		MemberVO memberVO = new MemberVO();
//		Calendar cal = new GregorianCalendar();
//		Date date = new Date(cal.getTimeInMillis());
//		memberVO.setId("id2");
//		memberVO.setPw("id2");
//		memberVO.setName("아이디2");
//		memberVO.setEmail("id2@gmail.com");
//		memberVO.setPhone("010-9012-3456");
//		memberVO.setGender(1L);
//		memberVO.setJoinDate(date);
//		memberVO.setUserType(1L);
//	
//		int result = memberMapper.setAddMember(memberVO);
//		
//		assertEquals(1, result);
//		
//	}
//	
//	// 회원정보수정 테스트
////	@Test
//	void updateTest() throws Exception {
//		MemberVO memberVO = new MemberVO();
//		memberVO.setId("id1");
//		memberVO.setName("아이디2");
//		memberVO.setEmail("id2@gmail.com");
//		memberVO.setPhone("010-9012-3456");
//		memberVO.setAddress("테스트 주소");
//		
//		int result = memberMapper.setUpdate(memberVO);
//		
//		assertEquals(1, result);
//	}
//	
//	// 회원정보 삭제
////	@Test
//	void deleteTest() throws Exception {
//		MemberVO memberVO = new MemberVO();
//		memberVO.setId("id3");
//		memberVO.setPw("id3");
//		
//		int result = memberMapper.setDelete(memberVO);
//		
//		assertEquals(1, result);
//	}
//	
//	// 사업자 신청
////	@Test
//	void setBusinessApplication() throws Exception {
//		RestaurantVO restaurantVO = new RestaurantVO();
//		restaurantVO.setId("id6");
//		restaurantVO.setBusinessNum("111-22-33333");
//		restaurantVO.setAddress("테스트 주소");
//		restaurantVO.setIntroduction("테스트 한줄평");
//		restaurantVO.setParkingCheck(1L);
//		restaurantVO.setKidCheck(1L);
//		
//		int result = memberMapper.setBusinessApplication(restaurantVO);
//		
//		assertEquals(1, result);
//	}
//	
//	// 가게 사진 업로드
////	@Test
//	void setRestaurantPhoto() throws Exception {
//		RestFileVO restFileVO = new RestFileVO();
//		restFileVO.setRestaurantNum(32L);
//		restFileVO.setFileName("파일테스트");
//		restFileVO.setOriName("원본이름 테스트");
//		
//		int result = memberMapper.setRestaurantPhoto(restFileVO);
//		
//		assertEquals(1, result);
//	}
//	
//	// 포르필 사진 업로드
////	@Test
//	void setPhotoTest() throws Exception {
//		MemberFileVO memberFileVO = new MemberFileVO();
//		memberFileVO.setId("id1");
//		memberFileVO.setFileName("파일 테스트");
//		memberFileVO.setOriName("원본 파일 테스트");
//		
//		int result = memberMapper.setPhoto(memberFileVO);
//		
//		assertEquals(1, result);
//	}
//	
//	// 위시리스트 테스트
////	@Test
//	void setWishlist() throws Exception {
//		WishlistVO wishlistVO = new WishlistVO();
//		wishlistVO.setRestaurantNum(1L);
//		wishlistVO.setId("id1");
//		wishlistVO.setCategoryNum(100L);
//		
//		int result = memberMapper.setWishlist(wishlistVO);
//		
//		assertEquals(1, result);
//	}
//}
