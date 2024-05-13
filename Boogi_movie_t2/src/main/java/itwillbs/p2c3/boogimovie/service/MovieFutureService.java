package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import itwillbs.p2c3.boogimovie.mapper.MovieFutureMapper;
import itwillbs.p2c3.boogimovie.mapper.MovieInfoMapper;
import itwillbs.p2c3.boogimovie.vo.MovieGenreVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;

@Service
public class MovieFutureService {
	@Autowired
	private MovieFutureMapper mapper;
	
	public List<MovieVO> getMovieFuture(){
		
		return mapper.selectMovieFuture();
	}
	
	
	
	
	


	
}
