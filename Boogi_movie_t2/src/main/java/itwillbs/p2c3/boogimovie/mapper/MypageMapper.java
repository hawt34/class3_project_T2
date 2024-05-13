package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.ReservationVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Mapper
public interface MypageMapper {
	
	// 메인페이지 id
	MemberVO selectMember (String id);
	
	// My극장 극장 전체리스트
	List<TheaterVO> selectTheater();
	
	// My극장 자주가는 영화관
	MemberVO selectMyTheater();
	
	// 예매내역 영화제목
	List<MovieVO> selectMovieReservation(String id);
	
	
	
	ReservationVO selectMovieResv(String id);
	
	// 회원정보
	MemberVO selectDbMember(MemberVO member);
	
	
	// 정보수정
	int updateMember(MemberVO member);
	
	// 탈퇴처리
	int updateMemberForWithdraw(MemberVO member);
	
}
