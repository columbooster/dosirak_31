package com.dosirak31.food.review.dao;

import java.util.List;

import com.dosirak31.food.review.vo.FoodReviewVO;

public interface FoodReviewDao {
	public List<FoodReviewVO> foodReviewList(FoodReviewVO rvo); //주문일련번호 가지고 있는 고객 조회
		
	public int foodReviewInsert(FoodReviewVO rvo);			//등록
	
	public FoodReviewVO foodReviewDetail(FoodReviewVO rvo);	// 상세 페이지
	
	public int foodReviewUpdate(FoodReviewVO rvo);		//수정일자
	
	public int foodReviewDelete(int review_no);			//삭제
	
	public int foodReviewListCnt(FoodReviewVO rvo);		// review 테이블의 전체 레코드 수
	
}
