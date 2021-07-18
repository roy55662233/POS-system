package com.pos.chicken.domain;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.pos.chicken.repository.OrderDetailRepository;

@Transactional
@SpringBootTest
public class OrderDetailBeanTests {

	@Autowired
	private OrderDetailRepository dao;
	
	@Test
	public void t() {
		
//		System.out.println(dao.findById(1));
		dao.addOrderToDetail(13, 1, 3, 5, 6);
	}
}
