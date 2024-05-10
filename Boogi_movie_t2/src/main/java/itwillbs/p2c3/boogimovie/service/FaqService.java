package itwillbs.p2c3.boogimovie.service;

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
}
