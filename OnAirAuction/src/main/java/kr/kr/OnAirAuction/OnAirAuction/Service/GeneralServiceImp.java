package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kr.OnAirAuction.DAO.GeneralDAO;
import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.AuctionRecordVO;
import kr.kr.OnAirAuction.VO.AuctionVO;
import kr.kr.OnAirAuction.VO.FileVO;
import kr.kr.OnAirAuction.VO.InquiryVO;
import kr.kr.OnAirAuction.VO.MemberVO;
import kr.kr.OnAirAuction.VO.MembershipLevelVO;
import kr.kr.OnAirAuction.VO.ProdCategoryVO;
import kr.kr.OnAirAuction.VO.ProductLikeVO;
import kr.kr.OnAirAuction.VO.ProductVO;
import kr.kr.OnAirAuction.VO.ReviewVO;
import kr.kr.OnAirAuction.VO.SellerLikeVO;
import kr.kr.OnAirAuction.VO.StoreVO;
import kr.kr.OnAirAuction.VO.VirtualAccountVO;

@Service
public class GeneralServiceImp implements GeneralService{
	
	@Autowired
	GeneralDAO generalDao;

	// 일반 경매 목록
	@Override
	public ArrayList<ProductVO> getGeneralList(Criteria cri) {
		cri = cri == null ? new Criteria() : cri;
		return generalDao.selectGeneralList(cri);
	}
	
	// 일반 경매의 전체의 수
	@Override
	public int getGeneralTotalCount(Criteria cri) {
		cri = cri == null ? new Criteria() : cri;
		return generalDao.selectTotalCountProduct(cri);
	}
	
	// 일반 경매 상품
	@Override
	public ProductVO getGeneralProduct(int pr_code) {
		// 상품 가져오기
		ProductVO product = generalDao.selectGeneral(pr_code);
	    return product;
	}
	
	// 일반 경매 카테고리
	@Override
	public ProdCategoryVO getProdCategory(int pr_code) {
		ProductVO product = generalDao.selectGeneral(pr_code);
		// 카테고리 가져오기
		ProdCategoryVO prodCategory = generalDao.selectProdCategory(product.getPr_pc_num());
		return prodCategory;
	}
	
	// 경매 정보
	@Override
	public AuctionVO getAuction(int au_num) {
		AuctionVO auction = generalDao.selectAuction(au_num);
		return auction;
	}

	// 스토어 정보
	@Override
	public StoreVO getStore(int pr_code) {
		StoreVO store = generalDao.selectStore(pr_code);
		return store;
	}
	
	// 경매 기록
	@Override
	public ArrayList<AuctionRecordVO> getAuctionRecord(int pr_code) {
		ArrayList<AuctionRecordVO> auctionRecord = generalDao.selectAuctionRecord(pr_code);
		return auctionRecord;
	}
	
	// 경매 최근 기록
	@Override
	public ArrayList<AuctionRecordVO> selectAuctionRecordList() {
		return generalDao.selectAuctionRecordList();
	}

	// 이미지 파일
	@Override
	public ArrayList<FileVO> getProdFileList(int pr_code) {
		return generalDao.selectProdFileList(pr_code);
	}
	
	// 상품 후기
	@Override
	public ArrayList<ReviewVO> getReview(int pr_code) {
		ArrayList<ReviewVO> reviews = generalDao.selectReview(pr_code);
	    return reviews;
	}
	
	// 입찰하기: 가상계좌
	@Override
	public VirtualAccountVO getUserAccount(String id) {
		return generalDao.selectUserAccount(id);
	}

	// 입찰하기: 회원등급
	@Override
	public MembershipLevelVO getMembership(String membershipName) {
		return generalDao.selectMembership(membershipName);
	}

	// 입찰하기: 입찰 등록
	@Override
	public boolean insertBid(int price, MemberVO user, VirtualAccountVO userAccount, int expense, int auctionNum) {
		double a = userAccount.getVa_holding_amount(); 
		double b = price + (price * expense * 0.001);
		String id = user.getMe_id();
		if(b > a) {
			System.out.println("보유잔액이 부족합니다.");
			return false;
		}
		else if (b <= a) {
			System.out.println("입찰되었습니다.");
			generalDao.insertAuctionRecord(price, id, auctionNum);
			return true;
		}
		return true;
	}
	
	// 상품 문의
	@Override
	public ArrayList<InquiryVO> getInquiry(int pr_code) {
		return generalDao.selectInquiry(pr_code);
	}

	// 상품 문의 목록 수
	@Override
	public int getInquiryTotalCount(Criteria cri) {
		cri = cri == null ? new Criteria() : cri;
		return generalDao.selectTotalCountInquiry(cri);
	}
	
	// 상품 후기 목록 수
	@Override
	public int getReviewTotalCount(Criteria cri) {
		cri = cri == null ? new Criteria() : cri;
		return generalDao.selectTotalCountReview(cri);
	}

	// 상픔 좋아요
	@Override
	public Map<String, Object> likeProduct(int productCode, String userId, int productLikeState) {
		boolean res;
		Map<String, Object> map = new HashMap<String, Object>();
		if(productLikeState == 0) {
			productLikeState = 1;
			updateProductLike(productCode, userId, productLikeState);
			res = true;
			map.put("productLikeState", productLikeState);
			map.put("res", res);
		}else if(productLikeState == 1) {
			productLikeState = 0;
			updateProductLike(productCode, userId, productLikeState);
			res = false;
			map.put("productLikeState", productLikeState);
			map.put("res", res);
		}
		return map;
	}

	// 상품 좋아요 가져오기
	@Override
	public ProductLikeVO selectProductLike(int productCode,  String userId) {
		return generalDao.selectProductLike(productCode, userId);
	}

	// 상품 좋아요 등록
	@Override
	public void insertProductLike(int productCode, String userId, int num) {
		generalDao.insertProductLike(productCode, userId, num);
	}

	// 상품 좋아요 수정
	@Override
	public void updateProductLike(int productCode, String userId, int productLikeState) {
		ProductLikeVO table = generalDao.selectProductLike(productCode, userId);
		if(table.getPl_state() == 0) {
			generalDao.updateProductLike(table, productLikeState);
		}else if(table.getPl_state() == 1) {
			generalDao.updateProductLike(table, productLikeState);
		}
	}

}