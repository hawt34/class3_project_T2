package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.MovieVO;
@Mapper
public interface MovieInfoMapper {
	//MovieVO selectMovieInfo(MovieVO movieInfo);
	List<MovieVO> selectMovieInfo();
}
