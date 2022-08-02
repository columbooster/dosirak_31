package com.dosirak31.food.review.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dosirak31.food.review.service.FoodReviewService;
import com.dosirak31.food.review.vo.FoodReviewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping(value="/reviews")
@AllArgsConstructor
public class FoodReviewController {
	
	private FoodReviewService foodReviewService;
	
	/*************************************************************
	 * ���� ��� ����
	 *************************************************************/
	@GetMapping(value = "/all/{page_no}", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<FoodReviewVO> foodReviewList(@PathVariable("page_no") Integer page_no) {
		log.info("list ȣ�� ����");
		
		List<FoodReviewVO> entity = null;
		entity = foodReviewService.foodReviewList(page_no);
		return entity;
	}
	
	
	/*************************************************************
	 * ���� �۾��� ����
	 *************************************************************/
	@PostMapping(value = "/foodReviewInsert", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String foodReviewInsert(@RequestBody FoodReviewVO rvo) {
		log.info("foodReviewInsert ȣ�� ����");
		
		int result = 0;
		result = foodReviewService.foodReviewInsert(rvo);
		return (result==1) ? "SUCCESS" : "FAILURE";
	}
	
	
	/*************************************************************
	 * ���� ���� ����
	 *************************************************************/
	@DeleteMapping(value = "/{review_no}", produces = MediaType.TEXT_PLAIN_VALUE) 
	public String foodReviewDelete(@PathVariable("review_no") int review_no) {
		log.info("foodReviewDelete ȣ�� ����");
		
		int result = foodReviewService.foodReviewDelete(review_no);
		return (result ==1) ? "SUCCESS" : "FAILURE";
	}
	
	
	/*************************************************************
	 * ���� ���� ����
	 *************************************************************/
	@PutMapping(value= "/{review_no}", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String foodReviewUpdate(@PathVariable("review_no") Integer review_no, @RequestBody FoodReviewVO rvo) {
		log.info("foodReviewUpdate ȣ�� ����");
		
		rvo.setReview_no(review_no);
		int result = foodReviewService.foodReviewUpdate(rvo);
		return (result==1) ? "SUCCESS" : "FAILURE";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
