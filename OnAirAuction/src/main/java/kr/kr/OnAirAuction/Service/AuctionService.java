package kr.kh.onAirAuction.service;

import java.util.ArrayList;

import kr.kh.onAirAuction.vo.AuctionTypeVO;
import kr.kh.onAirAuction.pagination.Criteria;
import kr.kh.onAirAuction.vo.AuctionVO;

public interface AuctionService {

	void insertAuction(AuctionVO auction);
	
	ArrayList<AuctionVO> getAuctionList(Criteria cri);

	int getBoardTotalCount(Criteria cri);

}
