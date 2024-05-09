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
	
	// 회원정보
	MemberVO selectDbMember(MemberVO member);
	
	// 정보수정
	int updateMember(MemberVO member);
	
	// 탈퇴처리
	int updateMemberForWithdraw(MemberVO member);
	
}
