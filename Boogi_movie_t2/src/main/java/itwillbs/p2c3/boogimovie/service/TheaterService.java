package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.TheaterMapper;
import itwillbs.p2c3.boogimovie.vo.TheaterFacilityVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Service
public class TheaterService {

	
	@Autowired
	private TheaterMapper mapper;

	public TheaterVO getTheater(TheaterVO theater) {
		return mapper.selectTheater(theater);
	}
	
	
	
	public List<TheaterVO> getTheatersOrderbyName() {
		return mapper.selectTheatersOrderbyName();
	}



	public List<TheaterFacilityVO> getFacility(TheaterFacilityVO facility) {
		return mapper.selectFacility(facility);
	}

		
	
	public int getTheaterName(String theater_name) {
		return mapper.selectTheaterName(theater_name);
	}
	
	
}
