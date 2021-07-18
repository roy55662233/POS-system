package com.pos.chicken.repository;

import java.util.List;

import javax.persistence.PersistenceContext;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional(value="transactionManager")
public class OrderDetailServiceRepository {
	 
	@Autowired
	private OrderDetailRepository ordertaildao;
	
	@PersistenceContext
	Session session;
	
	public Object orderPrice(Integer id) {
		String hql ="SELECT SUM(Order_Price) AS total FROM `orderdetail` as od LEFT JOIN  `orders` AS o ON o.Order_ID = od.Order_ID WHERE od.Order_ID = "+id+" GROUP BY od.Order_ID";
		System.out.println("sdfsdfsf我"+hql);
		Object query = session.createNativeQuery(hql).uniqueResult();
//		List<List> data=query.list();
		return query;
	}
	
	
	public Object orderPriceSum(Integer id) {
		String hql = "SELECT SUM(Order_Price) FROM `orderdetail` od LEFT JOIN"
				+ " `orders` o ON o.Order_ID = od.Order_ID WHERE od.Order_ID ="+ id+" GROUP BY od.Order_ID ";
		Object query = session.createNativeQuery(hql);
		return query;
	}
	
	public Object ordercoint(Integer id) {
		String Counthql ="SELECT SUM(Order_Count) AS totalcount FROM `orderdetail` as y LEFT JOIN `orders` AS a ON a.Order_ID = y.Order_ID WHERE y.Order_ID = "+id+" GROUP BY y.Order_ID";
		System.out.println("總數量"+Counthql);
		Object Countquery = session.createNativeQuery(Counthql).uniqueResult();
		return Countquery;
	}
	
	public void orderprod(Integer id) {
		String Prodhql = "select p.prod_name from prod p, orderdetail o where p.Prod_ID = o.Prod_ID and o.order_id = 13";
		 session.createNativeQuery(Prodhql).stream().iterator();
		System.out.println(session.createNativeQuery(Prodhql).stream().filter(it -> it.toString()!=null)); 
//		System.out.println("我是qq="+q);
		
		
		
		
//		for (Object[] a : products) {
//		    System.out.println( "我是A===" +a[0]);
//		}
		
//		return Prodhql;
	}
	
	public org.hibernate.query.Query selectprodName(Integer id) {
		String ProdName = "select p.prod_name from prod p, orderdetail o where "
				+ "p.Prod_ID = o.Prod_ID and o.order_id = 13" ;
		
		org.hibernate.query.Query show = session.createNamedQuery(ProdName);
		 System.out.println(session.createNamedQuery(ProdName));
		 
		 return show;
	}

}
