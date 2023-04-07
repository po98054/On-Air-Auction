package kr.kh.onairauction.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.onairauction.vo.TestPageVO;

public interface TestPageDAO {
	
	int insertImmediate(@Param("test") TestPageVO testPage);
	
}
