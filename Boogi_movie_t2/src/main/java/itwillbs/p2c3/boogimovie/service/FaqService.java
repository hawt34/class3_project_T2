package itwillbs.p2c3.boogimovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itwillbs.p2c3.boogimovie.mapper.FaqMapper;
import itwillbs.p2c3.boogimovie.vo.FAQVO;

@Service
public class FaqService {
	
	@Autowired
	private FaqMapper mapper;
	
	//faq 등록
	public int insertFaq(FAQVO faq) {
		return mapper.insertFaq(faq);
	}
	//faq List 가져오기
	public List<FAQVO> getFaqList(int listLimit, int startRow) {
		return mapper.selectFaqList(listLimit, startRow);
	}
	// faq 게시글 갯수
	public int getFaqListCount() {
		return mapper.selectFaqListCount();
	}
	//faq 삭제
	public int deleteFaq(FAQVO faq) {
		return mapper.deleteFaq(faq);
	}
	
	// faq 가져오기
	public FAQVO getFaq(FAQVO faq) {
		return mapper.selectFaq(faq);
	}
	//faq 수정
	public int updateFaq(FAQVO faq) {
		return mapper.updateFaq(faq);
	}
	//카테고리에 따른 게시물 갯수
	public int getfaqListCountCag(String category) {
		return mapper.selectFaqListCountCag(category);
	}
}
