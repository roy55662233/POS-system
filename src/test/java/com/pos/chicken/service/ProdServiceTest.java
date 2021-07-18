package com.pos.chicken.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.pos.chicken.repository.ProdRepository;
import com.pos.chicken.repository.ProdServiceRepository;

@SpringBootTest
public class ProdServiceTest {
	@Autowired
	private ProdServiceRepository prodService;
	@Autowired
	ProdRepository dao;
	
//	@Test
	public void select() {
//		prodService.select(null);
//		System.out.println(prodService.select(null));
		dao.findAll();
		System.out.println(dao.findAll().get(0).getProdName());
	}
	
	@Test
	public void test() {
		
	}
}
