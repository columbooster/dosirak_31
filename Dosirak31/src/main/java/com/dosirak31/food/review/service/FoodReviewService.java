package com.dosirak31.food.review.service;

import java.util.List;

import com.dosirak31.food.review.vo.FoodReviewVO;

public interface FoodReviewService {
	
	public List<FoodReviewVO> foodReviewList(FoodReviewVO rvo); //주문일련번호 가지고 있는 고객 조회
	
	public int foodReviewInsert(FoodReviewVO rvo);			//등록
	
	public int foodReviewUpdate(FoodReviewVO rvo);		//수정일자
	
	public int foodReviewDelete(FoodReviewVO rvo);			//삭제
	
	public FoodReviewVO updateForm(FoodReviewVO rvo);	// 업데이트 폼
	
	public FoodReviewVO foodReviewDetail (FoodReviewVO rvo);  //상세페이지
}
