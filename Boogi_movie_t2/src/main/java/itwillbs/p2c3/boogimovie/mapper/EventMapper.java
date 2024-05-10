package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.EventVO;

@Mapper
public interface EventMapper {

	List<EventVO> selectEventList();
	
	EventVO selectEvent(int event_num);
}
