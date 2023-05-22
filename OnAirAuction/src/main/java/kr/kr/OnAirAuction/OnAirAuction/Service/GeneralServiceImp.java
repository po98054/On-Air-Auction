package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

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
		return generalDao.selectReview(pr_code);
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
	
	
	// ---------------------------------------------------------------------------------
	
//	
//	
//	@Override
//	public boolean insertImmediate(MemberVO user, AuctionVO bid) {
//		if(user == null)
//			return false;
//		//bid.setAr_me_id(user.getMe_id());
//		generalDao.insertImmediate(bid);
//		return true;
//	}
	
//	// 판매자 찜하기
//	@Override
//	public int updateLikeSeller(String sl_seller_id, int sl_state, MemberVO user) {
//		// 기존의 찜의 유무 정보를 가져옴
//		SellerLikeVO sLikeVo = generalDao.selectLikeSellerById(user.getMe_id(), sl_seller_id);
//		// 없으면 추가
//		if(sLikeVo == null) {
//			sLikeVo = new SellerLikeVO(sl_seller_id, user.getMe_id(), sl_state);
//			generalDao.insertLikeSeller(sLikeVo);
//			return sl_state;
//		}
//		// 있으면 수정
//		if(sl_state != sLikeVo.getSl_state()) {
//			// 현재 상태와 기존 상태가 다르면 => 상태를 바꿔야 함
//			sLikeVo.setSl_state(sl_state);
//			// 업데이트
//			generalDao.updateLikeSeller(sLikeVo);
//			// sl_state로 리턴
//			return sl_state;
//			}
//			// 현재 상태와 기존상태가 같으면 => 찜 무
//			sLikeVo.setSl_state(0);	
//			// 업데이트
//			generalDao.updateLikeSeller(sLikeVo);
//			// 0을 리턴
//			return 0;
//	}
//	
//	
	

	@Override
	public ProductLikeVO getProdLike(MemberVO user, int pr_code) {
		if(user == null)
			return null;
		ProductLikeVO pLikeVo = generalDao.selectProdLikeById(user.getMe_id(), pr_code);
		return pLikeVo;
	}

	// 상품 문의
	@Override
	public ArrayList<InquiryVO> getInquiry(int pr_code) {
		return generalDao.selectInquiry(pr_code);
	}

	@Override
	public boolean insertInquiry(InquiryVO inquiry) {
		System.out.println(inquiry); 
		if(inquiry.getIn_me_id() == "")
			return false;
		if(generalDao.insertInquiry(inquiry) != 0)
			return true;
		return false;
	}

	
//	// 상품 문의 카테고리
//	@Override
//	public InquiryCategoryVO getInquCategory(int pr_code) {
//		return generalDao.selectInquCategory(pr_code);
//	}

	

//	@Override
//	public ProductLikeVO getProdLike(MemeberVO user, int me_id) {
//		if(user == null)
//			return null;
//		ProductLikeVO pLikeVo = generalDao.selectProdLikeById(user.getMe_id(), pr_code);
//		return pLikeVo;
//	}


	
	

    // 사용하면 안되는 코드
	/*
	// 상세페이지 상품 좋아요 가져오기
	@Override
	public ProductLikeVO getLikeProduct(MemberVO user, int pr_code) {
		if(user == null)
			return null;
		return generalDao.selectLikeProductById(user.getMe_id(), pr_code);
	}	
	// 상품 찜하기
	@Override
	public int updateLikeProduct(int pl_pr_code, int pl_state, MemberVO user) {
		// 기존의 찜의 유무 정보를 가져옴
		ProductLikeVO pLikeVo = generalDao.selectLikeProductById(user.getMe_id(), pl_pr_code);
		// 없으면 추가
		if(pLikeVo == null) {
			pLikeVo = new ProductLikeVO(pl_state, user.getMe_id(), pl_pr_code);
			generalDao.insertLikeProduct(pLikeVo);
			return pl_state;
		}
		// 있으면 수정
		if(pl_state != pLikeVo.getPl_state()) {
			// 현재 상태와 기존 상태가 다르면 => 상태를 바꿔야 함
			pLikeVo.setPl_state(pl_state);
			// 업데이트
			generalDao.updateLikeProduct(pLikeVo);
			// pl_state로 리턴
			return pl_state;
			}
			// 현재 상태와 기존상태가 같으면 => 찜 무
			pLikeVo.setPl_state(0);	
			// 업데이트
			generalDao.updateLikeProduct(pLikeVo);
			// 0을 리턴
			return 0;
	}
	
	*/
	
}
