package com.project.mango.notice;

import java.util.List;

import com.project.mango.board.BoardVO;

import lombok.Data;

@Data
public class NoticeVO extends BoardVO{
	

	private List<NoticeFilesVO> filesVOs;

}
