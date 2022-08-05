package com.dosirak31.login.client.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dosirak31.login.client.service.ClientLoginService;
import com.dosirak31.login.client.vo.ClientLoginVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@SessionAttributes("client_info")
@Controller
@AllArgsConstructor
@RequestMapping("/client/*")
@Log4j
public class ClientLoginController {
	
	
private ClientLoginService clientLoginService;
	
	@GetMapping("/loginmain")
	public String loginForm() {
		
		log.info("client 로그인 화면 호출");
		
		return "login/client/loginmain";
		//     /WEB-INF/views/login/client/loginmain.jsp로 포워드(관리자 시작페이지로 구분)
		
		//redirect:는 맵핑을 요청하는것임 -> 컨트롤러에 다시 메서드 작성해야됨
		
	} 
	
	@RequestMapping("/searchid")
	public String serarchId() {
		return "login/client/searchid"; //     /WEB-INF/views/login/client/searchid.jsp로 이동 , 아이디 찾기 화면
	}
	
	@RequestMapping("/searchpw")
	public String searchPw() { 
		return "login/client/searchpw"; //     /WEB-INF/views/login/client/searchpw.jsp로 이동 , 비밀번호 찾기 화면
	}
	
	
	@RequestMapping("successlogin")
	public String successLogin() {
		
		return "login";
	}
	
	@RequestMapping("faillogin")
	public String failIdLogin() {
		
		return "login/client/faillogin";
	}
	

	

	@PostMapping("/userlogin")
	public String loginProcess(ClientLoginVO login, Model model, HttpServletRequest request,RedirectAttributes ras) {
		//로그인 버튼을 클릭하여 로그인폼이 온 상태
		//여기서 로그인 과정을 처리
		
		String url="";
		
		ClientLoginVO clientLogin = clientLoginService.loginProcess(login);
		
		if(clientLogin != null) { 
			
			model.addAttribute("client_info",clientLogin);
			
			HttpSession session = request.getSession();

			session.setAttribute("client_info", clientLogin); 
			
			url="successlogin"; //성공시 로그인 성공페이지로 이동 
					
		}else {
			
			ras.addFlashAttribute("errorMsg","로그인 실패");
			
			//return "/client/loginmain";
			
			url="faillogin";
		}
		
			return "redirect:"+url;
	}
	
	
	
	@RequestMapping("/idconfirm")
	public String idConfirm(ClientLoginVO login, Model model) {
		//아이디를 찾기 창에서 아이디, 전화번호가 온 상태
		//여기서 아이디찾기 과정을 처리
		
		ClientLoginVO clientsearchid = clientLoginService.idConfirm(login); //아이디, 전화번호가 일치하는 고객의 객체를 전달받음
		
		if(clientsearchid != null) {
			
			model.addAttribute("clientsearchid",clientsearchid);
			
			return "login/client/successidconfirm"; //     /WEB-INF/views/login/client/succecssidconfirm.jsp로 이동
			
		}else {
			
			return "login/client/failidconfirm"; //  /WEB-INF/views/login/client/failidconfirm.jsp로 이동
			
		}
		
	}
	
	@RequestMapping(value = "/kakaologin", method = RequestMethod.POST)
	public String kakaoLogin(Model model, HttpServletRequest request){
		String kakaoemail=request.getParameter("kakaoemail"); //카카오 이메일 값을 받아와서 저장
		String kakaoname=request.getParameter("kakaoname"); //카카오 닉네임 값을 받아와서 저장
		
		
		ClientLoginVO cvo = new ClientLoginVO(); //카카오 기본 정보를 VO객체에 담아줌
		cvo.setClient_email(kakaoemail); //카카오 이메일을 client_eamil 변수에 저장
		cvo.setClient_name(kakaoname);//카카오 닉네임을 client_name 변수에 저장
		
	
		if (clientLoginService.getUserByEmail(cvo) == null) { //카카오 이메일로 로그인 한 적이 있는지 확인
													//카카오 로그인 한 적이 없다면, 
			model.addAttribute("kakaoclient", cvo); //카카오 기본정보(이름, 이메일)이 담긴 객체를 카카오 회원가입 페이지로 넘겨준다.
			
			return "/signup/client/kakao_join_form"; //카카오 회원가입 페이지로 맵핑
			
		}else {
			
			String url = "";
			
			//카카오 계정으로 로그인한 적이 있을 때 그 회원의 정보를 불러옴
			ClientLoginVO clientLogin = clientLoginService.getUserByEmail(cvo);
			
			HttpSession session = request.getSession();
			
			//회원 정보를 세션에 저장한다.
			session.setAttribute("client_info", clientLogin);
			
			url = "successlogin";
			
			return "redirect:"+url;
			
		}
		
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		String url = "";
		
		log.info("로그아웃 처리");
		
        session.invalidate();
        
        url = "completelogout";
        
		
		return "redirect:"+url;
	}
	
	
	@RequestMapping("completelogout")
	public String logout() {
		
		return "main"; //     /WEB-INF/views/login/client/completelogout.jsp로 이동 , 아이디 찾기 화면
	}
	
	
	
	
	

}
