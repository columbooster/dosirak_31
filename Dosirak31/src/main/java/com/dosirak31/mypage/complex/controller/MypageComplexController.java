package com.dosirak31.mypage.complex.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dosirak31.mypage.complex.service.MypageComplexService;
import com.dosirak31.mypage.complex.vo.MypageComplexVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@RequestMapping(value="/mypage/client/*")
@Controller
public class MypageComplexController {
	
	private MypageComplexService mypageComplexService;
	
	/********************************************************
	 * 마이페이지 목록
	 ********************************************************/
	@RequestMapping(value = "/mypageMain", method = RequestMethod.GET)
	public String mypageList(@ModelAttribute MypageComplexVO mcvo, Model model) {
		log.info("mypageList 호출 성공");
		List<MypageComplexVO> mypageList = mypageComplexService.mypageList(mcvo);
		model.addAttribute("mypageList", mypageList);
		
		return "mypage/client/mypageMain";
	}
}
