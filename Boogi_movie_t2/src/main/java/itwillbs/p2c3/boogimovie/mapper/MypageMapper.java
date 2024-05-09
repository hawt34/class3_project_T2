package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.ReservationVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Mapper
public interface MypageMapper {
	
	MemberVO selectMember (String id);
	ReservationVO selectMovieResv(String id);
	List<TheaterVO> selectTheater();
	MemberVO selectDbMember(MemberVO member);
	
	// 탈퇴
	int updateMemberForWithdraw(MemberVO member);
	
	int updateMember(MemberVO member);
}
