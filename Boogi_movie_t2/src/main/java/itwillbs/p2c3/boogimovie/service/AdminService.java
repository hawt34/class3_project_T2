package itwillbs.p2c3.boogimovie.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.AdminMapper;
import itwillbs.p2c3.boogimovie.vo.MemberVO;
import itwillbs.p2c3.boogimovie.vo.MovieVO;
import itwillbs.p2c3.boogimovie.vo.NoticeVO;
import itwillbs.p2c3.boogimovie.vo.OTOReplyVO;
import itwillbs.p2c3.boogimovie.vo.ReviewVO;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;
	
	// 회원 리스트 조회
	public List<Map<String, String>> getmemberList() {
		return mapper.selectMemberList();
	}
	
	// 회원 상세보기
	public MemberVO SelectMember(String id) {
		return mapper.selectMember(id);
	}
	
	// 회원삭제
	public int deleteMember(String id) {
		return mapper.deleteMember(id);
	}
	
	// 예매리스트
	public List<Map<String, String>> getReserveList() {
		return mapper.selectReserveList();
	}
	
	// 예매 상세보기
	public Map<String, String> selectReserveDetail(int reservation_num) {
		return mapper.selectReserve(reservation_num);
	}
	
	// 리뷰 리스트 조회
	public List<ReviewVO> getReviewList() {
		return mapper.selectReviewList();
	}
	
	// 리뷰 삭제
	public int deleteReview(String reviewId) {
		return mapper.deleteReview(reviewId);
	}
	
	// 영화 삭제
	public int deleteMovie(String movie_num) {
		return mapper.deleteMovie(movie_num);
	}
	
	// 영화 리스트 조회
	public List<Map<String, String>> getmovieList() {
		return mapper.selectMovieList();
	}
	
	// 영화 상세보기
	public MovieVO SelectMovie(int movie_num) {
		return mapper.selectMovie(movie_num);
	}
	
	// 영화 수정 업데이트
	public int UpdateMovie(MovieVO moviem) {
		return mapper.updateMovie(moviem);
	}
	
	// 영화 등록
	public int InsertMovie(MovieVO movie) {
		return mapper.insertMovie(movie);
	}
	//----------------------------------------------
	//공지사항 등록
	public int InsertNotice(NoticeVO notice, int theater_num) {
		return mapper.insertNotice(notice, theater_num);
	}
	//공지사항 list 가져오기
	public List<NoticeVO> getNoticeList(int startRow, int listLimit) {
		return mapper.selectNoticeList(startRow, listLimit);
	}

	public int replyRegist(OTOReplyVO reply, int oto_num) {
		return mapper.insertReply(reply, oto_num);
	}

	public int deleteNotice(int notice_num) {
		return mapper.deleteNotice(notice_num);
	}

	public int getNoticeListCount() {
		return mapper.getNoticeListCount();
	}

	public NoticeVO getNotice(NoticeVO notice) {
		return mapper.selectNotice(notice);
	}

	public int getMaxNotice(NoticeVO notice) {
		return mapper.selectMaxNotice(notice);
	}
	
}
