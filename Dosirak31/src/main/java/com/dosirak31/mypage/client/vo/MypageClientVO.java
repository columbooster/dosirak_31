package com.dosirak31.mypage.client.vo;

import lombok.Data;

@Data
public class MypageClientVO {
	
	private int client_no			=0;			// 회원 일련번호
	
	private String client_id		="";		// 회원 아이디
	private String client_pw		="";		// 회원 비밀번호
	private String client_name		="";		// 회원 이름
	private String client_email		="";		// 회원 이메일			
	private String client_phone		="";		// 회원 핸드폰번호
	private String client_address	="";		// 회원 주소
	private String client_rrn		="";		// 회원 주민번호
	private String client_date		="";		// 회원 등록일자
	private String client_update	="";		// 회원 수정일자
}
