package itwillbs.p2c3.boogimovie.service;

<<<<<<< HEAD
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
=======
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.TheaterMapper;
import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Service
public class TheaterService {

	
	@Autowired
	private TheaterMapper mapper;

	public TheaterVO getTheater(TheaterVO theater) {
		return mapper.selectTheater(theater);
	}
	
	
	
	
	
>>>>>>> branch 'main' of https://github.com/hawt34/class3_project_T2.git
	
}
