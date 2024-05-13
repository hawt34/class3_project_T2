package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.NoticeVO;
import itwillbs.p2c3.boogimovie.vo.OTOReplyVO;
import itwillbs.p2c3.boogimovie.vo.ReviewVO;

@Mapper
public interface AdminMapper {

	// 회원 리스트 조회
	List<Map<String, String>> selectMemberList();
	
	// 회원삭제
	int deleteMember(String id);
	
	// 회원 상세보기
	MemberVO selectMember(String id);

	// 리뷰 리스트 조회
	List<ReviewVO> selectReviewList();

	// 리뷰 삭제
	int deleteReview(String review_num);

	// 예매리스트
	List<Map<String, String>> selectReserveList();
	
	// 예매 상세
	Map<String, String> selectReserve(int reservation_num);
	
	// 영화 리스트 조회
	List<Map<String, String>> selectMovieList();
	
	// 영화 상세보기
	MovieVO selectMovie(int movie_num);

	// 영화 확인
	MovieVO getMovie(String movie_name);

	// 영화 수정 업데이트
	int updateMovie(MovieVO movie);
	
	// 영화 등록
	int insertMovie(MovieVO movie);

	// 영화 삭제
	int deleteMovie(String movie_num);

	//공지사항 등록
	int insertNotice(@Param("notice") NoticeVO notice, @Param("theater_num")int theater_num);

	List<NoticeVO> selectNoticeList(@Param("startRow") int startRow,
									@Param("listLimit") int listLimit);
	
	//1대1 문의 답변 insert
	int insertReply(@Param("reply")OTOReplyVO reply,
					@Param("oto_num")int oto_num);

	int deleteNotice(int notice_num);

	int getNoticeListCount();

	NoticeVO selectNotice(NoticeVO notice);
	
	//notice 마지막 게시물 번호
	int selectMaxNotice(NoticeVO notice);
	
	// notice 처음 게시물 번호
	int selectMinNotice(NoticeVO notice);
}
