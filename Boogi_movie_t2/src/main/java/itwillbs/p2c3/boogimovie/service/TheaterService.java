package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.TheaterMapper;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Service
public class TheaterService {
	
	
	@Autowired
	private TheaterMapper mapper;
	
	public List<TheaterVO> searchTheaters(){
		
		
		return mapper.selectTheater();
	}
	
}
