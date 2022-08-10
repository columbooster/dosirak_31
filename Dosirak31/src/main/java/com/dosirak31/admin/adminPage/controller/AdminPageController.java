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
	/*������������ ȸ�������� �̵�*/
	@RequestMapping(value="/memberList",method=RequestMethod.GET)
	public String memberList(@ModelAttribute ClientVO cvo,Model model) {
		
		List<ClientVO> memberList=adminPageService.memberList(cvo);
		model.addAttribute("memberList",memberList);
		
		//��ü ���ڵ� �� ����
		int total=adminPageService.memberListCnt(cvo);
		//����¡ ó��
		model.addAttribute("pageMaker",new PageDTO(cvo,total));
		return "adminPage/admin/memberManagement";
	}
	
	/*�ֹ������ �̵�*/
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
