package com.project.mango.member;

import com.project.mango.util.FileVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberFileVO extends FileVO {
	
	/*
		CREATE TABLE MEMBER_FILE 
		(
			FILENUM INT PRIMARY KEY,
			ID varchar(100),
			FILENAME VARCHAR(100),
			ORINAME VARCHAR(100)
		);
	
	*/
	
	private String id;
}
