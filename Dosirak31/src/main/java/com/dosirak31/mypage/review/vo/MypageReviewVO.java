package com.dosirak31.mypage.review.vo;

import com.dosirak31.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MypageReviewVO extends CommonVO{
	
	private int client_no			=0;			// 회원 일련번호
	
	private String client_id		="";		// 회원 아이디
	//private String client_pw		="";		// 회원 비밀번호
	private String client_name		="";		// 회원 이름
	//private String client_email		="";		// 회원 이메일			
	/*private String client_phone		="";		// 회원 핸드폰번호
	private String client_address	="";		// 회원 주소
	private String client_date		="";		// 회원 등록일자 */
	
	
	private int review_no				=0;		// 리뷰 일련번호
	private String review_contents		="";	// 리뷰 내용
	private int review_score			=0;		// 리뷰 점수
	private String review_date			="";	// 리뷰 작성일자
	private int order_no				=0;		// 주문 일련번호
	private String review_name			="";	// 리뷰 작성자
	
	
	
}
