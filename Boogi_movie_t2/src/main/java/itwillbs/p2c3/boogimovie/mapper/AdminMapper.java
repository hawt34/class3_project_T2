package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.MemberVO;


@Mapper
public interface AdminMapper {

	List<Map<String, String>> selectMemberList();
	
	int deleteMember(String id);
	
	MemberVO selectMember(String id);
}
