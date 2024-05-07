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
	
	public MemberVO getMember(MemberVO member) {
		System.out.println("MypageInfoService - getMember");
//		MemberVO infoModifyMember = mapper.selectMember(id);
		return mapper.selectMember(member);
	}
	
	
	public ReservationVO getMovieResv(MemberVO member) {
		System.out.println("MypageInfoService - getMovieResv");
//		ReservationVO infoMovieResv = mapper.selectMovieResv(id);
		return mapper.selectMovieResv(member);
	}
	
	public List<TheaterVO> getTheater() {
		System.out.println("MypageInfoService - getTheater");
		return mapper.selectTheater();
	}
	
	
}
