package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.MovieGenreVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
@Mapper
public interface MovieInfoMapper {
	List<MovieVO> selectMovieInfo();
	MovieVO selectMovie(MovieVO movie);
	List<MovieVO> selectMovieInfoLike();
	List<MovieVO> selectMovieInfoAbc();
	int selectMovieGenreNum(MovieGenreVO movieGenre);
	List<MovieVO> selectMovieInfoGenre(int genre_num);
}
