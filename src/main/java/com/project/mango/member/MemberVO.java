package com.project.mango.member;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {

	// 아이디
	private String id;
	// 비밀번호
	private String pw;
	// 이름
	private String name;
	// 이메일
	private String email;
	// 전화번호
	private String phone;
	// 성별
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
	
}
