package com.project.mango.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mango.util.ReservationPager;

@Service
public class ReservationService {

	@Autowired
	private ReservationMapper reservationMapper;
	
	public int setAdd(ReservationVO reservationVO) throws Exception {
		return reservationMapper.setAdd(reservationVO);
	}
	
	public List<ReservationVO> getList(ReservationPager reservationPager) throws Exception {
		reservationPager.makeRow();
		reservationPager.makeNum(reservationMapper.getTotalCount(reservationPager));
		return reservationMapper.getList(reservationPager);
	}
	
	public List<ReservationVO> getReportList(ReservationPager reservationPager) throws Exception {
		reservationPager.makeRow();
		reservationPager.makeNum(reservationMapper.getReportCount(reservationPager));
		return reservationMapper.getReportList(reservationPager);
	}
	
	public int setChangeReservation(ReservationVO reservationVO) throws Exception {
		return reservationMapper.setChangeReservation(reservationVO);
	}
	
	public int setUpdateVisitStatus(ReservationVO reservationVO) throws Exception {
		return reservationMapper.setUpdateVisitStatus(reservationVO);
	}
	
}
