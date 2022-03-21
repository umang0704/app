package com.eea.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eea.dto.SignUpFormDto;
import com.eea.dto.response.BaseResponse;
import com.eea.services.AccountService;

@Controller
@RequestMapping(path = "/eea")
public class ApplicationController {

	@Autowired
	private AccountService accountService;

	@GetMapping(path = "/index")
	public ModelAndView sendList(Model model) {
		ModelAndView modelAndView = new ModelAndView();
		BaseResponse baseResponse = new BaseResponse();
		modelAndView.addObject("baseResponse",baseResponse);
		modelAndView.setViewName("index");
		return modelAndView;
	}

	@GetMapping(path = "/signUp")
	public ModelAndView signUpPage(Model model) {
		ModelAndView modelAndView = new ModelAndView();
		BaseResponse baseResponse = new BaseResponse();
		modelAndView.addObject("baseResponse",baseResponse);
		modelAndView.setViewName("signUp");
		return modelAndView;
	}

	@PostMapping(path = "/createAccount")
	public ModelAndView createAccount(@ModelAttribute SignUpFormDto signUpFormDto,Model model){
		ModelAndView modelAndView = new ModelAndView("signUp");
		BaseResponse baseResponse = accountService.createAccount(signUpFormDto);
		modelAndView.addObject("baseRespone", baseResponse);
		return modelAndView;
	}
}
