package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kr.OnAirAuction.DAO.GeneralDAO;
import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.AuctionVO;
import kr.kr.OnAirAuction.VO.MemberVO;
import kr.kr.OnAirAuction.VO.ProductVO;
import kr.kr.OnAirAuction.VO.Product_categoryVO;
import kr.kr.OnAirAuction.VO.Product_likeVO;
import kr.kr.OnAirAuction.VO.Seller_likeVO;
import kr.kr.OnAirAuction.VO.StoreVO;

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
	
	// 일반 경매 상품
	@Override
	public ProductVO getGeneralProduct(int pr_code) {
		// 상품 가져오기
		ProductVO product = generalDao.selectGeneral(pr_code);
	    return product;
	}
	
//	// 일반 경매 상품 카테고리
//	@Override
//	public Product_categoryVO getProdCategory(int pr_code) {
//		ProductVO product = generalDao.selectGeneral(pr_code);
//		// 카테고리 가져오기
//		Product_categoryVO prodCategory = generalDao.selectProdCategory(product.getPr_pc_num());
//		return prodCategory;
//	}
	
	@Override
	public int getGeneralTotalCount(Criteria cri) {
		cri = cri == null ? new Criteria() : cri;
		return generalDao.selectTotalCountProduct(cri);
	}
	
	// 상품 찜하기
	@Override
	public int updateLikeProduct(int pl_pr_code, int pl_state, MemberVO user) {
		// 기존의 찜의 유무 정보를 가져옴
		Product_likeVO pLikeVo = generalDao.selectLikeProductById(user.getMe_id(), pl_pr_code);
		// 없으면 추가
		if(pLikeVo == null) {
			pLikeVo = new Product_likeVO(pl_state, user.getMe_id(), pl_pr_code);
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
	
	// 판매자 찜하기
	@Override
	public int updateLikeSeller(String sl_seller_id, int sl_state, MemberVO user) {
		// 기존의 찜의 유무 정보를 가져옴
		Seller_likeVO sLikeVo = generalDao.selectLikeSellerById(user.getMe_id(), sl_seller_id);
		// 없으면 추가
		if(sLikeVo == null) {
			sLikeVo = new Seller_likeVO(sl_seller_id, user.getMe_id(), sl_state);
			generalDao.insertLikeSeller(sLikeVo);
			return sl_state;
		}
		// 있으면 수정
		if(sl_state != sLikeVo.getSl_state()) {
			// 현재 상태와 기존 상태가 다르면 => 상태를 바꿔야 함
			sLikeVo.setSl_state(sl_state);
			// 업데이트
			generalDao.updateLikeSeller(sLikeVo);
			// sl_state로 리턴
			return sl_state;
			}
			// 현재 상태와 기존상태가 같으면 => 찜 무
			sLikeVo.setSl_state(0);	
			// 업데이트
			generalDao.updateLikeSeller(sLikeVo);
			// 0을 리턴
			return 0;
	}

	// 상세페이지 상품 좋아요 가져오기
	@Override
	public Product_likeVO getLikeProduct(MemberVO user, int pr_code) {
		if(user == null)
			return null;
		return generalDao.selectLikeProductById(user.getMe_id(), pr_code);
	}

	// 경매정보 가져오기
	@Override
	public AuctionVO getAuction(int pr_code) {
		AuctionVO auction = generalDao.selectAuction(pr_code);
		return auction;
	}

	// 스토어 정보 가져오기
	@Override
	public StoreVO getStore(int pr_code) {
		StoreVO store = generalDao.selectStore(pr_code);
		return store;
	}
	

}
