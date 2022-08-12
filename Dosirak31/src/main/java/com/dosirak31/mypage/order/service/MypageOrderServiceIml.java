package com.dosirak31.mypage.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.common.file.FileUploadUtil;
import com.dosirak31.mypage.order.dao.MypageOrderDao;
import com.dosirak31.mypage.order.vo.MypageOrderVO;

import lombok.Setter;

@Service
public class MypageOrderServiceIml implements MypageOrderService {
	
	@Setter(onMethod_ = @Autowired)
	private MypageOrderDao mypageOrderDao;
	
	// 주문내역 조회
	@Override
	public List<MypageOrderVO> mypageOrderList(MypageOrderVO movo) {
		List<MypageOrderVO> list = null;
		list = mypageOrderDao.mypageOrderList(movo);
		return list;
	}
	
	// 주문내역 레코드 수 조회
	@Override
	public int mypageOrderListCnt(MypageOrderVO movo) {
		return mypageOrderDao.mypageOrderListCnt(movo);
	}

	@Override
	public int mypageOrderDelete(MypageOrderVO movo) throws Exception {
		int result = 0;
		if(!movo.getFile_name().isEmpty()) {
			FileUploadUtil.fileDelete(movo.getFile_name());
			FileUploadUtil.fileDelete(movo.getFile_thumb());
		}
		
		result = mypageOrderDao.mypageOrderDelete(movo.getOrder_no());
		return result;
	}

}
