package com.dosirak31.food.review.dao;

import java.util.List;

import com.dosirak31.food.review.vo.FoodReviewVO;

public interface FoodReviewDao {
	public List<FoodReviewVO> foodReviewList(Integer page_no);
	
	public int foodReviewInsert(FoodReviewVO rvo);
	
	public int foodReviewDelete(Integer review_no);
	
	public int foodReviewUpdate(FoodReviewVO rvo);
}
