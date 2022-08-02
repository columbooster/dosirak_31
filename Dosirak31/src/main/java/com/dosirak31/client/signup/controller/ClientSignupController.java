package com.dosirak31.client.signup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dosirak31.client.signup.service.ClientService;
import com.dosirak31.client.signup.vo.ClientVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@Controller
@RequestMapping("signup/client/*")
public class ClientSignupController {
	

		// service를 의존
		private ClientService clientService;

		// 회원가입 화면 get
		@GetMapping(value = "/signupForm")
		public String getClientSignup() throws Exception {
			log.info("client 회원가입 화면 호출 성공");
			
			return "signup/client/signupForm";
		}
		
		// 회원가입 post
		@PostMapping(value = "/signup")
		public String postClientSignup(ClientVO cvo) throws Exception {
			log.info("clientSignup 회원가입 성공");
			
			int result = 0;
			String url = "";
			
			result = clientService.clientSignup(cvo);
			if(result == 1) {
				url = "/login/client/loginForm";
			} else {
				url = "/signup/client/signupForm";
			}
			return "redirect:"+url;
			
		}
		
		
}
