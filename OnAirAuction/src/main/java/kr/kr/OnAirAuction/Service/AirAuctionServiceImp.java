package kr.kh.onairauction.service;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.kh.onairauction.dao.AuctionDAO;
import kr.kh.onairauction.vo2.AuctionRecordVO;
import kr.kh.onairauction.vo2.AuctionVO;
import kr.kh.onairauction.vo2.MemberVO;
import kr.kh.onairauction.vo2.MembershipLevelVO;
import kr.kh.onairauction.vo2.MessageVO;
import kr.kh.onairauction.vo2.ProductVO;
import kr.kh.onairauction.vo2.ReportCategoryVO;
import kr.kh.onairauction.vo2.ReportVO;
import kr.kh.onairauction.vo2.VirtualAccountVO;

@Service
public class AuctionServiceImp implements AuctionService {
	@Autowired
	AuctionDAO auctionDAO;
	
	
	@Override
	public ArrayList<ReportCategoryVO> selectReportCategory(){
		return auctionDAO.selectReportCategory();
	}
	@Override
	public boolean insertReport(ReportVO report) {
		if(report == null)
			return false;
		if(auctionDAO.insertReport(report) != 0)
			return true;
		return false;
	}
	@Override
	public boolean insertMessage(MessageVO message) {
		System.out.println(message); //수정해야함 (유저아이디or셀러아이디가 없을 경우 false)
		if(message.getMe_content() == "")//수정해야함
			return false;
		if(auctionDAO.insertMessage(message) != 0)
			return true;
		return false;
	}
	@Override
	public ArrayList<AuctionRecordVO> selectAuctionRecord(){
		return auctionDAO.selectAuctionRecord();
	}
	@Override
	public MemberVO getUser(String me_id) { //나중에 삭제
		
		return auctionDAO.selectMember(me_id);
	}
	@Override
	public boolean insertBid(Double price, int expense, VirtualAccountVO userAccount, MemberVO user, int auctionNum) {
		double a = userAccount.getVa_holding_amount(); 
		double b = price + (price * expense * 0.001);
		String id = user.getMe_id();
		if(b > a) {
			System.out.println("보유잔액이 부족합니다.");
			return false;
		}
		else if (b <= a) {
			System.out.println("입찰되었습니다.");
			auctionDAO.insertAuctionRecord(price, id, auctionNum);
			return true;
		}
		return false;
	}
	@Override
	public MembershipLevelVO selectMebership(String levelName) {
		
		return auctionDAO.selectMembership(levelName);
	}
	@Override
	public VirtualAccountVO selectAccount(String id) {
		
		return auctionDAO.selectAccount(id);
	}
	@Override
	public AuctionVO getAuction(String id) { //나중에 삭제
		
		return auctionDAO.selectAuction(id);
	}
	@Override
	public ProductVO selectProduct(int productCode) {
		
		return auctionDAO.selectProduct(productCode);
	}
	@Override
	public MemberVO selectSeller(String sellerId) {
		
		return auctionDAO.selectSeller(sellerId);
	}
	
	
	
}