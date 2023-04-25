package kr.kr.OnAirAuction.Service;

import kr.kr.OnAirAuction.VO.MemberOKVO;

import kr.kr.OnAirAuction.VO.MemberVO;

public interface MemberService {
	
	// 회원가입
	
	boolean signUp(MemberVO member);
	
	// 아이디 중복 체크
	
	boolean checkId(MemberVO member);
	
	// 이메일 인증
	
	void emailAuthentication(String me_id, String me_email);
	
	boolean emailAuthenticationConfirm(MemberOKVO mok);
	
	// 로그인

	MemberVO login(MemberVO member);
	
	// 자동 로그인

	MemberVO getMemberBySession(String me_session_id);

	void updateMemberBySession(MemberVO user);

}
