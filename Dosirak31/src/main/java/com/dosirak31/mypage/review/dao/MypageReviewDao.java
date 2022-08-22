package com.dosirak31.mypage.review.dao;

import java.util.List;

import com.dosirak31.mypage.review.vo.MypageReviewVO;

public interface MypageReviewDao {
	
	public MypageReviewVO mypageList(MypageReviewVO mrvo);	// �쉶�썝�젙蹂� 紐⑸줉
	
	public List<MypageReviewVO> mypageReviewList(MypageReviewVO mrvo); 	// 由щ럭 紐⑸줉
	
	public int mypageReviewDelete(int review_no);			// 由щ럭 �궘�젣
	
	public MypageReviewVO mypageReviewDetail(MypageReviewVO mrvo);	// �긽�꽭 �럹�씠吏�
	
	public int mypageReviewUpdate(MypageReviewVO mrvo);		// 由щ럭 �닔�젙
	
	public int mypageReviewListCnt(MypageReviewVO mrvo);		// review �뀒�씠釉붿쓽 �쟾泥� �젅肄붾뱶 �닔
}
