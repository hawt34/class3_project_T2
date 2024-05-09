package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.TheaterMapper;
import itwillbs.p2c3.boogimovie.vo.NoticeVO;
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


	//  극장 상세 > 지점별 공지사항 
	public List<NoticeVO> getTheaterNoticeList(NoticeVO notice) {
		return mapper.selectTheaterNoticeList(notice);
	}


	// 극장 메인 > 극장 카테고리 공지사항 
	public List<NoticeVO> getNoticeList() {
		return mapper.selectNoticeList();
	}
	
	
}
