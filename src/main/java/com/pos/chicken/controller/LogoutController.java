package com.pos.chicken.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pos.chicken.domain.EmpBean;
import com.pos.chicken.repository.EmpRepository;
import com.pos.chicken.repository.EmpServiceRepository;

@Controller
public class LogoutController {
	@Autowired
	private EmpServiceRepository empServiceRepository;
	
	@Autowired EmpRepository empdao;
	
	@RequestMapping(path = {"/back-pages/logout.controller"})
	public String method(			//前端給我的password
			Model model,
			HttpSession session) {		
		
		session.removeAttribute("emp");
		
		return "/font-pages/home";
		
	}
}
