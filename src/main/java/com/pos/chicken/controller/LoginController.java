package com.pos.chicken.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pos.chicken.domain.EmpBean;
import com.pos.chicken.repository.EmpRepository;
import com.pos.chicken.repository.EmpServiceRepository;

@Controller
public class LoginController {
	
	@Autowired
	private EmpServiceRepository empServiceRepository;
	
	@Autowired EmpRepository empdao;
	
	@PostMapping(path = {"/back-pages/login.controller"})
	public String method(String empId,  //前端給我的empId
			String password,			//前端給我的password
			Model model,
			HttpSession session) {		

				EmpBean bean = empServiceRepository.login(empId, password);
				if(bean==null) {
					System.out.println("login failed");
					model.addAttribute("error","輸入錯誤!請重新輸入!");
					
					return "/back-pages/login";
					
				}else {
					session.setAttribute("emp", bean);
					model.addAttribute("error","登入成功");
					return "/back-pages/bakeIndex";
				}
				
	}
	
}
