package itwillbs.p2c3.boogimovie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.PaymentMapper;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.PayVO;
import itwillbs.p2c3.boogimovie.vo.ScreenSessionVO;
import itwillbs.p2c3.boogimovie.vo.TicketVO;

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

	public PayVO getPayInfo(String merchant_uid) {
		return mapper.getPayInfo(merchant_uid);
	}

	
	public ScreenSessionVO getScreenSession(int scs_num) {
		return mapper.getScreenSession(scs_num);
	}

	public PayVO selectPayInfo(PayVO pay) {
		return mapper.selectPayInfo(pay);
	}

	public void saveTicketInfo(TicketVO ticket2) {
		mapper.saveTicketInfo(ticket2);
	}
	
	
	

}
