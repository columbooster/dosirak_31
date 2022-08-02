package com.dosirak31.food.review.service;

import java.util.List;

import com.dosirak31.food.review.vo.FoodReviewVO;

public interface FoodReviewService {
	
	public List<FoodReviewVO> foodReviewList(Integer page_no);
	
	public int foodReviewInsert(FoodReviewVO rvo);
	
	public int foodReviewDelete(Integer review_no);
	
	public int foodReviewUpdate(FoodReviewVO rvo);
}
