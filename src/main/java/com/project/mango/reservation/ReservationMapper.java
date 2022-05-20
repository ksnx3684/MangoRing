package com.project.mango.reservation;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationMapper {

	public int setAdd(ReservationVO reservationVO) throws Exception;
	
}
