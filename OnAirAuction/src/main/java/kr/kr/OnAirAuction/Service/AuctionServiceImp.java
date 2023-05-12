package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kr.OnAirAuction.DAO.AuctionDAO;
import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.AuctionTypeVO;
import kr.kr.OnAirAuction.VO.AuctionVO;

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
