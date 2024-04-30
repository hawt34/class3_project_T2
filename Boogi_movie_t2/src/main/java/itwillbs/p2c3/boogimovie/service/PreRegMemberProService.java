package itwillbs.p2c3.boogimovie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.MemberMapper;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
@Service
public class PreRegMemberProService {
	@Autowired
	MemberMapper mapper;
	
	public boolean IsRegisteredMember(MemberVO inputMember) {
		MemberVO outputMember = mapper.preRegMember(inputMember);
		boolean isRegistedMember = false;
		System.out.println("outputMember : " + outputMember);
		System.out.println("service " + inputMember);
		if(outputMember != null) {
			isRegistedMember = true;
		}
		return isRegistedMember;
	}
}
