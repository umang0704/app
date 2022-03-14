package com.eea.controllers;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(path = "/app")
public class ApplicationController {
	@GetMapping(path = "/index")
	public ModelAndView sendList(ModelAndView modelAndView) {
		List<String> lang = Arrays.asList("Java", "Python");
		modelAndView.addObject("lang", lang);
		modelAndView.setViewName("index");
		return modelAndView;
	}
}
