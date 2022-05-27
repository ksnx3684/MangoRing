package com.project.mango.member;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.project.mango.category.CategoryVO;
import com.project.mango.restaurant.RestaurantVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {

	// 아이디
	@NotBlank(message = "아이디를 입력해 주세요")
	private String id;
	// 비밀번호
	@NotBlank(message = "비밀번호를 입력해 주세요")
	private String pw;
	// 비밀번호 체크
	private String checkPw;
	// 이름
	@NotBlank(message = "이름을 입력하세요")
	private String name;
	// 이메일
	@NotBlank(message = "이메일을 입력하세요")
	private String email;
	// 전화번호
	@NotBlank(message = "번호를 입력하세요")
	private String phone;
	// 성별
	@NotNull(message = "성별을 선택하세요")
	private Long gender;
	// 가입일자
	private Date joinDate;
	// 회원타입
	private Long userType;
	// 사업자번호
	private String businessNum;
	// 우편번호
	private String postCode;
	// 주소
	private String address;
	// 상세주소
	private String detailAddress;
	// 참고항목
	private String extraAddress;
	// 블랙리스트
	private Long blackList;
	// 사업자승인 여부
	private Long businessOk;
	
	// 프로필 사진
	private MemberFileVO memberFileVO;
	
	// 식당 VO
	private RestaurantVO restaurantVO;
	
}
