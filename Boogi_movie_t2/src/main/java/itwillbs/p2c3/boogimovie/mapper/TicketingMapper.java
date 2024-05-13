package itwillbs.p2c3.boogimovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import itwillbs.p2c3.boogimovie.vo.ScreenSessionVO;

@Mapper
public interface TicketingMapper {
	
	List<ScreenSessionVO> fianlListSelect(ScreenSessionVO scs);
	ScreenSessionVO chooseSeatSelect(ScreenSessionVO scs);
}
