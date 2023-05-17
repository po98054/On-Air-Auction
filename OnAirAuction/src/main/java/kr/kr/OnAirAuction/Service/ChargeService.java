package kr.kr.OnAirAuction.Service;

import kr.kr.OnAirAuction.VO.ChargeVO;

public interface ChargeService {

	void insertCharge(ChargeVO chargeVO);

	ArrayList<ChargeVO> getPoint(ChargeVO charge);

}
