package kr.kh.onairauction.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import kr.kh.onairauction.vo.AuctionRecordVO;
import kr.kh.onairauction.vo.AuctionVO;
import kr.kh.onairauction.vo.BoardListVO;
import kr.kh.onairauction.vo.ChattingVO;
import kr.kh.onairauction.vo.DeliveryVO;
import kr.kh.onairauction.vo.FileVO;
import kr.kh.onairauction.vo.MemberVO;
import kr.kh.onairauction.vo.MembershipLevelVO;
import kr.kh.onairauction.vo.MessageVO;
import kr.kh.onairauction.vo.AuctionOrderVO;
import kr.kh.onairauction.vo.ProductLikeVO;
import kr.kh.onairauction.vo.ProductVO;
import kr.kh.onairauction.vo.ReportCategoryVO;
import kr.kh.onairauction.vo.ReportVO;
import kr.kh.onairauction.vo.SellerLikeVO;
import kr.kh.onairauction.vo.VirtualAccountVO;

public interface AuctionService {
	
	ArrayList<ReportCategoryVO> selectReportCategory();

	boolean insertReport(ReportVO report);
	
	boolean insertMessage(MessageVO message);
	
	ArrayList<AuctionRecordVO> selectAuctionRecord(String auctionStart, int productPrice, String sellerId, int auctionNum);
	
	MemberVO getUser(String me_id);
	
	boolean insertBid(double price, int expense, VirtualAccountVO userAccount, MemberVO user, int auctionNum);
	
	MembershipLevelVO selectMebership(String levelName);

	VirtualAccountVO selectAccount(String id);
	
	AuctionVO getAuction(int num);

	ProductVO selectProduct(int productCode);

	MemberVO selectSeller(String sellerId);
	
	boolean timeChange(Date a, Date b);

	SellerLikeVO selectSellerLike(String userId, String sellerId);

	void insertSellerLike(String userId, String sellerId, int num);

	void updateSellerLike(String userId, String sellerId, int sellerLikeState);

	ProductLikeVO selectProductLike(int productCode, String userId);

	void insertProductLike(int productCode, String userId, int num);

	void updateProductLike(int productCode, String userId, int productLikeState);
	
	String endTime(AuctionRecordVO lastRecord, AuctionVO auction);
	
	Map<String, Object> sellerLike(int sellerLikeState, String userId, String sellerId);
	
	Map<String, Object> productLike(int productCode, String userId, int productLikeState);

	void insertAuctionRecord(String auctionStart, int pr_start_price, String me_id, int au_num);
	
	AuctionRecordVO lastAuctionRecord(int auctionNum);

	boolean finishAuction(int intNow, int intEnd2, AuctionVO auction);

	ArrayList<BoardListVO> selectBoardList(String me_id);

	AuctionOrderVO insertOrder(AuctionVO auction);

	void insertDelivery(int ao_num, int bl_num);

	ChattingVO selectChatting(int au_num);

	void insertChattingRecord(String message, String sender, String room);

	ArrayList<FileVO> selectFile(int productCode);

	AuctionOrderVO selectAuctionOrder(int au_num);

	DeliveryVO selectDelivery(int ao_num);

	void updateDelivery(int ao_num, int bl_num);
}