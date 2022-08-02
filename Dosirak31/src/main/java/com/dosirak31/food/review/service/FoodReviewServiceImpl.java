package com.dosirak31.food.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.food.review.dao.FoodReviewDao;
import com.dosirak31.food.review.vo.FoodReviewVO;

import lombok.Setter;

@Service
public class FoodReviewServiceImpl implements FoodReviewService {
	
	@Setter(onMethod_ = @Autowired)
	private FoodReviewDao foodReviewDao;
	
	// 리뷰 목록
	@Override
	public List<FoodReviewVO> foodReviewList(Integer page_no) {
		List<FoodReviewVO> list= null;
		list = foodReviewDao.foodReviewList(page_no);
		return list;
	}
	
	// 리뷰 입력
	@Override
	public int foodReviewInsert(FoodReviewVO rvo) {
		int result = 0;
		result = foodReviewDao.foodReviewInsert(rvo);
		return result;
	}
	
	// 리뷰 삭제
	@Override
	public int foodReviewDelete(Integer review_no) {
		int result = 0;
		result = foodReviewDao.foodReviewDelete(review_no);
		return result;
	}
	
	// 리뷰 수정
	@Override
	public int foodReviewUpdate(FoodReviewVO rvo) {
		int result = 0;
		result = foodReviewDao.foodReviewUpdate(rvo);
		return result;
	}
	


}
