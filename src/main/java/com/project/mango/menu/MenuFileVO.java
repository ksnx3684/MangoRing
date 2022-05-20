package com.project.mango.menu;

import com.project.mango.util.FileVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MenuFileVO extends FileVO{

	private Long menuNum;
	
}
