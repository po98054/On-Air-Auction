package kr.kh.onAirAuction.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.onAirAuction.dao.ProductDAO;
import kr.kh.onAirAuction.pagination.Criteria;
import kr.kh.onAirAuction.vo.ProductVO;
import kr.kh.onAirAuction.utils.UploadFileUtils;
import kr.kh.onAirAuction.vo.FileVO;
import kr.kh.onAirAuction.vo.ProductCategoryVO;


@Service
public class ProductServiceImp implements ProductService {

	@Autowired
	ProductDAO productDao;
	
	String uploadPath = "D:\\uploadfiles";
	
	//상품 등록
	@Override
	public void insert(ProductCategoryVO pc, ProductVO vo, MultipartFile[] files) {
		productDao.insertCategory(pc);
		productDao.insertBoard(vo);	
		uploadFiles(files, vo.getPr_code());
	}
	
	//첨부파일
	private void uploadFiles(MultipartFile [] files, int pr_code) {
		if(files == null || files.length == 0)
			return ;
		for(MultipartFile file : files) {
			if(file == null || file.getOriginalFilename().length() == 0)
				continue;
			String fileName = "";
			try {
				fileName = UploadFileUtils.uploadFile(uploadPath, 
						file.getOriginalFilename(),
						file.getBytes()); 
			} catch (Exception e) {
				e.printStackTrace();
			} 
			System.out.println(fileName);
			FileVO fileVo = new FileVO(file.getOriginalFilename(), fileName, pr_code);
			productDao.insertFile(fileVo, pr_code);
		}
	}
	
	// 상품 리스트
	@Override
	public ArrayList<ProductVO> getProductList(Criteria cri) {
		return productDao.selectProductList(cri);
	}
	@Override
	public int getProductTotalCount(Criteria cri) {
		return productDao.selectProductTotalCount(cri);
	}
	
	// 상품 상세페이지
	@Override
	public ProductVO getProduct(int pr_code) {
		return productDao.selectProduct(pr_code);
	}
	@Override
	public ArrayList<FileVO> getFileList(int pr_code) {
		return productDao.selectFileList(pr_code);
	}
	
	// 상품 삭제
	@Override
	public boolean deleteProduct(int pr_code) {
		ProductVO vo = productDao.selectProduct(pr_code);	
		ArrayList<FileVO> fileList = productDao.selectFileList(pr_code);
		deleteFileList(fileList);
		return productDao.deleteProduct(pr_code) != 0;
	}
	private void deleteFileList(ArrayList<FileVO> fileList) {
		if(fileList == null || fileList.size() == 0) 
			return;
		for(FileVO file : fileList) {
			if(file == null)
				continue;
			UploadFileUtils.removeFile(uploadPath, file.getFi_savename());
			productDao.deleteFile(file);
		}	
	}
	
	// 상품 수정
	@Override
	public boolean updateProduct(ProductVO vo, MultipartFile[] files, int[] fileNums) {
		ProductVO dbvo = productDao.selectProduct(vo.getPr_code());
		if(dbvo == null)
			return false;
		if(productDao.updateProduct(vo) == 0)
			return false;
		uploadFiles(files, vo.getPr_code());
		if(fileNums == null || fileNums.length == 0)
			return true;
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		for(int fileNum : fileNums) {
			FileVO fileVo = productDao.selectFile(fileNum);
			if(fileVo != null)
				fileList.add(fileVo);
		}	
		deleteFileList(fileList);	
		return true;
	}	
}
