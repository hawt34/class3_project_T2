package itwillbs.p2c3.boogimovie.mapper;

<<<<<<< HEAD
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Mapper
public interface TheaterMapper {
	List<TheaterVO> selectTheater();
=======
import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.TheaterVO;

@Mapper
public interface TheaterMapper {

	TheaterVO selectTheater(TheaterVO theater);
	
	

>>>>>>> branch 'main' of https://github.com/hawt34/class3_project_T2.git
}
