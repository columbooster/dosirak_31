package com.dosirak31.mypage.order.dao;

import java.util.List;

import com.dosirak31.mypage.order.vo.MypageOrderVO;

public interface MypageOrderDao {
	public List<MypageOrderVO> mypageOrderList(MypageOrderVO movo);
	
	public int mypageOrderDelete(int order_no);
	
	public int mypageOrderListCnt(MypageOrderVO movo);
}
