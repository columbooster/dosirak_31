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
    * 筌띾뜆 뵠占쎈읂占쎌뵠筌욑옙 占쎌돳占쎌뜚占쎌젟癰귨옙 
    ********************************************************/
   @RequestMapping(value = "/mypageMain", method = RequestMethod.GET)
   public String mypageList(@ModelAttribute MypageReviewVO mrvo, Model model,HttpSession session) {
      log.info("mypageList 占쎌깈 빊占  占쎄쉐 ⑨옙");
      
      String client_id = (String) session.getAttribute("client_id"); //세션에서 client_id값을 가져옴(수정 불가능한 고정값)
      mrvo.setClient_id(client_id);
      
      
      MypageReviewVO mypageList = mypageReviewService.mypageList(mrvo);
      
      model.addAttribute("mypageList", mypageList);
      
      return "mypage/client/mypageMain";
   }
   
   /********************************************************
    * 筌띾뜆 뵠占쎈읂占쎌뵠筌욑옙  뵳 됰윮 占쎄맒占쎄쉭癰귣떯由 
    ********************************************************/
   @RequestMapping(value = "/mypageReviewList", method = RequestMethod.GET)
   public String mypageReviewList(@ModelAttribute MypageReviewVO mrvo, Model model, HttpSession session) {
      log.info("mypageReviewList 占쎌깈 빊占  占쎄쉐 ⑨옙");
      int client_no = (int) session.getAttribute("client_no");
      
      mrvo.setClient_no(client_no);
      List<MypageReviewVO> mypageReviewList = mypageReviewService.mypageReviewList(mrvo);
      
      model.addAttribute("mypageReviewList", mypageReviewList);
      
      //占쎌읈筌ｏ옙 占쎌쟿 굜遺얜굡占쎈땾  뤃 뗭겱
      int total = mypageReviewService.mypageReviewListCnt(mrvo);
      //占쎈읂占쎌뵠筌욑옙 筌ｌ꼶 봺
      model.addAttribute("pageMaker", new PageDTO(mrvo, total));
      
      return "mypage/client/mypageReviewList";
   }
   
   
   /********************************************************
    * 筌띾뜆 뵠占쎈읂占쎌뵠筌욑옙  뵳 됰윮 占쎄텣占쎌젫
    ********************************************************/
   @RequestMapping(value = "/mypageReviewDelete")
   public String mypageReviewDelete(@ModelAttribute MypageReviewVO mrvo, RedirectAttributes ras) {
      log.info("mypageReviewDelete 占쎌깈 빊占  占쎄쉐 ⑨옙");
      
      int result = 0;
      String url ="";
      
      result = mypageReviewService.mypageReviewDelete(mrvo);
      ras.addFlashAttribute("MypageReviewVO", mrvo);
      
      if(result ==1 ) {
         url ="mypage/client/mypageReviewList";
      } 
      return "redirect:"+url;
   }
   
   
   /********************************************************
    * 筌띾뜆 뵠占쎈읂占쎌뵠筌욑옙 占쎄맒占쎄쉭占쎈읂占쎌뵠筌욑옙
    ********************************************************/
   @GetMapping("/mypageReviewDetail")
   public String mypageReviewDetail(@ModelAttribute("data") MypageReviewVO mrvo, Model model) {
      log.info("mypageReviewDetail 占쎌깈 빊占  占쎄쉐 ⑨옙");
      
      MypageReviewVO detail = mypageReviewService.mypageReviewDetail(mrvo);
      model.addAttribute("detail", detail);
      
      return "mypage/client/mypageReviewDetail";
   }
   
   
   /********************************************************
    * 筌띾뜆 뵠占쎈읂占쎌뵠筌욑옙 占쎈씜占쎈쑓占쎌뵠占쎈뱜 占쎈쨲
    * @param : review_no
    * @return : MypageReviewVO
    ********************************************************/
   @RequestMapping(value= "/updateForm")
   public String updateForm(@ModelAttribute("data") MypageReviewVO mrvo, Model model) {
      log.info("updateForm 占쎌깈 빊占  占쎄쉐 ⑨옙");
      log.info("review_no = " + mrvo.getReview_no());
      MypageReviewVO updateData = mypageReviewService.updateForm(mrvo);
      
      model.addAttribute("updateData", updateData);
      return "mypage/client/updateForm";
   }
   
   /********************************************************
    * 筌띾뜆 뵠占쎈읂占쎌뵠筌욑옙 占쎈땾占쎌젟
    ********************************************************/
   @RequestMapping(value= "/mypageReviewUpdate", method=RequestMethod.POST)
   public String mypageReviewUpdate(@ModelAttribute MypageReviewVO mrvo, RedirectAttributes ras ) {
      log.info("mypageReviewUpdate 占쎌깈 빊占  占쎄쉐 ⑨옙");
      
      int result = 0;
      String url = "";
      
      result = mypageReviewService.mypageReviewUpdate(mrvo);
      ras.addFlashAttribute("data", mrvo);
      
      if(result == 1) {
         url ="mypageReviewDetail";
      } else {
         url ="mypage/client/updateForm";
      }
      
      return "redirect:"+url;
   }
}