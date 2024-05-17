package itwillbs.p2c3.boogimovie.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import itwillbs.p2c3.boogimovie.vo.EventVO;
import itwillbs.p2c3.boogimovie.vo.ItemInfoVO;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.NoticeVO;
import itwillbs.p2c3.boogimovie.vo.OTOReplyVO;
import itwillbs.p2c3.boogimovie.vo.ReviewVO;
import itwillbs.p2c3.boogimovie.vo.ScreenInfoVO;
import itwillbs.p2c3.boogimovie.vo.ScreenSessionVO;

@Mapper
public interface AdminMapper {

	// 회원 리스트 조회
	List<Map<String, String>> selectMemberList();
	
	// 회원삭제
	int deleteMember(String id);
	
	// 회원 상세보기
	MemberVO selectMember(String id);

	//========================================================
	// 리뷰 리스트 조회
	List<ReviewVO> selectReviewList();

	// 리뷰 삭제
	int deleteReview(String review_num);

	//========================================================
	// 예매리스트
	List<Map<String, String>> selectReserveList();
	
	// 예매 상세
	Map<String, String> selectReserve(int reservation_num);
	
	//========================================================
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
	//========================================================
	// 상영관 좌석 정보 가져오기
	ScreenInfoVO getSeatInfo(ScreenSessionVO screenSession);
	
	// 상영관리 - 상영관 불러오기
	List<ScreenInfoVO> getScreensByTheater(String theater_num);
	
	// 상영 등록
	int insertMoviePlan(ScreenSessionVO screenSession);

	// 상영 삭제
	int deleteMoviePlan(int scs_num);
	
	// 상영일정 리스트
	List<Map<String, String>> selectMoviePlanList();
	
	// 상영 시작, 종료시간 가져오기
	List<Map<String, String>> getMovieTimeList(@Param("theaterSelect") int theaterSelect,
											   @Param("screenSelect") int screenSelect,
											   @Param("scs_date") Date scs_date
											   );
	// 극장이름 가져오기
	List<Map<String, String>> getTheaterList();
	
	//========================================================
	// 이벤트 등록
	int insertEvent(EventVO event);
	
	// 이벤트 수정
	int updateEvent(EventVO event);
	
	// 이벤트 삭제
	int deleteEvent(EventVO event);
	//========================================================

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
	
	//스토어용
	//스토어 전체 리스트 
	List<ItemInfoVO> selectItemListFull();
	//스토어 추가 시 개별아이템 확인
	ItemInfoVO selectItem(String item_info_name);
	int insertItem(ItemInfoVO item);
	int deleteItem(String item_info_name);
	int updateItem(ItemInfoVO item);
}
