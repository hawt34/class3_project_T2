package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import itwillbs.p2c3.boogimovie.vo.NoticeVO;

@Mapper
public interface NoticeMapper {
	
	List<NoticeVO> selectNoticeList(@Param("listLimit")int listLimit, @Param("startRow")int startRow); 
	
}
