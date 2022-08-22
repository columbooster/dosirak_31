package com.dosirak31.mypage.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.mypage.review.dao.MypageReviewDao;
import com.dosirak31.mypage.review.vo.MypageReviewVO;

import lombok.Setter;

@Service
public class MypageReviewServiceImpl implements MypageReviewService {

	@Setter(onMethod_ = @Autowired)
	private MypageReviewDao mypageReviewDao;

	// 留덉씠�럹�씠吏� �쉶�썝�젙蹂� 援ы쁽
	@Override
	public MypageReviewVO mypageList(MypageReviewVO mrvo) {
		
		MypageReviewVO list = null;
		list = mypageReviewDao.mypageList(mrvo);
		
		return list;
	}
	
	// 留덉씠�럹�씠吏� 由щ럭 紐⑸줉 援ы쁽
	@Override
	public List<MypageReviewVO> mypageReviewList(MypageReviewVO mrvo) {
		List<MypageReviewVO> reviewlist = null;
		reviewlist = mypageReviewDao.mypageReviewList(mrvo);	
		return reviewlist;
	}

	// 留덉씠�럹�씠吏� 由щ럭 �궘�젣 
	@Override
	public int mypageReviewDelete(MypageReviewVO mrvo) {
		int result = 0;
		result = mypageReviewDao.mypageReviewDelete(mrvo.getReview_no());
		return result;
	}
	
	// 留덉씠�럹�씠吏� 由щ럭 �긽�꽭�럹�씠吏�
	@Override
	public MypageReviewVO mypageReviewDetail(MypageReviewVO mrvo) {
		MypageReviewVO detail = null;
		
		detail = mypageReviewDao.mypageReviewDetail(mrvo);
		if(detail != null) {
			detail.setReview_contents(detail.getReview_contents().toString().replaceAll("\n", "<br />"));
		}
		
		return detail;
	}
	
	// 留덉씠�럹�씠吏� �뾽�뜲�씠�듃 �뤌
	@Override
	public MypageReviewVO updateForm(MypageReviewVO mrvo) {
		MypageReviewVO detail = null;
		detail = mypageReviewDao.mypageReviewDetail(mrvo);
		return detail;
	}
	
	// 留덉씠�럹�씠吏� 由щ럭 �닔�젙
	@Override
	public int mypageReviewUpdate(MypageReviewVO mrvo) {
		int result = 0;
		result = mypageReviewDao.mypageReviewUpdate(mrvo);
		return result;
	}

	// �쟾泥� �젅肄붾뱶�닔 援ы쁽
	@Override
	public int mypageReviewListCnt(MypageReviewVO mrvo) {
		return mypageReviewDao.mypageReviewListCnt(mrvo);
	}

	
	
	

}
