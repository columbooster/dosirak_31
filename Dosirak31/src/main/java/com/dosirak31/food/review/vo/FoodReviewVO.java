package com.dosirak31.food.review.vo;

import com.dosirak31.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class FoodReviewVO extends CommonVO {
	
	private int review_no				=0;		// 由щ럭 �씪�젴踰덊샇
	private String review_contents		="";	// 由щ럭 �궡�슜
	private int review_score			=0;		// 由щ럭 �젏�닔
	private String review_date			="";	// 由щ럭 �옉�꽦�씪�옄
	private int client_no				=0;		// �쉶�썝 �씪�젴踰덊샇
	private int order_no				=0;		// 二쇰Ц �씪�젴踰덊샇
	private String review_name			="";	// 由щ럭 �옉�꽦�옄
	private String dosirak_name			="";
	private int dosirak_no				=0;
	private String food_img1;
	private String food_img2;
	private String food_img3;
	private String food_img4;
	private String food_img5;
	
	
	
}
