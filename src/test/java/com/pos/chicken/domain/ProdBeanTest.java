package com.pos.chicken.domain;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.pos.chicken.repository.ProdRepository;
import com.pos.chicken.repository.ProdServiceRepository;

@SpringBootTest
public class ProdBeanTest {

	@Autowired
	private ProdRepository dao;
	
	@Autowired
	private ProdServiceRepository prodService;
	
	//@Test
	public void select() {
		
	 System.out.println(prodService.selectCount(5));
	}
	@Test
	public void insert() {
		ProdBean bean = new ProdBean();
		bean.setProdID(1);
		bean.setProdCount(10);
		dao.save(bean);
	}
}
