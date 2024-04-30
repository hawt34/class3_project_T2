package itwillbs.p2c3.boogimovie.service;

import java.sql.Connection;

import itwillbs.p2c3.boogimovie.DAO.MemberDAO;
import itwillbs.p2c3.boogimovie.DB.JdbcUtil;
import itwillbs.p2c3.boogimovie.VO.memberVO;

public class PreRegMemberProService {
	
	public boolean IsRegisteredMember(memberVO member) {
		boolean IsRegisteredMember = false;
		Connection con = JdbcUtil.getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		IsRegisteredMember = dao.IsRegisteredMember(member);
		
		JdbcUtil.close(con);
		
		return IsRegisteredMember;//Action으로 리턴
	}
}
