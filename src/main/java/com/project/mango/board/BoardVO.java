package com.project.mango.board;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {

	private Long num;
	private String id;
	private String title;
	private String contents;
	private Date date;
}
