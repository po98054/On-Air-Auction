package kr.kr.OnAirAuction.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.VO.ChargeVO;

public interface ChargeDAO {

	void chargeInsert(ChargeVO chargeVO);

	ArrayList<ChargeVO> selectPoint(@Param("charge")ChargeVO charge);

}
