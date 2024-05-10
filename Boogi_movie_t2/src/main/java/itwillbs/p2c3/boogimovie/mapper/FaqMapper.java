package itwillbs.p2c3.boogimovie.mapper;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.FAQVO;

@Mapper
public interface FaqMapper {
	
	//faq 등록
	int insertFaq(FAQVO faq);

}
