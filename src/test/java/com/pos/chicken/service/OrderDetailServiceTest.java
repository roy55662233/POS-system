package com.pos.chicken.service;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.pos.chicken.domain.OrderBean;
import com.pos.chicken.domain.OrderDetailBean;
import com.pos.chicken.domain.ProdBean;
import com.pos.chicken.repository.OrderDetailRepository;
import com.pos.chicken.repository.OrderDetailServiceRepository;
@Transactional
@SpringBootTest
public class OrderDetailServiceTest {
	@Autowired
	private OrderDetailServiceRepository odService;
	
	@Autowired
	private OrderDetailRepository orderDetailDao;
	
	@PersistenceContext
	Session session;
	
	@Test
	public void selectbu2() {
		System.out.println("------------------------");
		System.out.println(odService.selectprodName(13)) ;
		
	}
	
	//@Test
	public void seletBuy1() {
		List<OrderDetailBean> result = orderDetailDao.selectBuy(13);
		result.stream().forEach(System.out::println);
		Stream<OrderDetailBean> a = result.stream().filter(string -> string.getOrderId().equals(13));
		a.forEach(System.out::println);
//		List<List<OrderDetailBean>> names2 =Arrays.asList(result);
//		String[] b =result.toString().replaceAll("\\[","").replaceAll("\\]", "").replaceAll("[^[雞排]]", "").split(",");
//		System.out.println(b);
		System.out.println(a);
		odService.orderprod(1);
		
	}
	
	//@Test
	public void selectbyid() {
		OrderDetailBean bean = new OrderDetailBean();
		bean.setOrderId(1);
//		bean.setProdID(10);
//		Optional<OrderDetailBean> result2 =orderDetailDao.findById(1);
//		System.out.println("我是:"+ result2);
	}
	

	
	//@Test
	public void insert() {
		OrderDetailBean bean = new OrderDetailBean();
		ProdBean prodbean = new ProdBean();
		prodbean.setProdID(4);
		prodbean.setProdPrice(80);
		OrderBean orderbean = new OrderBean();
		orderbean.setOrderId(1);
		
		bean.setOrderId(orderbean.getOrderId());
		bean.setOrderCount(20);
		bean.setOrderUnitsprice(prodbean.getProdPrice());
		bean.setOrderPrice(bean.getOrderCount()*bean.getOrderUnitsprice());
		
		bean.setProdfk(prodbean);
//		odService.oderdetailInsert(bean);

	}
	
	
	//@Test
	public void select(){
		Integer a;
		List list = session.createNativeQuery("select * from orderdetail").list();
		for(Object obj : list) {
			Object[] array = (Object[]) obj;
			System.out.println( "查詢結果:"+array[0]+":"+array[1]+":"+array[2]+":"+array[3]+":"+array[4]);
		}
		
//		System.out.println( "查詢結果:"+ orderDetailDao.findAll());
//		System.out.println( "查詢結果:"+orderDetailDao.findById(13));
		
//		List list1 = orderDetailDao.findAll();
//		for(Object obj : list1) {
//			Object[] array = (Object[]) obj;
//			System.out.println(array[0]+":"+array[1]+":"+array[2]+":"+array[3]+":");
//		}
		
		
	}
	
	
		


}
