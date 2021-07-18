package com.pos.chicken.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pos.chicken.domain.EmpBean;
import com.pos.chicken.repository.EmpRepository;
import com.pos.chicken.repository.EmpServiceRepository;

@Controller
public class EmpController {

	@Autowired
	private EmpServiceRepository empService;
	@Autowired
	private MessageSource messageSource;
	@Autowired
	private EmpRepository dao;

	@RequestMapping(path = { "/pages/empmanage.controller" })
	public String method(
			@RequestParam("empcontroller") String empcontroller,
			EmpBean bean, Model model,
			BindingResult bindingResult,
			Locale locale,
			@RequestParam("empID") String empID,
			@RequestParam("empName") String empName,
			@RequestParam("empPostion") String empPostion)
	// 接收資料
	// 轉換資料
	{
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		if (bindingResult != null && bindingResult.hasFieldErrors()) {
			if (bindingResult.hasFieldErrors("empID")) {
				errors.put("empID", messageSource.getMessage("emp.empID.format", null, locale));
			}
		}
//驗證資料
		if (empcontroller != null) {
			if (empcontroller.equals("新增") || empcontroller.equals("更新")) {
				if (bean == null || bean.getEmpID() == null) {
					errors.put("empID",messageSource.getMessage("emp.empID.required",
							new String[] { empcontroller }, locale));
				}
			}

		}
		if (errors != null && !errors.isEmpty()) {
			return "/back-pages/emp/emp";
		}
		System.out.println(errors);
		// 查看員工
		if (empcontroller != null && empcontroller.equals("員工查詢")) {
			System.out.println(empcontroller);
			List<EmpBean> result = empService.selectEmp(bean);
			model.addAttribute("select", result);
			return "/back-pages/emp/display";
		}
		
		// 新增員工資料
		else if (empcontroller != null && empcontroller.equals("新增")) {
			EmpBean result = empService.addEmp1(bean);
//			System.out.println("新增錯誤訊息:" + result);
			if (result == null) {
				errors.put("action", "新增失敗，請重新輸入正確的名稱");
			} else {
				model.addAttribute("insert", result);
			}
			return "/back-pages/emp/emp";
		}
		
		// 編輯員工資料
		else if (empcontroller != null && empcontroller.equals("更新")) {
			EmpBean result = empService.editEmp(bean);
			if (result == null) {
				errors.put("action", "更新失敗");
//				model.addAttribute("errors", "Update Failed");
			} else {
				model.addAttribute("update", result);
			}
			return "/back-pages/emp/emp";
		} 
		
		//顯示員工資料
		else if (empcontroller != null && empcontroller.equals("顯示全部")) {
			List<EmpBean> result = dao.findAll();
//			System.out.println("aaaa" + result);
			if (result == null) {
//				System.out.println("null");
			} else {
				model.addAttribute("select", result);
			}
			return "/back-pages/emp/display";
		} else {

		// 放未知訊息
			model.addAttribute("errors", "更新失敗");
			return "/back-pages/emp/emp";
		}
	}
}
