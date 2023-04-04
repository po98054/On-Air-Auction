package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import kr.kr.OnAirAuction.Pagination.Criteria;

import kr.kr.OnAirAuction.VO.AuctionCancleVO;

import kr.kr.OnAirAuction.VO.HeldAuctionVO;

import kr.kr.OnAirAuction.VO.ParticipateAuctionVO;

public interface MyPageService {
	
	// 경매 참가 내역 조회 서비스

	ArrayList<ParticipateAuctionVO> getPartAuctList(Criteria criteria);

	int getPartAuctTotalCount(Criteria criteria);

	ArrayList<HeldAuctionVO> getHeldAuctList(Criteria criteria);

	int getHeldAuctTotalCount(Criteria criteria);

	ArrayList<HeldAuctionVO> getHeldList(int ac_num);

	boolean insertAuctionCancle(AuctionCancleVO auctionCancle);
	
}
