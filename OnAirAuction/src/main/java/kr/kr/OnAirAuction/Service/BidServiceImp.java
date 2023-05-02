package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kr.OnAirAuction.DAO.BidDAO;
import kr.kr.OnAirAuction.DAO.ProductDAO;
import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.BidVO;
import kr.kr.OnAirAuction.VO.MemberVO;
import kr.kr.OnAirAuction.VO.ProductVO;

@Service
public class BidServiceImp implements BidService {

	@Autowired
    BidDAO bidDao;
	ProductDAO productDao;
	
	@Override
	public boolean insertImmediate(MemberVO user, BidVO bid) {
		if(user == null)
			return false;
		bid.setAr_me_id(user.getMe_id());
		bidDao.insertImmediate(bid);
		return true;
	}
	
	@Override
	public ArrayList<BidVO> getBidlist(Criteria cri, int pr_code) {
		ProductVO prod = productDao.selectProduct(pr_code);
		if(cri == null)
			cri = new Criteria();
		return bidDao.selectBidlist(cri);
	}

	@Override
	public int getBidlistTotalCount(Criteria cri) {
		return bidDao.selectBidlistTotalCount(cri);
	}


}
