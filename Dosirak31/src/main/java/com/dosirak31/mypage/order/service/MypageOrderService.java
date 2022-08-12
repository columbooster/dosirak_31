package com.dosirak31.mypage.order.service;

import java.util.List;

import com.dosirak31.mypage.order.vo.MypageOrderVO;

public interface MypageOrderService {
	
	public List<MypageOrderVO> mypageOrderList(MypageOrderVO movo);
	
	public int mypageOrderDelete(MypageOrderVO movo) throws Exception;
	
	public int mypageOrderListCnt(MypageOrderVO movo);
}
