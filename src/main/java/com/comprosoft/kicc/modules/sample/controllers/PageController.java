package com.comprosoft.kicc.modules.sample.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.comprosoft.kicc.modules.sample.repositories.LoginCredentialsRepository;

@Controller
public class PageController {

	@Autowired
	private LoginCredentialsRepository repository;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loadWelcomPage() {
		repository.findByUserName("joby");
		return "index";
	}
	@RequestMapping(value = "/movingimage", method = RequestMethod.GET)
	public String loadMovingimage() {
		repository.findByUserName("joby");
		return "moveImage";
	}
	
 }
