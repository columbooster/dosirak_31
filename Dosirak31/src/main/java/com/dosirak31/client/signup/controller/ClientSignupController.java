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
	

		// service�� ����
		private ClientService clientService;

		// ȸ������ ȭ�� get
		@GetMapping(value = "/signupForm")
		public String getClientSignup() throws Exception {
			log.info("client ȸ������ ȭ�� ȣ�� ����");
			
			return "signup/client/signupForm";
		}
		
		// ȸ������ post
		@PostMapping(value = "/signup")
		public String postClientSignup(ClientVO cvo) throws Exception {
			log.info("clientSignup ȸ������ ����");
			
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
