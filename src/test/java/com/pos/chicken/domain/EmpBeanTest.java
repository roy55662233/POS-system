package com.pos.chicken.domain;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.Session;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.pos.chicken.repository.EmpRepository;
import com.pos.chicken.repository.EmpServiceRepository;
import com.pos.chicken.repository.OrderDetailRepository;
import com.pos.chicken.repository.OrderRepository;
import com.pos.chicken.repository.ProdRepository;

@SpringBootTest
//@Transactional
public class EmpBeanTest {
	@Test
	void contextLoads() {}
	
	@Autowired 
	EmpRepository emp;
	@Autowired
	OrderDetailRepository orderD;
	@Autowired
	OrderRepository order;
	@PersistenceContext 
	Session session;
	@Autowired
	private EmpServiceRepository empservicerespository;
	
	@Autowired
	ProdRepository prod;
	//@Test
	public void prodInsert() {
		ProdBean bean = new ProdBean();
		bean.setProdCategory("雞排");
		bean.setProdID(3);
		bean.setProdName("JAVA雞排");
		bean.setProdPrice(8888);
		bean.setProdUnit("片");
		prod.save(bean);
	}
	
//	@Test
	public void select() {
		EmpBean select = session.get(EmpBean.class, "unitTest0610");
		
		System.out.println(select);
	}
//	@Test
	public void orderselect() {

		OrderBean select = session.get(OrderBean.class, 2);
		System.out.println(select);
	}
	@Test
	public void orderdetailselect() {

		OrderDetailBean select = session.get(OrderDetailBean.class, 3);
		System.out.println(select);
	}
	
	@Test
	public void twiceTest() {
		EmpBean bean = new EmpBean();
		
		bean.setEmpName("大佬");
		bean.setEmpID("Boss");
		bean.setEmpHrs(1000000);
		bean.setEmpPassword("im a boss");
		bean.setEmpPostion("老闆");
		emp.save(bean);
		
	}
	
	
	
	
//	@Test
	public void prodselect() {

		ProdBean select = session.get(ProdBean.class, 4);
		System.out.println(select);
	}
//	@Test
	public void orderDetailSelect() {
		OrderDetailBean select= session.get(OrderDetailBean.class, 2);
		session.createNativeQuery("select `order_id` from orders").getSingleResult();
		System.out.println(select+"OrderID:"+session.createNativeQuery("select `order_id` from orders").getSingleResult());
	}
	

//	@Test
	public void orderInsert() throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		
		Date date =  sdf.parse("2021-06-01");
		OrderBean bean = new OrderBean();
		bean.setOrderId(2);
		bean.setOrderDate(date);
		

		OrderBean a= order.save(bean);
		System.out.println(a);
		
	}
	
	//@Test
	public void orderdetailInsert() {
		OrderDetailBean bean = new OrderDetailBean();
		OrderBean orders = new OrderBean();
		
		orders.setOrderId(4);
		orders.setOrderDate(new Date(0));
		
		OrderBean a = order.save(orders);
		
		bean.setOrderfk(a);
		bean.setOrderCount(10);
		

		bean.setOrderPrice(9000);
		bean.setOrderUnitsprice(900);
		orderD.save(bean);
	}	
		
	//@Test
	public void selectOrderDetail() {
		List list = session.createNativeQuery("SELECT Order_ID,sum(Order_Price) as 'total' from orderdetail GROUP BY Order_ID").list();
		
		System.out.println(list);
		
		for(Object obj : list) {
			Object[] array = (Object[]) obj;
			System.out.println("SessionFactory="+array[0]+":"+array[1]);
		}
	}
//	@Test
	public void insertOrderDetail() {
		
		
		Query a = session.createNativeQuery("INSERT INTO `orderdetail` (`OrderD_ID`, `Order_ID`, `Order_Name`, `Order_Count`, `Order_Price`, `Order_Unitsprice`) VALUES (NULL, '7', '我愛老虎油', '20', '300', '15')");
		//List b = session.createNativeQuery("select 8 from orderdetail").list();
		a.executeUpdate();
		
		
	}
		
	

   

	//@Test
	public void selectEmp() {
		Optional<EmpBean> bean = emp.findById("beetest");
		EmpBean a= bean.get();
		
		System.out.println(a);
	}
	//@Test
	public void selectemp() {
		
		System.out.println(session.get(EmpBean.class, "beetest"));
	}
	//@Test
	public void deleteemp() {
		EmpBean bean = new EmpBean();
		bean.setEmpID("5");
		emp.delete(bean);
		
	}
	
	//@Test
	public void test() {
		List<String> list = new ArrayList<String>();    
		list.add("a1");    
		list.add("a2");    
		String[] toBeStored = list.toArray(new String[list.size()]);    
		for(String s : toBeStored) {    
		     System.out.println(s);    
		}
	}
	
	//@Test
	public void TTTTest() throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		
			Date date = sdf.parse("2000-02-02");
			
//			empservicerespository.
//			addEmp2("aaaaa11", "bbbb", "我是session", date , "091124113", "success@ok.com");
		
		
		
		
		
		
	}
	//@Test
	public void Select() {
		Optional<EmpBean> bean= emp.findById("appleeee");
		System.out.println(bean);
	}
}
