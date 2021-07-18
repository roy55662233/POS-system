package com.pos.chicken.service;

import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.pos.chicken.domain.EmpBean;
import com.pos.chicken.domain.OrderBean;
import com.pos.chicken.repository.OrderServiceRepository;

@SpringBootTest
public class OrderServiceTest {
	
	@Autowired
	private OrderServiceRepository orderService;
	
	
	//@Test
	public void select() {
		List<OrderBean> select = orderService.orderSelect(null);
		System.out.println(select);
	}
	
	@Test
	public void insert() {
		OrderBean bean = new OrderBean();
		EmpBean empbean = new EmpBean();
		empbean.setEmpID("Emp002");
		bean.setOrderId(3);
		bean.setEmpfk(empbean);
		bean.setOrderDate(new Date());
		bean.setOrderMark("測試");
		orderService.orderInsert(bean);
	}

}
