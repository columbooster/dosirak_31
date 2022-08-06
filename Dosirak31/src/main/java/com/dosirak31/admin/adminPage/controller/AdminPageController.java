package com.dosirak31.admin.adminPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/adminPage/admin/*")
@AllArgsConstructor
public class AdminPageController {
	/*관리자페이지 회원관리로 이동*/
	@RequestMapping(value="/memberManagement")
	public String memberList() {
		
		return "adminPage/admin/memberManagement";//foodList로 조회하면됨
	}
	
}
