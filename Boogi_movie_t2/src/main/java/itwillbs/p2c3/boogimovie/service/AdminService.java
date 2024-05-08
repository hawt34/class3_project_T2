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

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;
	
	public List<Map<String, String>> getmemberList() {
		return mapper.selectMemberList();
	}
	
	public MemberVO SelectMember(String id) {
		return mapper.selectMember(id);
	}
	
	public int deleteMember(String id) {
		return mapper.deleteMember(id);
	}
	
	public List<Map<String, String>> getmovieList() {
		return mapper.selectMovieList();
	}
	
	public MovieVO SelectMovie(int movie_num) {
		return mapper.selectMovie(movie_num);
	}
	
	public int UpdateMovie(MovieVO movie) {
		return mapper.updateMovie(movie);
	}

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
	
}
