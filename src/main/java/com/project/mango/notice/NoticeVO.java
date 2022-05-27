package com.project.mango.notice;

import java.util.List;

import com.project.mango.board.BoardVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class NoticeVO extends BoardVO{
	

	private List<NoticeFilesVO> filesVOs;

}
