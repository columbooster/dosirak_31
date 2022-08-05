package com.dosirak31.mypage.complex.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MypageComplexVO {
	
	private int client_no			=0;
	private String client_id		="";
	private String client_name		="";
}
