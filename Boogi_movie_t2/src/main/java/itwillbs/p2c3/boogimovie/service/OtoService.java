package itwillbs.p2c3.boogimovie.service;

import java.util.List;

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

	public List<OTOVO> getOtoList(int startRow, int listLimit) {
		return mapper.selectOtoList(startRow, listLimit);
	}

	public OTOVO getOto(int OTO_num) {
		return mapper.selectOto(OTO_num);
	}

	public String getTheaterName(int theater_num) {
		return mapper.selectTheaterName(theater_num);
	}

	public int updateOto(int OTO_num, String OTO_content) {
		return mapper.updateOto(OTO_num, OTO_content);
	}

	public int deleteOto(int OTO_num) {
		return mapper.deleteOto(OTO_num);
	}
}
