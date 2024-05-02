package itwillbs.p2c3.boogimovie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.MemberMapper;
import itwillbs.p2c3.boogimovie.vo.MemberVO;

@Service
public class MemberIdSearchProService {
	@Autowired
	private MemberMapper mapper;
	
	public MemberVO memberIdSearch(MemberVO inputMember) {
		MemberVO outputMember = mapper.preRegMember(inputMember);
		
		if(outputMember == null) {
			outputMember = new MemberVO();
		}
		
		return outputMember;
	}
}
