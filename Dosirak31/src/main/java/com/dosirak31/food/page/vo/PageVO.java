package com.dosirak31.food.page.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class PageVO {
	private int page_no			=0; 		// ������ ��ȣ
	private String page_title	="";		// ������ ����
}
