package kr.kh.onAirAuction.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.onAirAuction.dao.AuctionDAO;
import kr.kh.onAirAuction.dao.ProductDAO;
import kr.kh.onAirAuction.pagination.Criteria;
import kr.kh.onAirAuction.vo.AuctionTypeVO;
import kr.kh.onAirAuction.vo.AuctionVO;

@Service
public class AuctionServiceImp implements AuctionService {
	
	@Autowired
	AuctionDAO auctionDao;

	@Override
	public void insertAuction(AuctionVO auction) {
		auctionDao.insertAuction(auction);
	}
	
	@Override
	public ArrayList<AuctionVO> getAuctionList(Criteria cri) {
		return auctionDao.selectAuctionList(cri);
	}

	@Override
	public int getAuctionTotalCount(Criteria cri) {
		return auctionDao.selectAuctionTotalCount(cri);
	}

	@Override
	public AuctionVO getAuction(int au_num) {
		return  auctionDao.selectAuction(au_num);
	}


}
