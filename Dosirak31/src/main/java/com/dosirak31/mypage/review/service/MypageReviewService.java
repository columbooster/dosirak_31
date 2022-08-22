package com.dosirak31.mypage.review.service;

import java.util.List;

import com.dosirak31.mypage.review.vo.MypageReviewVO;


public interface MypageReviewService {
	
	public MypageReviewVO mypageList(MypageReviewVO mrvo);	// �쉶�썝�젙蹂� 紐⑸줉
	
	public List<MypageReviewVO> mypageReviewList(MypageReviewVO mrvo); 	// 由щ럭 紐⑸줉
	
	public int mypageReviewDelete(MypageReviewVO review_no);			//�궘�젣
	
	public MypageReviewVO mypageReviewDetail(MypageReviewVO mrvo);	// �긽�꽭 �럹�씠吏�
	
	public int mypageReviewUpdate(MypageReviewVO mrvo);		//�닔�젙
	
	public MypageReviewVO updateForm(MypageReviewVO mrvo);  //�뾽�뜲�씠�듃 �뤌
	
	public int mypageReviewListCnt(MypageReviewVO mrvo);		// review �뀒�씠釉붿쓽 �쟾泥� �젅肄붾뱶 �닔
	
	
}
