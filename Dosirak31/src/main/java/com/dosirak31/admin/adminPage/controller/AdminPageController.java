package com.dosirak31.admin.adminPage.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dosirak31.admin.adminPage.service.AdminPageService;
import com.dosirak31.admin.adminPage.vo.MemberGraphDTO;
import com.dosirak31.common.vo.PageDTO;
import com.dosirak31.food.order.vo.ClientVO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/adminPage/*")
@AllArgsConstructor
public class AdminPageController {
	
	private AdminPageService adminPageService;
	/*관리자페이지 회원관리로 이동*/
	@RequestMapping(value="/memberList",method=RequestMethod.GET)
	public String memberList(@ModelAttribute ClientVO cvo,Model model) {
		
		List<ClientVO> memberList=adminPageService.memberList(cvo);
		model.addAttribute("memberList",memberList);
		
		//전체 레코드 수 구현
		int total=adminPageService.memberListCnt(cvo);
		//페이징 처리
		model.addAttribute("pageMaker",new PageDTO(cvo,total));
		return "adminPage/admin/memberManagement";
	}
	
	/*주문매출로 이동*/
	@RequestMapping(value="/memberGraph",method=RequestMethod.GET)
	public String memberGraph(Model model){
		
		  MemberGraphDTO ageGraph= adminPageService.ageGraph();
		  model.addAttribute("ageGraph",ageGraph); 
		  MemberGraphDTO genderGraph=adminPageService.genderGraph();
		  model.addAttribute("genderGraph",genderGraph); 
		  MemberGraphDTO countMember=adminPageService.countMember();
		  model.addAttribute("countMember",countMember);
		 
		return "adminPage/admin/memberGraph";  
	}
	
	
}
