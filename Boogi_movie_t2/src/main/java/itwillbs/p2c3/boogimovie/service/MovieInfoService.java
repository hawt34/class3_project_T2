package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.MovieMapper;
import itwillbs.p2c3.boogimovie.vo.MovieGenreVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;

@Service
public class MovieInfoService {
	@Autowired
	private MovieMapper mapper;
	
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


	public int getMovieGenreNum(MovieGenreVO movieGenre) {
		
		return mapper.selectMovieGenreNum(movieGenre);
	}
	
	public List<MovieVO> getMovieListGenre(int genre_num){
		return mapper.selectMovieInfoGenre(genre_num);
	}


	public List<MovieVO> getMovieFuture(){
		
		return mapper.selectMovieFuture();
	}
	
	
	public MovieVO getFutureMovieInfo(MovieVO futureMovie) {
		
		return mapper.selectFutureMovieInfo(futureMovie);
	}
	

}
