package com.project.mango.notice.restaurant;

import com.project.mango.util.FileVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ResFilesVO extends FileVO{
	
	private Long num;

}
