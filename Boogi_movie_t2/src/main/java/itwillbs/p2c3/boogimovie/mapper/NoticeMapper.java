package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import itwillbs.p2c3.boogimovie.vo.NoticeVO;

@Mapper
public interface NoticeMapper {
	
	List<NoticeVO> selectNoticeList(@Param("listLimit")int listLimit, @Param("startRow")int startRow, @Param("theaterName")String theaterName);

	NoticeVO selectNotice(int notice_num);

//	List<NoticeVO> selectNoticeCagList(@Param("listLimit")int listLimit,
//									   @Param("startRow")int startRow,
//									   @Param("theaterName")String theaterName);
	
	//극장명과 동일한 게시판글 갯수
	int selectNoticeListCountCag(String category); 
	
}
