package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.NoticeMapper;
import itwillbs.p2c3.boogimovie.vo.NoticeVO;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeMapper mapper;

	public List<NoticeVO> getNoticeList(int listLimit, int startRow, String theaterName) {
		return mapper.selectNoticeList(listLimit, startRow, theaterName);
	}

	public NoticeVO getNotice(int notice_num) {
		return mapper.selectNotice(notice_num);
	}

//	public List<NoticeVO> getNoticeCagList(int listLimit, int startRow, String theaterName) {
//		return mapper.selectNoticeCagList(listLimit, startRow, theaterName);
//	}
	
	//극장명과 동일한 게시판글 갯수
	public int getNoticeListCountCag(String category) {
		return mapper.selectNoticeListCountCag(category);
	}
	
}
