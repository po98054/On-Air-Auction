package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kr.OnAirAuction.DAO.MainDAO;
import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.FileVO;
import kr.kr.OnAirAuction.VO.ProductVO;

@Service
public class MainServiceImp implements MainService {

	@Autowired
	MainDAO mainDao;

	@Override
	public ArrayList<ProductVO> getProductList(Integer pr_code) {
		return mainDao.selectProduct(pr_code);
	}

	@Override
	public ArrayList<FileVO> getFileList(Integer fi_num) {
		return mainDao.selectFileList(fi_num);
	}


}