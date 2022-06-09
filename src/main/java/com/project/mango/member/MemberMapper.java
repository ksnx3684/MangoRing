package com.project.mango.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.mango.order.PaymentVO;
import com.project.mango.reservation.ReservationVO;
import com.project.mango.restaurant.RestFileVO;
import com.project.mango.restaurant.RestaurantVO;
import com.project.mango.review.ReviewVO;
import com.project.mango.util.Pager;
import com.project.mango.wishlist.WishlistVO;

@Mapper
public interface MemberMapper {
	
	// 회원가입
	public int setAddMember(MemberVO memberVO) throws Exception;
	
	// 사진 등록
	public int setPhoto(MemberFileVO memberFileVO) throws Exception;
	
	// 프로필 사진 리스트
	public List<MemberFileVO> getFileList(MemberVO memberVO) throws Exception;
	
	// 회원정보수정
	public int setUpdate(MemberVO memberVO) throws Exception;

	// 로그인
	public MemberVO getLogin(MemberVO memberVO) throws Exception;
	
	// 중복 아이디 조회
	public MemberVO getId(MemberVO memberVO) throws Exception;
	
	// 중복 번호 조회
	public MemberVO getPhoneNumber(MemberVO memberVO) throws Exception;
	
	// 중복 이메일 조회
	public MemberVO getEmail(MemberVO memberVO) throws Exception;
	
	// 마이페이지
	public MemberVO getMyPage(MemberVO memberVO) throws Exception;
	
	// 사업자 등록
	public int setBusinessApplication(RestaurantVO restaurantVO) throws Exception;
	
	// 가게사진 등록
	public int setRestaurantPhoto(RestFileVO restFileVO) throws Exception;
		
	// 사업자 등록 후 승인대기
	public int setBusinessUserType(MemberVO memberVO) throws Exception;
	
	// 위시리스트 갯수
	public Long getTotalWishCount(WishlistVO wishlistVO) throws Exception;
	
	// 위시리스트
	public int setWishlist(WishlistVO wishlistVO) throws Exception;
	
	// 위시리스트 조회
	public List<WishlistVO> getWishlist(@Param("id")String id, @Param("pager")Pager pager) throws Exception;
	
	// 위시리스트 삭제
	public int setDeleteWishlist(WishlistVO wishlistVO) throws Exception;
	
	// 평점 리스트 조회
	public List<ReviewVO> getRatingList(@Param("id")String id, @Param("pager")Pager pager) throws Exception;
	
	// 평점 리스트 갯수
	public Long getTotalRatingCount(ReviewVO reviewVO) throws Exception;
	
	// 예약 내역 조회
	public List<ReservationVO> getMyReservationList(@Param("id")String id, @Param("pager")Pager pager) throws Exception;
	
	// 예약 리스트 갯수
	public Long getTotalReservationCount(ReservationVO reservationVO) throws Exception;
	
	// 결제 내역 조회
	public List<PaymentVO> getPaymentList(String id, Pager pager) throws Exception;
	
	// 결제 리스트 갯수
	public Long getTotalPaymentCount(PaymentVO paymentVO) throws Exception;
	
	// 회원 탈퇴
	public int setDelete(MemberVO vo) throws Exception;
	
	//멤버 리스트 조회
	public List<MemberVO> getList(MemberVO memberVO) throws Exception;
	
	//멤버 권한변경 조회
	public List<MemberVO> getMemberChange(MemberVO memberVO) throws Exception;
	
	//멤버 권한변경 디테일 조회
	public MemberVO getMemberChangeDetail(MemberVO memberVO) throws Exception;
	
	//블랙리스트 조회
	public List<MemberVO> getBlackList (MemberVO memberVO) throws Exception;
}
