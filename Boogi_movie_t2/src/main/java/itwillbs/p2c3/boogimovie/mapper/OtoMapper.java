package itwillbs.p2c3.boogimovie.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import itwillbs.p2c3.boogimovie.vo.OTOVO;

@Mapper
public interface OtoMapper {
	
	int insertOto(@Param("oto")OTOVO oto,
				  @Param("theater_name")String theater_name,
				  @Param("member_id")String member_id);
}
