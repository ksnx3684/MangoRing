package com.project.mango.review;

import com.project.mango.util.FileVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ReviewFilesVO extends FileVO{
	
	private Long reviewNum;
	

}
