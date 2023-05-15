package kr.kh.onairauction.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.kh.onairauction.dao.AuctionDAO;
import kr.kh.onairauction.vo2.SellerLikeVO;
import kr.kh.onairauction.vo2.AuctionRecordVO;
import kr.kh.onairauction.vo2.AuctionVO;
import kr.kh.onairauction.vo2.MemberVO;
import kr.kh.onairauction.vo2.MembershipLevelVO;
import kr.kh.onairauction.vo2.MessageVO;
import kr.kh.onairauction.vo2.ProductLikeVO;
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
		if(message.getMe_content() == ""||message.getMe_title()=="")//수정해야함
			return false;
		if(auctionDAO.insertMessage(message) != 0)
			return true;
		return false;
	}
	@Override
	public ArrayList<AuctionRecordVO> selectAuctionRecord(int auctionNum){
		return auctionDAO.selectAuctionRecord(auctionNum);
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
	@Override
	public boolean timeChange(Date a, Date b) {
		SimpleDateFormat date = new SimpleDateFormat("yyMMddHHmmss");
		String auctionOpenTime = date.format(a);
		String now = date.format(b);
		System.out.println(auctionOpenTime);
		System.out.println(now);
		//a와 b를 비교해서 a가 더 크면 false, b가 더 크면 true를 리턴
		try{
            long number1 = Long.parseLong(auctionOpenTime);
            long number2 = Long.parseLong(now);
            
	            if(number1 <= number2) {
	            	return true;
	            }else if(number1 > number2) {
	            	return false;
	            }
        }
        catch (NumberFormatException ex){
            ex.printStackTrace();
        }
		return false;
	}
	@Override
	public SellerLikeVO selectSellerLike(String userId, String sellerId) {
		return auctionDAO.selectSellerLike(userId, sellerId);
	}
	@Override
	public void insertSellerLike(String userId, String sellerId, int num) {
		auctionDAO.insertSellerLike(userId, sellerId, num);
	}
	@Override
	public void updateSellerLike(String userId, String sellerId, int sellerLikeState) {
		SellerLikeVO table = auctionDAO.selectSellerLike(userId, sellerId);
		if(table.getSl_state() == 0) {
			auctionDAO.updateSellerLike(table, sellerLikeState);
		}else if(table.getSl_state() == 1) {
			auctionDAO.updateSellerLike(table, sellerLikeState);
		}
		
	}
	@Override
	public ProductLikeVO selectProductLike(int productCode, String userId) {
		return auctionDAO.selectProductLike(productCode, userId);
	}
	@Override
	public void insertProductLike(int productCode, String userId, int num) {
		auctionDAO.insertProductLike(productCode, userId, num);
		
	}
	@Override
	public void updateProductLike(int productCode, String userId, int productLikeState) {
		ProductLikeVO table = auctionDAO.selectProductLike(productCode, userId);
		if(table.getPl_state() == 0) {
			auctionDAO.updateProductLike(table, productLikeState);
		}else if(table.getPl_state() == 1) {
			auctionDAO.updateProductLike(table, productLikeState);
		}
		
	}
	
	
	
}