package com.project.mango.notice;

import com.project.mango.util.FileVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class NoticeFilesVO extends FileVO{
	
	private Long num;

}
