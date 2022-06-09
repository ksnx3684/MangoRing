package com.project.mango.notice.restaurant;

import java.sql.Date;
import java.util.List;

import com.project.mango.board.BoardVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
public class ResNoticeVO{

	private Long restaurantNum;
	private Long num;
	private String id;
	private String title;
	private String contents;
	private Date date;

	private List<ResFilesVO> filesVOs;

}
