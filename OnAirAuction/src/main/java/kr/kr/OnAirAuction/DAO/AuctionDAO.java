package kr.kh.onAirAuction.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.onAirAuction.pagination.Criteria;
import kr.kh.onAirAuction.vo.AuctionTypeVO;
import kr.kh.onAirAuction.vo.AuctionVO;

public interface AuctionDAO {
	
	void insertAuction(@Param("auction")AuctionVO auction);
	
	ArrayList<AuctionVO> selectAuctionList(@Param("cri")Criteria cri);

	int selectAuctionTotalCount(@Param("cri")Criteria cri);


}
