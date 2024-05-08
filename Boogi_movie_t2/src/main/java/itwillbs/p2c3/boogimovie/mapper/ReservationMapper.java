package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.ReservationVO;
import itwillbs.p2c3.boogimovie.vo.TicketVO;

@Mapper
public interface ReservationMapper {
	
	// 예매내역 영화제목
	List<MovieVO> selectMovieReservation(String id);
	
	// 예매내역 관람날짜
	List<TicketVO> selectDateReservation(String id);
}
