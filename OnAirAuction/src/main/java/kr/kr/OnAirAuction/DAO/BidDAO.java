package kr.kr.OnAirAuction.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuctionn.VO.BidVO;

public interface BidDAO {
	
	int insertImmediate(@Param("bid") BidVO bid);
	
	ArrayList<BidVO> selectBidlist(@Param("cri") Criteria cri);  // ?

	int selectBidlistTotalCount(@Param("cri") Criteria cri); // ? 
	
}
