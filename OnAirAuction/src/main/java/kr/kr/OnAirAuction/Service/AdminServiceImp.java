package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import kr.kr.OnAirAuction.VO.MemberVO;

import kr.kr.OnAirAuction.VO.ReportCategoryVO;

import kr.kr.OnAirAuction.VO.InquiryCategoryVO;

import kr.kr.OnAirAuction.VO.AuctionCategoryVO;

import kr.kr.OnAirAuction.VO.MembershipLevelVO;

import kr.kr.OnAirAuction.VO.RatingStandardVO;

import kr.kr.OnAirAuction.DAO.AdminDAO;

@Service
public class AdminServiceImp implements AdminService{
	
	@Autowired
	AdminDAO adminDao;

	@Override
	public ArrayList<ReportCategoryVO> getReportCategory(MemberVO user) {
		
		if(user == null) {
			
			return null;
			
		}
		
		if(!user.getMe_id().equals("admin")) {
			
			return null;
			
		}
		
		return adminDao.selectReportCategory();
		
	}

	@Override
	public boolean insertReportCategory(ReportCategoryVO rc, MemberVO user) {
		
		if(user == null) {
			
			return false;
			
		}
		
		if(user != null && !user.getMe_id().equals("admin")) {
			
			return false;
			
		}
		
		adminDao.insertReportCategory(rc);
		
		return true;
	}

	@Override
	public boolean updateReportCategory(ReportCategoryVO rc, MemberVO user) {
		
		System.out.println(rc);
		
		if(user == null) {
			
			return false;
			
		}
		
		if(user != null && !user.getMe_id().equals("admin")) {
			
			return false;
			
		}
		
		if(adminDao.updateReportCategory(rc) == 0) {
			
			return false;
			
		}
			
		return true;
		
	}

	@Override
	public boolean deleteReportCategory(int rc_num) {
		
		if(rc_num <= 0) {
			
			return false;
			
		}
			
		return adminDao.deleteReportCategory(rc_num);
		
	}
	
	@Override
	public ArrayList<InquiryCategoryVO> getInquiryCategor(MemberVO user) {
		
		if(user == null) {
			
			return null;
			
		}
		
		if(!user.getMe_id().equals("admin")) {
			
			return null;
			
		}
		
		return adminDao.selectInquiryCategory();
		
	}

	@Override
	public boolean insertInquiryCategory(InquiryCategoryVO ic, MemberVO user) {
		
		if(user == null) {
			
			return false;
			
		}
		
		if(user != null && !user.getMe_id().equals("admin")) {
			
			return false;
			
		}
		
		adminDao.insertInquiryCategory(ic);
		
		return true;
	}

	@Override
	public boolean updateInquiryCategory(InquiryCategoryVO ic, MemberVO user) {
		
		System.out.println(ic);
		
		if(user == null) {
			
			return false;
			
		}
		
		if(user != null && !user.getMe_id().equals("admin")) {
			
			return false;
			
		}
		
		if(adminDao.updateInquiryCategory(ic) == 0) {
			
			return false;
			
		}
			
		return true;
		
	}

	@Override
	public boolean deleteInquiryCategory(int ic_num) {
		
		if(ic_num <= 0) {
			
			return false;
			
		}
			
		return adminDao.deleteInquiryCategory(ic_num);
		
	}
	
	@Override
	public ArrayList<AuctionCategoryVO> getAuctionCategory(MemberVO user) {
		
		if(user == null) {
			
			return null;
			
		}
		
		if(!user.getMe_id().equals("admin")) {
			
			return null;
			
		}
		
		return adminDao.selectAuctionCategory();
		
	}

	@Override
	public boolean insertAuctionCategory(AuctionCategoryVO ac, MemberVO user) {
		
		if(user == null) {
			
			return false;
			
		}
		
		if(user != null && !user.getMe_id().equals("admin")) {
			
			return false;
			
		}
		
		adminDao.insertAuctionCategory(ac);
		
		return true;
	}

	@Override
	public boolean updateAuctionCategory(AuctionCategoryVO ac, MemberVO user) {
		
		System.out.println(ac);
		
		if(user == null) {
			
			return false;
			
		}
		
		if(user != null && !user.getMe_id().equals("admin")) {
			
			return false;
			
		}
		
		if(adminDao.updateAuctionCategory(ac) == 0) {
			
			return false;
			
		}
			
		return true;
		
	}

	@Override
	public boolean deleteAuctionCategory(int ac_num) {
		
		if(ac_num <= 0) {
			
			return false;
			
		}
			
		return adminDao.deleteAuctionCategory(ac_num);
		
	}
	
	@Override
	public ArrayList<MembershipLevelVO> getMembership(MemberVO user) {
		
		if(user == null) {
			
			return null;
			
		}
		
		if(!user.getMe_id().equals("admin")) {
			
			return null;
			
		}
		
		return adminDao.selectMembership();
		
	}

	@Override
	public boolean insertMembership(MembershipLevelVO ms, MemberVO user) {
		
		if(user == null) {
			
			return false;
			
		}
		
		if(user != null && !user.getMe_id().equals("admin")) {
			
			return false;
			
		}
		
		adminDao.insertMembership(ms);
		
		return true;
	}

	@Override
	public boolean updateMembership(MembershipLevelVO ms, MemberVO user) {
		
		System.out.println(ms);
		
		if(user == null) {
			
			return false;
			
		}
		
		if(user != null && !user.getMe_id().equals("admin")) {
			
			return false;
			
		}
		
		if(adminDao.updateMembership(ms) == 0) {
			
			return false;
			
		}
			
		return true;
		
	}

	@Override
	public boolean deleteMembership(String ml_name) {
		
		if(ml_name == null|| ml_name.trim().length() == 0) {
			
			return false;
			
		}
			
		return adminDao.deleteMembership(ml_name);
		
	}
	
	@Override
	public ArrayList<RatingStandardVO> getRatingStandard(MemberVO user) {
		
		if(user == null) {
			
			return null;
			
		}
		
		if(!user.getMe_id().equals("admin")) {
			
			return null;
			
		}
		
		return adminDao.selectRatingStandard();
		
	}

	@Override
	public boolean insertRatingStandard(RatingStandardVO rs, MemberVO user) {
		
		if(user == null) {
			
			return false;
			
		}
		
		if(user != null && !user.getMe_id().equals("admin")) {
			
			return false;
			
		}
		
		adminDao.insertRatingStandard(rs);
		
		return true;
	}

	@Override
	public boolean updateRatingStandard(RatingStandardVO rs, MemberVO user) {
		
		System.out.println(rs);
		
		if(user == null) {
			
			return false;
			
		}
		
		if(user != null && !user.getMe_id().equals("admin")) {
			
			return false;
			
		}
		
		if(adminDao.updateRatingStandard(rs) == 0) {
			
			return false;
			
		}
			
		return true;
		
	}

	@Override
	public boolean deleteRatingStandard(String rs_ml_name) {
		
		if(rs_ml_name == null|| rs_ml_name.trim().length() == 0) {
			
			return false;
			
		}
			
		return adminDao.deleteRatingStandard(rs_ml_name);
		
	}
	
}
