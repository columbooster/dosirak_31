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
	 * 마이페이지 회원정보 
	 ********************************************************/
	@RequestMapping(value = "/mypageMain", method = RequestMethod.GET)
	public String mypageList(@ModelAttribute MypageReviewVO mrvo, Model model) {
		log.info("mypageList 호출 성공");
		List<MypageReviewVO> mypageList = mypageReviewService.mypageList(mrvo);
		model.addAttribute("mypageList", mypageList);
		
		return "mypage/client/mypageMain";
	}
	
	/********************************************************
	 * 마이페이지 리뷰 리스트
	 ********************************************************/
	@RequestMapping(value = "/mypageReviewList", method = RequestMethod.GET)
	public String mypageReviewList(@ModelAttribute MypageReviewVO mrvo, Model model, HttpSession session) {
		log.info("mypageReviewList 호출 성공");
		int client_no = (int) session.getAttribute("client_no");
		
		mrvo.setClient_no(client_no);
		List<MypageReviewVO> mypageReviewList = mypageReviewService.mypageReviewList(mrvo);
		
		model.addAttribute("mypageReviewList", mypageReviewList);
		
		//전체 레코드수 구현
		int total = mypageReviewService.mypageReviewListCnt(mrvo);
		//페이징 처리
		model.addAttribute("pageMaker", new PageDTO(mrvo, total));
		
		return "mypage/client/mypageReviewList";
	}
	
	
	/********************************************************
	 * 마이페이지 리뷰 삭제
	 ********************************************************/
	@RequestMapping(value = "/mypageReviewDelete")
	public String mypageReviewDelete(@ModelAttribute MypageReviewVO mrvo, RedirectAttributes ras) {
		log.info("mypageReviewDelete 호출 성공");
		
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
	 * 마이페이지 상세페이지
	 ********************************************************/
	@GetMapping("/mypageReviewDetail")
	public String mypageReviewDetail(@ModelAttribute("data") MypageReviewVO mrvo, Model model) {
		log.info("mypageReviewDetail 호출 성공");
		
		MypageReviewVO detail = mypageReviewService.mypageReviewDetail(mrvo);
		model.addAttribute("detail", detail);
		
		return "mypage/client/mypageReviewDetail";
	}
	
	
	/********************************************************
	 * 마이페이지 업데이트 폼
	 * @param : review_no
	 * @return : MypageReviewVO
	 ********************************************************/
	@RequestMapping(value= "/updateForm")
	public String updateForm(@ModelAttribute("data") MypageReviewVO mrvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("review_no = " + mrvo.getReview_no());
		MypageReviewVO updateData = mypageReviewService.updateForm(mrvo);
		
		model.addAttribute("updateData", updateData);
		return "/mypage/client/updateForm";
	}
	
	/********************************************************
	 * 마이페이지 수정
	 ********************************************************/
	@RequestMapping(value= "/mypageReviewUpdate", method=RequestMethod.POST)
	public String mypageReviewUpdate(@ModelAttribute MypageReviewVO mrvo, RedirectAttributes ras ) {
		log.info("mypageReviewUpdate 호출 성공");
		
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
