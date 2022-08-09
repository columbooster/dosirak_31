package com.dosirak31.hcomment.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dosirak31.hcomment.admin.service.HCommentAdminService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/adminhreplies/*")
@Log4j
@AllArgsConstructor
public class HCommentAdminController {
	
	HCommentAdminService hcommentadminService;
	
	@RequestMapping("/hcommentManage")
	public String hcommentManage() {
		
		return  "hcomment/admin/hcommentManage";
	}

}
