package itwillbs.p2c3.boogimovie.mapper;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Mapper
public interface TheaterMapper {

	TheaterVO selectTheater(TheaterVO theater);
	
	

}
