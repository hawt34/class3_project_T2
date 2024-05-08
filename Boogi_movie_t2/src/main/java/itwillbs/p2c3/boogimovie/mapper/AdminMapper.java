package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.NoticeVO;
import itwillbs.p2c3.boogimovie.vo.OTOReplyVO;


@Mapper
public interface AdminMapper {

	List<Map<String, String>> selectMemberList();
	
	int deleteMember(String id);
	
	MemberVO selectMember(String id);
	
	List<Map<String, String>> selectMovieList();
	
	MovieVO selectMovie(int movie_num);

	int updateMovie(MovieVO movie);
	
	int insertMovie(MovieVO movie);
	
	//공지사항 등록
	int insertNotice(@Param("notice") NoticeVO notice,
					 @Param("theater_num")int theater_name);

	List<NoticeVO> selectNoticeList(@Param("startRow") int startRow,
									@Param("listLimit") int listLimit);
	
	//1대1 문의 답변 insert
	int insertReply(@Param("reply")OTOReplyVO reply,
					@Param("oto_num")int oto_num);
}
