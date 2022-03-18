package com.eea.controllers;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(path = "/eea")
public class ApplicationController {
	@GetMapping(path = "/")
	public ModelAndView sendList(ModelAndView modelAndView) {
		List<String> lang = Arrays.asList("Java", "Python");
		modelAndView.addObject("lang", lang);
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@GetMapping(path = "/signUp")
	public ModelAndView signUpPage() {
		ModelAndView modelAndView = new ModelAndView("signUp");
		return modelAndView;
	}
}
