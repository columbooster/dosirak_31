package com.dosirak31.food.review.vo;

import lombok.Data;

@Data
public class FoodReviewVO {
	
	private int review_no				=0;		//리뷰 일련번호
	private String review_contents		="";	//리뷰 내용
	private int	review_score			=0;		//리뷰 점수
	private String review_date			="";	//리뷰 작성일시
	private int client_no				=0;		//회원일련번호
	private int order_no				=0;		//주문일련번호
	private String review_name			="";	//리뷰 작성자
	private int page_no					=0;		//페이지 번호
	
}
