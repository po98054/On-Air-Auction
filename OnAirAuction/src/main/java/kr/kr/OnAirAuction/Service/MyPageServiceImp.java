package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import org.springframework.web.multipart.MultipartFile;

import kr.kr.OnAirAuction.DAO.MyPageDAO;

import kr.kr.OnAirAuction.Pagination.Criteria;

import kr.kr.OnAirAuction.Utils.UploadFileUtils;

import kr.kr.OnAirAuction.VO.AuctionCancleVO;

import kr.kr.OnAirAuction.VO.FileVO;

import kr.kr.OnAirAuction.VO.HeldAuctionVO;

import kr.kr.OnAirAuction.VO.ParticipateAuctionVO;

import kr.kr.OnAirAuction.VO.ReviewVO;

@Service
public class MyPageServiceImp implements MyPageService{
	
	@Autowired
	MyPageDAO myPageDao;
	
	String uploadPath = "C:/Users/82108/Pictures/fileUpload";
	
	// 경매 참가 내역 조회 서비스

	@Override
	public ArrayList<ParticipateAuctionVO> getPartAuctList(Criteria criteria) {
		
		if(criteria == null) {
			
			criteria = new Criteria();
			
		}
		
		return myPageDao.selectPartAuctList(criteria);
		
	}
	
	// 경매 개최 내역 조회 서비스

	@Override
	public int getPartAuctTotalCount(Criteria criteria) {

		return myPageDao.selectPartAuctTotalCount(criteria);
		
	}

	@Override
	public ArrayList<HeldAuctionVO> getHeldAuctList(Criteria criteria) {
		
		if(criteria == null) {
			
			criteria = new Criteria();
			
		}
		
		return myPageDao.selectHeldAuctList(criteria);
		
	}

	@Override
	public int getHeldAuctTotalCount(Criteria criteria) {
		
		return myPageDao.selectHeldAuctTotalCount(criteria);
		
	}

	@Override
	public ArrayList<HeldAuctionVO> getHeldList(int ac_num) {
		
		return myPageDao.selectHeldList(ac_num);
		
	}

	@Override
	public boolean insertAuctionCancle(AuctionCancleVO auctionCancle) {
		
		if(auctionCancle == null) {
			
			return false;
			
		}
		
		return myPageDao.insertAuctionCancle(auctionCancle) != 0;
		
	}
	
	// 후기 등록

	@Override
	public boolean insertReview(ReviewVO review, MultipartFile[] files) {
		
		if(review == null || review.getRe_title() == null|| review.getRe_title().trim().length() == 0) {
			
			return false;
			
		}
		
		if(review.getRe_content() == null || review.getRe_content().trim().length() == 0) {
			
			return false;
			
		}
		
		myPageDao.insertReview(review);
		
		uploadFiles(files, review.getRe_num());
		
		return true;
		
		
	}
	
	// 첨부 파일

	private void uploadFiles(MultipartFile [] files, int re_num) {
		
		if(files == null || files.length == 0)
			
			return ;
		
		//반복문
		for(MultipartFile file : files) {
			
			if(file == null || file.getOriginalFilename().length() == 0)
				
				continue;
			
			String fileName = "";
			
			//첨부파일 서버에 업로드
			
			try {
				
				fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()); 
						
			} catch (Exception e) {
				
				e.printStackTrace();
				
			} 
			
			System.out.println(fileName);
			
			//첨부파일 객체를 생성
			FileVO fileVo = new FileVO(file.getOriginalFilename(), fileName, re_num);
			
			//다오에게서 첨부파일 정보를 주면서 추가하라고 요청
			myPageDao.insertFile(fileVo);
		}
	}

	@Override
	public ParticipateAuctionVO getPate(Integer re_ar_num) {
		
		ParticipateAuctionVO pate = myPageDao.selectAuction(re_ar_num); 
		
		return null;
		
	}
	
	// 후기 조회

	@Override
	public ArrayList<ReviewVO> getReviewList(Criteria criteria) {
		
		if(criteria == null) {
			
			criteria = new Criteria();
			
		}
		
		return myPageDao.selectReviewList(criteria);
		
	}
	
}