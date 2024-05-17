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
	
	public int insertOto(OTOVO oto, int theater_name, String id ) {
		return mapper.insertOto(oto, theater_name, id);
	}

	public List<OTOVO> getOtoList(int startRow, int listLimit, String faqCategory, String theaterName) {
		return mapper.selectOtoList(startRow, listLimit, faqCategory, theaterName);
	}

	public OTOVO getOto(int oto_num) {
		return mapper.selectOto(oto_num);
	}

	public String getTheaterName(int theater_num) {
		return mapper.selectTheaterName(theater_num);
	}

	public int updateOto(int oto_num, String oto_content) {
		return mapper.updateOto(oto_num, oto_content);
	}

	public int deleteOto(int oto_num) {
		return mapper.deleteOto(oto_num);
	}
	//'미답' 상태 변경
	public int updateOtoResponse(int oto_num) {
		return mapper.updateResponse(oto_num);
	}

	public int getTheaterNum(String theater_name) {
		return mapper.selectTheaterNum(theater_name);
	}
	
	// 1대1 문의 게시물 갯수
	public int getOtoListCount(String faqCategory, String theaterName) {
		return mapper.getOtoListCount(faqCategory, theaterName);
	}
}
