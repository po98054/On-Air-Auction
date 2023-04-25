package kr.kr.OnAirAuction.DAO;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.VO.MemberOKVO;

import kr.kr.OnAirAuction.VO.MemberVO;

public interface MemberDAO {
	
	// 회원 가입
	
	int insertMember(@Param("member")MemberVO member);
	
	// 이메일 인증
	
	void insertMemberOK(@Param("mok")MemberOKVO mok);
	
	MemberOKVO selectMemberOK(@Param("mok")MemberOKVO mok);
	
	void deleteMemberOK(@Param("mok")MemberOKVO mok);
	
	void updateCertification(@Param("me_id")String ce_me_id, @Param("me_certification")int me_certification);
	
	// 로그인

	MemberVO selectMemberById(@Param("me_id")String me_id);
	
	// 자동 로그인

	MemberVO selectMemberBySession(@Param("me_session_id")String me_session_id);

	void updateSession(@Param("member")MemberVO user);
	
}