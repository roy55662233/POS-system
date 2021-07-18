package com.pos.chicken.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pos.chicken.domain.EmpBean;
import com.pos.chicken.repository.EmpServiceRepository;

@Controller
public class EmpLoginController {

	@Autowired
	private EmpServiceRepository empservicedao;
	
	@RequestMapping(
			path= {"/pages/emp.controller"}
			)
	public String method(
			String empid,
			String password,
			Model model,
			HttpSession session) {
		
		
		//呼叫model
		EmpBean bean = empservicedao.login(empid, password);
		
		if(bean==null) {
			System.out.println("login failed");
			return "/failed";
		}else {
			session.setAttribute("emp", bean);
		}
		return "redirect:/abc";
	}
	
}

