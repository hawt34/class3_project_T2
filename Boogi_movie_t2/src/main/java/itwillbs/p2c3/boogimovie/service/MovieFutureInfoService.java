package itwillbs.p2c3.boogimovie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.MovieFutureInfoMapper;
import itwillbs.p2c3.boogimovie.vo.MovieVO;

@Service
public class MovieFutureInfoService {
	@Autowired
	private MovieFutureInfoMapper mapper;
	
	
	
	
	public MovieVO getFutureMovieInfo(MovieVO futureMovie) {
		
		return mapper.selectFutureMovieInfo(futureMovie);
	}
	
	
}
