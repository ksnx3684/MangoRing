package com.project.mango.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import com.project.mango.restaurant.RestaurantVO;
import com.project.mango.util.FileManager;



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
				result = memberMapper.setProfile(memberFileVO);
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
		
		return check;
	}
	
	// 마이페이지
	public MemberVO getMyPage(MemberVO memberVO) throws Exception {
		return memberMapper.getMyPage(memberVO);
	}
	
	// 사업자 등록
	public int setBusinessApplication(RestaurantVO restaurantVO) throws Exception {
		return memberMapper.setBusinessApplication(restaurantVO);
	}
	
	// 사업자 등록 후 승인대기
	public int setBusinessUserType(MemberVO memberVO) throws Exception {
		return memberMapper.setBusinessUserType(memberVO);
	}
	
	// 회원 탈퇴
	public int setDelete(MemberVO vo) throws Exception {
		
		List<MemberFileVO> ar = memberMapper.getFileList(vo);
		int result = memberMapper.setDelete(vo);
		
		for(MemberFileVO m : ar) {
//			MemberFileVO memberFileVO = new MemberFileVO();
			fileManager.fileDelete(m.getFileName(), "/resources/upload/member");			
		}
		
		return result;
	}
}
