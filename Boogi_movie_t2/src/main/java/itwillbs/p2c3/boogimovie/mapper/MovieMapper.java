package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.MovieGenreVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
@Mapper
public interface MovieMapper {
	List<MovieVO> selectMovieInfo();
	MovieVO selectMovie(MovieVO movie);
	List<MovieVO> selectMovieInfoLike();
	List<MovieVO> selectMovieInfoAbc();
	int selectMovieGenreNum(MovieGenreVO movieGenre);
	List<MovieVO> selectMovieInfoGenre(Map<String, Object> genreList);
	List<MovieVO> selectMovieFuture();//상영예정작 리스트
	MovieVO selectFutureMovieInfo(MovieVO futureMovie);//상영예정작 상세보기
}