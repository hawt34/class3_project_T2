package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.MypageMapper;
import itwillbs.p2c3.boogimovie.vo.CouponVO;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.ReservationVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Service
public class MypageService {
	
	@Autowired
	private MypageMapper mapper;
	
	// 메인페이지 id
	public MemberVO getMember(String id) {
		System.out.println("MypageInfoService - getMember");
		MemberVO infoMember = mapper.selectMember(id);
		return infoMember;
	}
	
	
	// My극장 극장 전체리스트
	public List<TheaterVO> getTheater() {
		System.out.println("MypageInfoService - getTheater");
		List<TheaterVO> infoTheater = mapper.selectTheater();
		return infoTheater;
	}

	// My극장 자주가는 영화관
	public MemberVO getMyTheater(MemberVO member) {
		System.out.println("MypageInfoService - getMyTheater()");
		return mapper.selectMyTheater(member);
	}
	
	// 예매내역 영화제목
	public List<MovieVO> getMovieReservation(MemberVO member) {
		System.out.println("MypageInfoService - getMovieReservation()");
		List<MovieVO> movie = mapper.selectMovieReservation(member);
		return movie;
	}
	
	// 회원정보
	public MemberVO getDbMember(MemberVO member) {
		System.out.println("MypageInfoService - getDbMember");
		return mapper.selectDbMember(member);
	}
	
	// 정보수정
	public int modifyMember(MemberVO member) {
		return mapper.updateMember(member);
	}

	// 쿠폰
	public List<CouponVO> getCoupon(MemberVO member){
		return mapper.selectCoupon(member);
	}
	
	
	public ReservationVO getMovieResv(String id) {
		System.out.println("MypageInfoService - getMovieResv");
		ReservationVO infoMovieResv = mapper.selectMovieResv(id);
		return mapper.selectMovieResv(id);
	}
	
	
	
//	public int modifyMemberNotEq(MemberVO member) {
//		return mapper.updateMemberNotEq(member);
//	}
	
	// 탈퇴처리
	public int withdrawMember(MemberVO member) {
		System.out.println("MypageInfoService - withdrawMember()");
		return mapper.updateMemberForWithdraw(member);
	}
	
	
}
