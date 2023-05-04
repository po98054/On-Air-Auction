package kr.kh.onairauction.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.kh.onairauction.dao.AuctionDAO;
import kr.kh.onairauction.vo.AuctionRecordVO;
import kr.kh.onairauction.vo.MemberVO;
import kr.kh.onairauction.vo.MembershipLevelVO;
import kr.kh.onairauction.vo.NoteBoxVO;
import kr.kh.onairauction.vo.ProductVO;
import kr.kh.onairauction.vo.ReportCategoryVO;
import kr.kh.onairauction.vo.ReportVO;
import kr.kh.onairauction.vo.VirtualAccountVO;
import kr.kh.onairauction.vo2.AuctionVO;
import kr.kh.onairauction.vo2.MessageVO;

@Service
public class AuctionServiceImp implements AuctionService {
	@Autowired
	AuctionDAO auctionDAO;
	
	@Override
	public String getEmail(String id) {
		return auctionDAO.getEmail(id);
	}
	@Override
	public ArrayList<kr.kh.onairauction.vo2.ReportCategoryVO> getReportCategoryName(){
		return auctionDAO.selectReportCategory();
	}
	@Override
	public boolean register(kr.kh.onairauction.vo2.ReportVO report) {
		if(report == null)
			return false;
		if(auctionDAO.insertReport(report) != 0)
			return true;
		return false;
	}
	@Override
	public boolean registerNote(MessageVO note) {
		if(note == null)
			return false;
		if(auctionDAO.insertNote(note) != 0)
			return true;
		return false;
	}
	@Override
	public ArrayList<kr.kh.onairauction.vo2.AuctionRecordVO> getAuctionRecordList(){
		return auctionDAO.selectAuctionRecord();
	}
	@Override
	public kr.kh.onairauction.vo2.MemberVO getUser(String id) {
		
		return auctionDAO.selectMember(id);
	}
	@Override
	public kr.kh.onairauction.vo2.ProductVO getProduct(int num) {
		
		return auctionDAO.selectProduct(num);
	}
	@Override
	public boolean insertBid(Double price, int expense, kr.kh.onairauction.vo2.VirtualAccountVO account, kr.kh.onairauction.vo2.MemberVO user, int auctionNum) {
		double a = account.getVa_holding_amount(); 
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
	public kr.kh.onairauction.vo2.MembershipLevelVO getMebership(String levelName) {
		
		return auctionDAO.selectMembership(levelName);
	}
	@Override
	public kr.kh.onairauction.vo2.VirtualAccountVO selectAccount(String id) {
		
		return auctionDAO.selectAccount(id);
	}
	@Override
	public AuctionVO getAuction(String id) {
		
		return auctionDAO.selectAuction(id);
	}
	
	
	
}