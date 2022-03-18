package com.eea.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eea.dto.LogInFormDTO;

@Controller
@RequestMapping(path = "/eea")
public class AuthenticationController {

	@PostMapping(path = "/loginAuth")
	public ModelAndView loginAuth(@ModelAttribute LogInFormDTO loginForm) {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println(loginForm.toString());
		return modelAndView;
	}
	
//	@GetMapping(path = "/signUp")
//	public ModelAndView signUp(HttpServletRequest request) {
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("su_accountType");
//		return modelAndView;
//	}
	
	@PostMapping(path = "/initiateAccount")
	public ModelAndView initiateAccount(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("su_politicalEntity");
		return modelAndView;
	}
	


	
}
