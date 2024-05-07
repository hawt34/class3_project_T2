package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Mapper
public interface TheaterMapper {
	List<TheaterVO> selectTheater();
}
