package itwillbs.p2c3.boogimovie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.MemberMapper;
import itwillbs.p2c3.boogimovie.vo.MemberVO;

@Service
public class RegMemberProService {
	
	@Autowired
	private MemberMapper mapper;
	
	public int regMember(MemberVO member) {
		System.out.println("service들어옴");
		
		
		
		
		return 0; 
	}
}
