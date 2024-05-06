package itwillbs.p2c3.boogimovie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.OtoMapper;
import itwillbs.p2c3.boogimovie.vo.OTOVO;

@Service
public class OtoService {
	
	@Autowired
	private OtoMapper mapper;
	
	public int insertOto(OTOVO oto, String theater_name, String member_id ) {
		return mapper.insertOto(oto, theater_name, member_id);
	}
}
