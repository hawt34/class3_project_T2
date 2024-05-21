package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.PayVO;
import itwillbs.p2c3.boogimovie.vo.ScreenSessionVO;
import itwillbs.p2c3.boogimovie.vo.StorePayVO;
import itwillbs.p2c3.boogimovie.vo.TicketVO;

@Mapper
public interface PaymentMapper {

	MemberVO getMember(MemberVO member);

	int usePoint(MemberVO member);

	void updateMemberPoint(MemberVO member);

	void savePayInfo(PayVO pay);

	PayVO getPayInfo(String merchant_uid);

	ScreenSessionVO getScreenSession(int scs_num);

	List<PayVO> selectPayInfo(PayVO pay);

	void saveTicketInfo(TicketVO ticket2);
	
	List<StorePayVO> selectStorePayInfo(String member_id); 
	

}
