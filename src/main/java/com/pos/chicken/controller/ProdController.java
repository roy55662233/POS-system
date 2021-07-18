package com.pos.chicken.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

import org.springframework.web.bind.annotation.PostMapping;


import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;

import com.pos.chicken.domain.ProdBean;
import com.pos.chicken.repository.ProdServiceRepository;

@Controller

public class ProdController {
	@Value("${web.upload-path}")
	private String path1;

	@Autowired
	private ProdServiceRepository prodService;

	@SuppressWarnings("deprecation")
	@PostMapping(path = "/pages/prod.controller1111")
	public String insert(@RequestParam("product") String product,
			Integer prodID,
			@RequestParam("prodName") String prodName,
			@RequestParam("prodCategory") String prodCategory,
			Integer prodCount, Integer prodPrice,
			@RequestParam("prodUnit") String prodUnit,
			@RequestParam("prodImg") MultipartFile prodImg, Model model) {
		if (product != null && product.equals("新增")) {

			String uploadedFileName = prodImg.getOriginalFilename();
			
			if (StringUtils.isEmpty(uploadedFileName)) {

				model.addAttribute("msg", "請選擇檔案!");
				return "/back-pages/prod/menutest1";
			}
			try {

				prodService.insert(prodID, prodName, prodUnit, prodCategory, prodPrice, prodCount, prodImg);
				saveUploadedFiles(prodImg);
				
				model.addAttribute("msg", "Success Insert");
				System.out.println("ok");
			} catch (Exception e) {
				System.out.println(e);

				model.addAttribute("msg1", "Failed Insert");

				return "/back-pages/prod/menutest1";
			}

		} else if (product != null && product.equals("查看")) {
			System.out.println("查看");
			ProdBean bean = new ProdBean();
			bean.setProdID(prodID);
			System.out.println(bean);
			List<ProdBean> result = prodService.select(bean);
			model.addAttribute("select", result);
			return "/back-pages/prod/display";
		}
		else if(product != null && product.equals("修改")) {
			prodService.insert(prodID, prodName, prodUnit, prodCategory, prodPrice, prodCount, prodImg);
			model.addAttribute("msg1", "修改成功!");
		}

		else {
			System.out.println("i dont know");
		}
		return "/back-pages/prod/menutest1";
	}


	
	private void saveUploadedFiles(MultipartFile files) throws IOException {
		byte[] bytes = files.getBytes();
		Path path = Paths.get(path1 + files.getOriginalFilename());
//		System.out.println(path);
		Files.write(path, bytes);
	}

}
