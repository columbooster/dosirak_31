package com.dosirak31.admin.adminPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/adminPage/admin/*")
@AllArgsConstructor
public class AdminPageController {
	/*������������ ȸ�������� �̵�*/
	@RequestMapping(value="/memberManagement")
	public String memberList() {
		
		return "adminPage/admin/memberManagement";//foodList�� ��ȸ�ϸ��
	}
	
}
