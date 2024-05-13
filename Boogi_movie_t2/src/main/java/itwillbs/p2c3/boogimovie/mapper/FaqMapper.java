package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import itwillbs.p2c3.boogimovie.vo.FAQVO;

@Mapper
public interface FaqMapper {
	
	//faq 등록
	int insertFaq(FAQVO faq);
	
	//faq List 가져오기
	List<FAQVO> selectFaqList(@Param("listLimit")int listLimit, @Param("startRow")int startRow);
	
	//faq List Count 가져오기
	int selectFaqListCount();
	
	//faq 삭제
	int deleteFaq(FAQVO faq);
	
	//faq 가져오기
	FAQVO selectFaq(FAQVO faq);
	
	//faq 수정
	int updateFaq(FAQVO faq);

}
