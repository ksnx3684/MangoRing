package com.project.mango.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import com.project.mango.reservation.ReservationVO;
import com.project.mango.restaurant.RestFileVO;
import com.project.mango.restaurant.RestaurantVO;
import com.project.mango.review.ReviewVO;
import com.project.mango.util.FileManager;
import com.project.mango.util.Pager;
import com.project.mango.wishlist.WishlistVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private FileManager fileManager;

	// 회원가입
	public int setAddMember(MemberVO memberVO, MultipartFile[] file) throws Exception {
		
		int result = memberMapper.setAddMember(memberVO);
		
		if(file != null) {
			for(MultipartFile mf : file) {
				if(mf.isEmpty()) {
					continue;
				}
				
				// 1. HDD에 파일 저장
				String fileName = fileManager.fileSave(mf, "/resources/upload/member");
				System.out.println("프로필 사진 이름 출력 : " + fileName);
				
				// 2. DB에 저장
				MemberFileVO memberFileVO = new MemberFileVO();
				memberFileVO.setId(memberVO.getId());
				memberFileVO.setFileName(fileName);
				memberFileVO.setOriName(mf.getOriginalFilename());
				result = memberMapper.setPhoto(memberFileVO);
			}
		}
		return result;
	}
	
	// 회원정보 수정
	public int setUpdate(MemberVO memberVO) throws Exception {
		return memberMapper.setUpdate(memberVO);
	}
	
	// 로그인
	public MemberVO getLogin(MemberVO memberVO) throws Exception {
		return memberMapper.getLogin(memberVO);
	}
	
	// 사용자 정의 검증 메서드 선언
	public boolean memberError(MemberVO memberVO, BindingResult bindingResult) throws Exception {
		
		// check가 false면 검증 성공 : error 없음
		// check가 true면 검증 실패 : error 있음
		boolean check = false;
		
		// 1. Annotation 기본 검증 결과
		check = bindingResult.hasErrors();
		
		// 2. Password가 일치하는지 수동 검증
		if(!memberVO.getPw().equals(memberVO.getCheckPw())) {
			check = true;
			bindingResult.rejectValue("checkPw", "memberjoin.password.notEqual");
		}
		
		// 3. ID 중복 검사
		MemberVO idCheck = memberMapper.getId(memberVO);
		if(idCheck != null) {
			check = true;
			bindingResult.rejectValue("id", "memberjoin.id.overlap");
		}
		
		// 4. 전화번호 중복 검사
		MemberVO phoneCheck = memberMapper.getPhoneNumber(memberVO);
		if(phoneCheck != null) {
			check = true;
			bindingResult.rejectValue("phone", "memberjoin.number.overlap");
		}
		
		// 5. 이메일 중복 검사
		MemberVO emailCheck = memberMapper.getEmail(memberVO);
		if(emailCheck != null) {
			check = true;
			bindingResult.rejectValue("email", "memberjoin.email.overlap");
		}
		
		return check;
	}
	
	// 마이페이지
	public MemberVO getMyPage(MemberVO memberVO) throws Exception {
		return memberMapper.getMyPage(memberVO);
	}
	
	// 사업자 등록
	public int setBusinessApplication(RestaurantVO restaurantVO, MemberVO memberVO,
			MultipartFile[] file) throws Exception {
		
		int result = memberMapper.setBusinessApplication(restaurantVO);
		
		if(file != null) {
			for(MultipartFile mf : file) {
				if(mf.isEmpty()) {
					continue;
				}
				
				// 1. HDD에 파일 저장
				String fileName = fileManager.fileSave(mf, "/resources/upload/business");
				System.out.println("사업자 등록 파일 이름 출력 : " + fileName);
				
				// 2. DB에 저장
				MemberFileVO memberFileVO = new MemberFileVO();
				memberFileVO.setId(memberVO.getId());
				memberFileVO.setFileName(fileName);
				memberFileVO.setOriName(mf.getOriginalFilename());
				result = memberMapper.setPhoto(memberFileVO);
			}
		}
		return result;
	}
	
	// 가게 사진 등록
	public int setRestaurantPhoto(RestaurantVO restaurantVO, MultipartFile[] photo,
			RestFileVO restFileVO) throws Exception {
		
		int result = 0;
		
		if(photo != null) {
			for(MultipartFile mf : photo) {
				if(mf.isEmpty()) {
					continue;
				}
				
				// 1. HDD에 파일 저장
				String fileName = fileManager.fileSave(mf, "/resources/upload/restaurant");
				System.out.println("가게 사진 파일 이름 출력 : " + fileName);
				
				// 2. DB에 저장
				restFileVO.setRestaurantNum(restaurantVO.getRestaurantNum());
				restFileVO.setFileName(fileName);
				restFileVO.setOriName(mf.getOriginalFilename());
				
				result = memberMapper.setRestaurantPhoto(restFileVO);
			}
			
		}
		
		return result;
	}
	
	// 사업자 등록 후 승인대기
	public int setBusinessUserType(MemberVO memberVO) throws Exception {
		return memberMapper.setBusinessUserType(memberVO);
	}
	
	// 위시리스트
	public int setWishlist(WishlistVO wishlistVO) throws Exception {
		return memberMapper.setWishlist(wishlistVO);
	}
	
	// 위시리스트 조회
	public List<WishlistVO> getWishlist(String id, Pager pager) throws Exception {
		
		WishlistVO wishlistVO = new WishlistVO();
		wishlistVO.setId(id);
		
		// 한 페이지에 위시리스트 5개씩 출력
		pager.setPerPage(5);
		pager.makeRow();
		pager.makeNum(memberMapper.getTotalWishCount(wishlistVO));
		
		return memberMapper.getWishlist(id, pager);
	}
	
	// 위시리스트 삭제
	public int setDeleteWishlist(WishlistVO wishlistVO) throws Exception {
		return memberMapper.setDeleteWishlist(wishlistVO);
	}
	
	// 평점 리스트 조회
	public List<ReviewVO> getRatingList(String id, Pager pager) throws Exception {
		
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setId(id);
		
		pager.setPerPage(5);
		pager.makeRow();
		pager.makeNum(memberMapper.getTotalRatingCount(reviewVO));
		
		return memberMapper.getRatingList(id, pager);
	}
	
	// 예약 리스트 조회
	public List<ReservationVO> getMyReservationList(String id, Pager pager) throws Exception {
		
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setId(id);
		
		pager.setPerPage(5);
		pager.makeRow();
		pager.makeNum(memberMapper.getTotalReservationCount(reservationVO));
		
		return memberMapper.getMyReservationList(id, pager);
	}
	
	// 회원 탈퇴
	public int setDelete(MemberVO vo) throws Exception {
		
		List<MemberFileVO> ar = memberMapper.getFileList(vo);
		int result = memberMapper.setDelete(vo);
		
		for(MemberFileVO m : ar) {
//			MemberFileVO memberFileVO = new MemberFileVO();
			fileManager.fileDelete(m.getFileName(), "/resources/upload/member");
			fileManager.fileDelete(m.getFileName(), "/resources/upload/business");
		}
		
		return result;
	}
	
	//멤버 리스트조회
	public List<MemberVO> getList(MemberVO memberVO) throws Exception {
		return memberMapper.getList(memberVO);
	}
	
	// 멤버권한변경요청 리스트
	public List<MemberVO> getMemberChange(MemberVO memberVO) throws Exception{
		return memberMapper.getMemberChange(memberVO);
	}
	
	// 멤버권한변경요청 디테일
	public MemberVO getMemberChangeDetail(MemberVO memberVO) throws Exception{
		return memberMapper.getMemberChangeDetail(memberVO);
	}
}
