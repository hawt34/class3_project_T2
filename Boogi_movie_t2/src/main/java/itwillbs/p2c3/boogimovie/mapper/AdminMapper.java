package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;


@Mapper
public interface AdminMapper {

	List<Map<String, String>> selectMemberList();
	
	int deleteMember(String id);
	
	MemberVO selectMember(String id);
	
	List<Map<String, String>> selectMovieList();
	
	MovieVO selectMovie(int movie_num);

	int updateMovie(MovieVO movie);
	
	int insertMovie(MovieVO movie);
}
