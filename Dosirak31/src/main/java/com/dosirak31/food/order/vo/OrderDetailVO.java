package com.dosirak31.food.order.vo;

import com.dosirak31.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailVO extends CommonVO {	//주문상세테이블

	//회원정보
	private int client_no; //회원일련번호
	private String client_id; //회원아이디
	private String client_pw; //회원비밀번호
	private String client_name; //회원이름
	private String client_email; //회원이메일
	private String client_phone; //회원전화번호
	private String client_address; //회원주소
	private String client_date; //회원가입일
	private String client_update; //회원정보수정일
	
	
	//도시락정보
	private int dosirak_no; 	//도시락번호
	private String dosirak_name;	//도시락명
	private String food_img1;	//식품명1
	private String food_img2;	//식품명2
	private String food_img3;	//식품명3
	private String food_img4;	//식품명4
	private String food_img5;	//식품명5
	
	//주문정보
	private int order_no;//주문 번호(주문테이블에서 같은 회원이 상태번호가 1,2일 경우 주문번호가 있는지 확인하고 없으면 주문테이블먼저넣고 주문상세)
	private String order_date;	//상태번호 2일때 들어갈 값
	private String order_client_name;
	private String order_client_phone;
	private String order_address;//상태번호 2일때 들어갈 값
	//회원 번호(session으로 받아옴)
	private int order_status_no;//주문상태번호 1.장바구니 2.주문 전 3.주문 후 4.주문 취소
	
	
		//주문번호(주문테이블에서 같은 회원이 상태번호가 1,2일 경우 주문번호가 있는지 확인하고 없으면 주문테이블먼저넣고 주문상세)
	private int order_quantity;	//주문수량
	private int order_price;	//주문가격
	//도시락번호(도시락 생성 후 넣기)
	
	//결제정보
	private int payment_no;

	private String payment_method;
	private int payment_delete;
	private String payment_date;
	
}
