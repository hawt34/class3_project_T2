package itwillbs.p2c3.boogimovie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.MypageMainMapper;
import itwillbs.p2c3.boogimovie.vo.MemberVO;

@Service
public class MypageMainService {
	
	@Autowired
	private MypageMainMapper mapper;
	
//	public MemberVO getMainMember(String id) {
//		MemberVO infoMainMember = mapper.selectMainMember(id);
//		System.out.println("MypageMapper");
//		return infoMainMember;
//	}
	
}
