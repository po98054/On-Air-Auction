package kr.kr.OnAirAuction.DAO;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.VO.MemberVO;

public interface MemberDAO {
	
	// 로그인

	MemberVO selectMemberById(@Param("me_id")String me_id);

}
