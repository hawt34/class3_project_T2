package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import itwillbs.p2c3.boogimovie.mapper.MovieInfoMapper;
import itwillbs.p2c3.boogimovie.vo.MovieVO;

@Service
public class MovieInfoService {
	@Autowired
	private MovieInfoMapper mapper;
	
//	public List<MovieVO> getMovieList(){
		
//		return mapper.selectMovieInfo();
//	}
}
