package com.project.mango.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.restaurant.RestaurantVO;
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
	
	// 마이페이지
	public MemberVO getMyPage(MemberVO memberVO) throws Exception;
	
	// 사업자 등록
	public int setBusinessApplication(RestaurantVO restaurantVO) throws Exception;
		
	// 사업자 등록 후 승인대기
	public int setBusinessUserType(MemberVO memberVO) throws Exception;
	
	// 위시리스트
	public int setWishlist(WishlistVO wishlistVO) throws Exception;
	
	// 위시리스트 조회
	public List<WishlistVO> getWishlist(String id) throws Exception;
	
	// 위시리스트 삭제
	public int setDeleteWishlist(WishlistVO wishlistVO) throws Exception;
	
	// 회원 탈퇴
	public int setDelete(MemberVO vo) throws Exception;
	
}
