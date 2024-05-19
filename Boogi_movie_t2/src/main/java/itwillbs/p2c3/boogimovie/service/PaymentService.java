package itwillbs.p2c3.boogimovie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.PaymentMapper;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.PayVO;

@Service
public class PaymentService {
	
	@Autowired
	private PaymentMapper mapper;

	public MemberVO getMember(MemberVO member) {
		return mapper.getMember(member);
	}

	public int usePoint(MemberVO dbmember) {
		return mapper.usePoint(dbmember);
	}

	public void updateMemberPoint(MemberVO member) {
		mapper.updateMemberPoint(member);
	}

	public void savePayInfo(PayVO pay) {
		mapper.savePayInfo(pay);
		
	}
	
	

}
