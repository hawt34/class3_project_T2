package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.ReservationMapper;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.ReservationVO;
import itwillbs.p2c3.boogimovie.vo.TicketVO;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationMapper mapper; 
	
	// 예매내역 영화제목
	public List<MovieVO> getMovieReservation(String id){
		List<MovieVO> movieReservation = mapper.selectMovieReservation(id);
		return movieReservation;
	}
	
	// 예매내역 관람날짜
	public List<TicketVO> getDateReservation(String id){
		List<TicketVO> dateReservation = mapper.selectDateReservation(id);
		return dateReservation;
	}
	
	
}
