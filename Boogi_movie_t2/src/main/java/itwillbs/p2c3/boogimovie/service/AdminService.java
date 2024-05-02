package itwillbs.p2c3.boogimovie.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.AdminMapper;
import itwillbs.p2c3.boogimovie.vo.MemberVO;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;
	
	public List<Map<String, String>> getmemberList() {
		
		return mapper.selectMemberList();
	}
	
	public MemberVO SelectMember(String id) {
		
		return mapper.selectMember(id);
	}
	
	public int deleteMember(String id) {
		
		return mapper.deleteMember(id);
	}
}
