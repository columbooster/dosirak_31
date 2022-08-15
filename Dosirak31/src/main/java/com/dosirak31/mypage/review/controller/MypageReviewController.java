package com.dosirak31.mypage.review.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dosirak31.common.vo.PageDTO;
import com.dosirak31.mypage.review.service.MypageReviewService;
import com.dosirak31.mypage.review.vo.MypageReviewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@RequestMapping(value="/mypage/client/*")
@Controller
public class MypageReviewController {
	
	private MypageReviewService mypageReviewService;
	
	/********************************************************
	 * 留덉씠�럹�씠吏� �쉶�썝�젙蹂� 
	 ********************************************************/
	@RequestMapping(value = "/mypageMain", method = RequestMethod.GET)
	public String mypageList(@ModelAttribute MypageReviewVO mrvo, Model model) {
		log.info("mypageList �샇異� �꽦怨�");
		List<MypageReviewVO> mypageList = mypageReviewService.mypageList(mrvo);
		model.addAttribute("mypageList", mypageList);
		
		return "mypage/client/mypageMain";
	}
	
	/********************************************************
	 * 留덉씠�럹�씠吏� 由щ럭 �긽�꽭蹂닿린
	 ********************************************************/
	@RequestMapping(value = "/mypageReviewList", method = RequestMethod.GET)
	public String mypageReviewList(@ModelAttribute MypageReviewVO mrvo, Model model, HttpSession session) {
		log.info("mypageReviewList �샇異� �꽦怨�");
		int client_no = (int) session.getAttribute("client_no");
		
		mrvo.setClient_no(client_no);
		List<MypageReviewVO> mypageReviewList = mypageReviewService.mypageReviewList(mrvo);
		
		model.addAttribute("mypageReviewList", mypageReviewList);
		
		//�쟾泥� �젅肄붾뱶�닔 援ы쁽
		int total = mypageReviewService.mypageReviewListCnt(mrvo);
		//�럹�씠吏� 泥섎━
		model.addAttribute("pageMaker", new PageDTO(mrvo, total));
		
		return "mypage/client/mypageReviewList";
	}
	
	
	/********************************************************
	 * 留덉씠�럹�씠吏� 由щ럭 �궘�젣
	 ********************************************************/
	@RequestMapping(value = "/mypageReviewDelete")
	public String mypageReviewDelete(@ModelAttribute MypageReviewVO mrvo, RedirectAttributes ras) {
		log.info("mypageReviewDelete �샇異� �꽦怨�");
		
		int result = 0;
		String url ="";
		
		result = mypageReviewService.mypageReviewDelete(mrvo);
		ras.addFlashAttribute("MypageReviewVO", mrvo);
		
		if(result ==1 ) {
			url ="/mypage/client/mypageReviewList";
		} 
		return "redirect:"+url;
	}
	
	
	/********************************************************
	 * 留덉씠�럹�씠吏� �긽�꽭�럹�씠吏�
	 ********************************************************/
	@GetMapping("/mypageReviewDetail")
	public String mypageReviewDetail(@ModelAttribute("data") MypageReviewVO mrvo, Model model) {
		log.info("mypageReviewDetail �샇異� �꽦怨�");
		
		MypageReviewVO detail = mypageReviewService.mypageReviewDetail(mrvo);
		model.addAttribute("detail", detail);
		
		return "mypage/client/mypageReviewDetail";
	}
	
	
	/********************************************************
	 * 留덉씠�럹�씠吏� �뾽�뜲�씠�듃 �뤌
	 * @param : review_no
	 * @return : MypageReviewVO
	 ********************************************************/
	@RequestMapping(value= "/updateForm")
	public String updateForm(@ModelAttribute("data") MypageReviewVO mrvo, Model model) {
		log.info("updateForm �샇異� �꽦怨�");
		log.info("review_no = " + mrvo.getReview_no());
		MypageReviewVO updateData = mypageReviewService.updateForm(mrvo);
		
		model.addAttribute("updateData", updateData);
		return "/mypage/client/updateForm";
	}
	
	/********************************************************
	 * 留덉씠�럹�씠吏� �닔�젙
	 ********************************************************/
	@RequestMapping(value= "/mypageReviewUpdate", method=RequestMethod.POST)
	public String mypageReviewUpdate(@ModelAttribute MypageReviewVO mrvo, RedirectAttributes ras ) {
		log.info("mypageReviewUpdate �샇異� �꽦怨�");
		
		int result = 0;
		String url = "";
		
		result = mypageReviewService.mypageReviewUpdate(mrvo);
		ras.addFlashAttribute("data", mrvo);
		
		if(result == 1) {
			url ="/mypage/client/mypageReviewDetail";
		} else {
			url ="/mypage/client/updateForm";
		}
		
		return "redirect:"+url;
	}
}
