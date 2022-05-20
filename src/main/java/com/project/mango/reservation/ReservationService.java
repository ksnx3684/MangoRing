package com.project.mango.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationService {

	@Autowired
	private ReservationMapper reservationMapper;
	
	public int setAdd(ReservationVO reservationVO) throws Exception {
		return reservationMapper.setAdd(reservationVO);
	}
	
}
