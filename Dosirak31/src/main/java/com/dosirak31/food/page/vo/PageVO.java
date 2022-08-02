package com.dosirak31.food.page.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class PageVO {
	private int page_no			=0; 		// 페이지 번호
	private String page_title	="";		// 페이지 제목
}
