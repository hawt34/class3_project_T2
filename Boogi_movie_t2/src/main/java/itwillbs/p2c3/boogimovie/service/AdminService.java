package itwillbs.p2c3.boogimovie.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.AdminMapper;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;
	
	public List<Map<String, String>> getmemberList() {
		return mapper.selectMemberList();
	}
	
	public MemberVO SelectMember(String id) {
		return mapper.selectMember(id);
	}
	
	public int deleteMember(String id) {
		return mapper.deleteMember(id);
	}
	
	public List<Map<String, String>> getmovieList() {
		return mapper.selectMovieList();
	}
	
	public MovieVO SelectMovie(int movie_num) {
		return mapper.selectMovie(movie_num);
	}
	
	public int UpdateMovie(MovieVO movie) {
		return mapper.updateMovie(movie);
	}

	public int InsertMovie(MovieVO movie) {
		return mapper.insertMovie(movie);
	}
	
}
