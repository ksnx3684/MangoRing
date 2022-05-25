package com.project.mango.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mango.util.ReservationPager;

@Mapper
public interface ReservationMapper {

	public int setAdd(ReservationVO reservationVO) throws Exception;
	
	public List<ReservationVO> getList(ReservationPager reservationPager) throws Exception;
	
	public List<ReservationVO> getReportList(ReservationPager reservationPager) throws Exception;
	
	public int setChangeReservation(ReservationVO reservationVO) throws Exception;
	
	public int setUpdateVisitStatus(ReservationVO reservationVO) throws Exception;
	
	public Long getTotalCount(ReservationPager reservationPager) throws Exception;
	
	public Long getReportCount(ReservationPager reservationPager) throws Exception;
	
}
