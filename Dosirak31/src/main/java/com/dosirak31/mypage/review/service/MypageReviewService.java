package com.dosirak31.mypage.review.service;

import java.util.List;

import com.dosirak31.mypage.review.vo.MypageReviewVO;


public interface MypageReviewService {
	
	public List<MypageReviewVO> mypageList(MypageReviewVO mrvo);	// 회원정보 목록
	
	public List<MypageReviewVO> mypageReviewList(MypageReviewVO mrvo); 	// 리뷰 목록
	
	public int mypageReviewDelete(MypageReviewVO review_no);			//삭제
	
	public MypageReviewVO mypageReviewDetail(MypageReviewVO mrvo);	// 상세 페이지
	
	public int mypageReviewUpdate(MypageReviewVO mrvo);		//수정
	
	public MypageReviewVO updateForm(MypageReviewVO mrvo);  //업데이트 폼
	
	public int mypageReviewListCnt(MypageReviewVO mrvo);		// review 테이블의 전체 레코드 수
	
	
}
