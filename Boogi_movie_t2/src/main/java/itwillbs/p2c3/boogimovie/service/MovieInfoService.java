package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import itwillbs.p2c3.boogimovie.mapper.MovieInfoMapper;
import itwillbs.p2c3.boogimovie.vo.MovieVO;

@Service
public class MovieInfoService {
	@Autowired
	private MovieInfoMapper mapper;
	
	public List<MovieVO> getMovieList(){
		
		return mapper.selectMovieInfo();
	}
	
	
	
	public MovieVO getMovieInfo(MovieVO movie) {
		
		return mapper.selectMovie(movie);
	}
	
	public List<MovieVO> getMovieListLike(){
		
		return mapper.selectMovieInfoLike();
	} 
	
	public List<MovieVO> getMovieListAbc(){
		
		return mapper.selectMovieInfoAbc();
	}
	
}
