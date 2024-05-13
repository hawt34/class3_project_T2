package itwillbs.p2c3.boogimovie.mapper;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.MovieVO;
@Mapper
public interface MovieFutureInfoMapper {
	MovieVO selectFutureMovieInfo(MovieVO futureMovie);
	
}
