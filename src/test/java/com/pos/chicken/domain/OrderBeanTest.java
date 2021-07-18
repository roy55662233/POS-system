package com.pos.chicken.domain;

import java.util.Date;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


import com.pos.chicken.repository.OrderDetailRepository;
import com.pos.chicken.repository.OrderRepository;

@SpringBootTest
public class OrderBeanTest {

	@Autowired
	private OrderRepository orderdao;

	@PersistenceContext
	private Session session;
	
	@Autowired
	private OrderDetailRepository oddao;
	
	@Test
	public void test() {
		System.out.println("我在這"+oddao.selectMonthPrice());
	}
	
	//@Test
	public void insert() {
		OrderBean bean = new OrderBean();
		
		EmpBean empbean = new EmpBean();
		empbean.setEmpID("Emp003");
		
		
		bean.setOrderId(2);
		bean.setEmpfk(empbean);
		
		
		bean.setOrderDate(new Date());
		bean.setOrderMark("nice try");
		
		orderdao.save(bean);
		
		
		
	}
	//@Test
	public void oderdetailInsert() {
		OrderDetailBean odbean = new OrderDetailBean();
		
		OrderBean ordbean = new OrderBean();
		ordbean.setOrderId(1);
		ProdBean prodbean = new ProdBean();
		prodbean.setProdID(5);
		
		odbean.setOrderId(ordbean.getOrderId());
		odbean.setOrderPrice(500);
		odbean.setOrderCount(10);
		odbean.setOrderUnitsprice(50);
		odbean.setProdfk(prodbean);
		
		oddao.save(odbean);
		
	}
}
