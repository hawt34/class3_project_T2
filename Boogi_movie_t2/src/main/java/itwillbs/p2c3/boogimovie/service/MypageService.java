package itwillbs.p2c3.boogimovie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.MypageMainMapper;
import itwillbs.p2c3.boogimovie.mapper.MypageMapper;
import itwillbs.p2c3.boogimovie.vo.MemberVO;

@Service
public class MypageService {
	
	@Autowired
	private MypageMapper mapper;
	
	public MemberVO getMember(String id) {
		MemberVO infoModifyMember = mapper.selectMember(id);
		System.out.println("infoModifyService");
		return infoModifyMember;
	}
	
	public MemberVO getMainMember(String id) {
		MemberVO infoMainMember = mapper.selectMainMember(id);
		System.out.println("MypageMapper");
		return infoMainMember;
	}
}
