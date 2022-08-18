package com.dosirak31.mypage.review.vo;

import com.dosirak31.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MypageReviewVO extends CommonVO{
	
	private int client_no			=0;			// �쉶�썝 �씪�젴踰덊샇
	
	private String client_id		="";		// �쉶�썝 �븘�씠�뵒
	private String client_pw		="";		// �쉶�썝 鍮꾨�踰덊샇
	private String client_name		="";		// �쉶�썝 �씠由�
	private String client_email		="";		// �쉶�썝 �씠硫붿씪			
	private String client_phone		="";		// �쉶�썝 �빖�뱶�룿踰덊샇
	private String client_address	="";		// �쉶�썝 二쇱냼
	private String client_rrn		="";		// �쉶�썝 二쇰�쇰쾲�샇
	private String client_date		="";		// �쉶�썝 �벑濡앹씪�옄
	private String client_update	="";		// �쉶�썝 �닔�젙�씪�옄
	
	
	private int review_no				=0;		// 由щ럭 �씪�젴踰덊샇
	private String review_contents		="";	// 由щ럭 �궡�슜
	private int review_score			=0;		// 由щ럭 �젏�닔
	private String review_date			="";	// 由щ럭 �옉�꽦�씪�옄
	private int order_no				=0;		// 二쇰Ц �씪�젴踰덊샇
	private String review_name			="";	// 由щ럭 �옉�꽦�옄
	
	private String dosirak_name			="";	// �룄�떆�씫 �씠由�
	private int dosirak_no				=0;		// �룄�떆�씫 踰덊샇
	
	private String food_img1;
	private String food_img2;
	private String food_img3;
	private String food_img4;
	private String food_img5;
	
	
}
