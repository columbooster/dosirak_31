package com.dosirak31.mypage.client.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dosirak31.mypage.client.service.MypageClientService;
import com.dosirak31.mypage.client.vo.MypageClientVO;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@RequestMapping(value = "/mypage/client/*")
@Controller
public class MypageClientController {
	
	private MypageClientService mypageClientService;
	
	/********************************************************
	 * 留덉씠�럹�씠吏� �쉶�썝�젙蹂� 
	 ********************************************************/
	@RequestMapping(value ="/mypageClientList", method = RequestMethod.GET)
	public String mypageClientList(@ModelAttribute MypageClientVO mcvo, Model model) {
		log.info("mypageClientList �샇異� �꽦怨�");
		List<MypageClientVO> mypageClientList = mypageClientService.mypageClientList(mcvo);
		model.addAttribute("mypageClientList", mypageClientList);
		
		return "mypage/client/mypageClientList";
	}
	
	
	/********************************************************
	 * 留덉씠�럹�씠吏� �쉶�썝�젙蹂� �긽�꽭�럹�씠吏�
	 ********************************************************/
	@GetMapping("/mypageClientDetail")
	public String mypageClientDetail(@ModelAttribute("data") MypageClientVO mcvo, Model model) {
		log.info("mypageClientDetail �샇異� �꽦怨�");
		
		MypageClientVO detail = mypageClientService.mypageClientDetail(mcvo);
		model.addAttribute("detail", detail);
		
		return "mypage/client/mypageClientDetail";
	}
	
	/********************************************************
	 * 留덉씠�럹�씠吏� �쉶�썝�젙蹂� �궘�젣 (�깉�눜)
	 ********************************************************/
	@RequestMapping(value = "/mypageClientDelete")
	public String mypageClientDelete(@ModelAttribute MypageClientVO mcvo, RedirectAttributes ras) {
		log.info("mypageClientDelete �샇異� �꽦怨�");
		
		int result = 0;
		String url ="";
		
		result = mypageClientService.mypageClientDelete(mcvo);
		ras.addFlashAttribute("MypageClientVO", mcvo);
		
		if(result ==1 ) {
			url ="/mypage/client/mypageClientList";
		} 
		return "redirect:"+url;
	}
	
	/********************************************************
	 * 留덉씠�럹�씠吏� �쉶�썝�젙蹂� �닔�젙 �뤌
	 * @param : client_no
	 * @return : MypageClientVO
	 ********************************************************/
	@RequestMapping(value= "/cUpdateForm")
	public String cUpdateForm(@ModelAttribute("data") MypageClientVO mcvo, Model model) {
		log.info("cUpdateForm �샇異� �꽦怨�");
		log.info("client_no = " + mcvo.getClient_no());
		MypageClientVO updateData = mypageClientService.cUpdateForm(mcvo);
		
		model.addAttribute("updateData", updateData);
		return "mypage/client/cUpdateForm";
	}
	
	
	/********************************************************
	 * 留덉씠�럹�씠吏� �쉶�썝�젙蹂� �닔�젙
	 ********************************************************/	
	@RequestMapping(value= "/mypageClientUpdate", method=RequestMethod.POST)
	public String mypageClientUpdate(@ModelAttribute MypageClientVO mcvo, RedirectAttributes ras ) {
		log.info("mypageClientUpdate �샇異� �꽦怨�");
		
		int result = 0;
		String url = "";
		
		result = mypageClientService.mypageClientUpdate(mcvo);
		ras.addFlashAttribute("data", mcvo);
		
		if(result == 1) {
			url ="/mypage/client/mypageMain";
		} else {
			url ="/mypage/client/cUpdateForm";
		}
		
		return "redirect:"+url;
	}
}
