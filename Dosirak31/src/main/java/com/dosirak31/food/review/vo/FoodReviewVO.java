package com.dosirak31.food.review.vo;

import com.dosirak31.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class FoodReviewVO extends CommonVO {
	
	private int review_no				=0;		// 리뷰 일련번호
	private String review_contents		="";	// 리뷰 내용
	private int review_score			=0;		// 리뷰 점수
	private String review_date			="";	// 리뷰 작성일자
	private int client_no				=0;		// 회원 일련번호
	private int order_no				=0;		// 주문 일련번호
	private String review_name			="";	// 리뷰 작성자
	
}
