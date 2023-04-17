package kr.kr.OnAirAuction.Service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import kr.kr.OnAirAuction.DAO.MemberDAO;

import kr.kr.OnAirAuction.VO.MemberVO;

@Service
public class MemberServiceImp implements MemberService{
	
	@Autowired
	MemberDAO memberDao;
	
	// 로그인

	@Override
	public MemberVO login(MemberVO member) {
		
		System.out.println(member);
		
		if(member == null || member.getMe_id() == null || member.getMe_pw() == null) {
			
			return null;
			
		}
			
		return memberDao.selectMemberById(member.getMe_id());
			
	}

}