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

	public List<NoticeVO> getNoticeList() {
		System.out.println(mapper.selectNoticeList());
		return mapper.selectNoticeList();
	}
	
}
