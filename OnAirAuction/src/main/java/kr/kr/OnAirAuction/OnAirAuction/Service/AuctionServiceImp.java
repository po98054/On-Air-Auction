package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kr.OnAirAuction.DAO.AuctionDAO;
import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.AuctionTypeVO;
import kr.kr.OnAirAuction.VO.AuctionVO;
import kr.kr.OnAirAuction.VO.MemberVO;
import kr.kr.OnAirAuction.VO.ProductVO;

@Service
public class AuctionServiceImp implements AuctionService {
	
	@Autowired
	AuctionDAO auctionDao;

	@Override
	public boolean insertAuction(AuctionVO auction, MemberVO user/*, ProductVO product*/) {
		if(user == null)
			return false;
		/*if(product == null)
			return false;*/
		auction.setAu_me_id(user.getMe_id());
		//auction.setAu_pr_code(product.getPr_code());
		auctionDao.insertAuction(auction);
		return true;
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
	
	@Override
	public ProductVO getPrcode(int au_pr_code) {
		ProductVO code = auctionDao.selectProduct(au_pr_code); 
		return null;
	}

}
