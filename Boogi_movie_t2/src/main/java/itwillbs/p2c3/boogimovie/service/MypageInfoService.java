package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.MypageMapper;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.ReservationVO;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Service
public class MypageInfoService {
	
	@Autowired
	private MypageMapper mapper;
	
	public MemberVO getMember(String id) {
//		System.out.println("MypageInfoService - getMember");
		MemberVO infoMember = mapper.selectMember(id);
		return infoMember;
	}
	
	// 회원정보
	public MemberVO getDbMember(MemberVO member) {
		return mapper.selectDbMember(member);
	}
	
	public ReservationVO getMovieResv(String id) {
		System.out.println("MypageInfoService - getMovieResv");
		ReservationVO infoMovieResv = mapper.selectMovieResv(id);
		return mapper.selectMovieResv(id);
	}
	
	public List<TheaterVO> getTheater() {
		System.out.println("MypageInfoService - getTheater");
		List<TheaterVO> infoTheater = mapper.selectTheater();
		return infoTheater;
	}
	
	// 정보수정
	public int modifyMember(MemberVO member) {
		return mapper.updateMember(member);
	}
	
	// 탈퇴처리
	public int withdrawMember(MemberVO member) {
		return mapper.updateMemberForWithdraw(member);
	}
	
	
}
