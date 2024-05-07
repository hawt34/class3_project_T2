package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import itwillbs.p2c3.boogimovie.vo.OTOVO;

@Mapper
public interface OtoMapper {
	
	int insertOto(@Param("oto")OTOVO oto,
				  @Param("theater_name")String theater_name,
				  @Param("member_id")String member_id);

	List<OTOVO> selectOtoList(@Param("startRow")int startRow, 
							  @Param("listLimit")int listLimit);

	OTOVO selectOto(int oto_num);

	String selectTheaterName(int theater_num);

	int updateOto(@Param("oto_num")int oto_num, 
				  @Param("oto_content")String oto_content);

	int deleteOto(int oto_num);
}
