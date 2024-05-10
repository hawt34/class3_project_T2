package itwillbs.p2c3.boogimovie.mapper;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.ScreenSessionVO;

@Mapper
public interface TicketingMapper {
	
	ScreenSessionVO fianlListSelect(ScreenSessionVO scs);
}
