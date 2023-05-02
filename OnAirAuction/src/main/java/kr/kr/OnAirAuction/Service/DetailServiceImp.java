package kr.kr.OnAirAuction.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kr.OnAirAuction.DAO.ProductDAO;
import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.LikeVO;
import kr.kr.OnAirAuction.VO.MemberVO;
import kr.kr.OnAirAuction.VO.ProductVO;

@Service
public class DetailServiceImp implements DetailService{
	
	@Autowired
	ProductDAO productDao;

	@Override
	public ProductVO getProduct(int pr_code) {
		ProductVO product = productDao.selectProduct(pr_code);
		return null;
	}

	@Override
	public ArrayList<ProductVO> getProductList(Criteria cri) {
		cri = cri == null ? new Criteria() : cri;
		return productDao.selectProductList(cri);
	}

	@Override
	public int getProductTotalCount(Criteria cri) {
		cri = cri == null ? new Criteria() : cri;
		return productDao.selectTotalCountProduct(cri);
	}

	@Override
	public int updateLike(MemberVO user, int pl_pr_code, int pl_state) {
		// 기존의 찜의 유무 정보를 가져옴
		LikeVO likeVo = productDao.selectLikeById(user.getMe_id(), pl_pr_code);
		// 없으면 추가
		if(likeVo == null) {
			likeVo = new LikeVO(pl_state, user.getMe_id(), pl_pr_code);
			productDao.insertLike(likeVo);
			return pl_state;
		}
		// 있으면 수정
		if(pl_state != likeVo.getPl_state()) {
			// 현재 상태와 기존 상태가 다르면 => 상태를 바꿔야 함
			likeVo.setPl_state(pl_state);
			// 업데이트
			productDao.updateLike(likeVo);
			// pl_state로 리턴
			return pl_state;
			}
			// 현재 상태와 기존상태가 같으면 => 찜 무
			likeVo.setPl_state(0);	
			// 업데이트
			productDao.updateLike(likeVo);
			// 0을 리턴
			return 0;
	}

	@Override
	public void updateProductByLike(int pl_pr_code) {
		productDao.updateProductByLike(pl_pr_code);
	}


}
