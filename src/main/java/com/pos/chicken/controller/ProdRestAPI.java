package com.pos.chicken.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.pos.chicken.domain.EmpBean;
import com.pos.chicken.domain.EmployeeHour;
import com.pos.chicken.domain.MonthPrice;
import com.pos.chicken.domain.OrderBean;
import com.pos.chicken.domain.OrderDetailBean;
import com.pos.chicken.domain.ProdBean;
import com.pos.chicken.repository.EmpRepository;
import com.pos.chicken.repository.OrderDetailRepository;
import com.pos.chicken.repository.OrderDetailServiceRepository;
import com.pos.chicken.repository.OrderRepository;
import com.pos.chicken.repository.ProdRepository;
import com.pos.chicken.repository.ProdServiceRepository;


@RestController
@RequestMapping(path={"/public/api"})
public class ProdRestAPI {
	@Autowired
	private ProdServiceRepository prodService;
	
	@Autowired
	private EmpRepository EmpJpa;
	
	@Autowired
	private ProdRepository prodJpa;
	
	@Autowired
	private OrderDetailRepository odSerive;
	
	@Autowired
	private OrderDetailServiceRepository odS;
	
	@Autowired
	private OrderRepository ordersJpa;
	
	@GetMapping("/Emp")
	public List<EmpBean> EmpBeanfindAll() {
		List<EmpBean> result= EmpJpa.findAll();
		return (result);
	}
	
	@GetMapping("/prod")
	public List<ProdBean> prodfindAll() {
		List<ProdBean> result= prodService.select(null);
		
		return (result);
	}
	
	@GetMapping("/prodOrderby")
	public List<ProdBean> findAllOrderby() {
		List<ProdBean> result= prodJpa.findAll();
		return (result);
	}
	
	//訂單主表
	@GetMapping("/oderds")
	public List<OrderBean> oderdsfindAll(){
		List<OrderBean> result= ordersJpa.findAll(Sort.by(Sort.Direction.DESC, "orderId"));
//		System.out.println(result);
		return (result);
	}
	
	//訂單明細
	@GetMapping("/oderdetail")
	public List<OrderDetailBean> oderdetailfindAll(Model model){
		List<OrderDetailBean> result= odSerive.findAll();
		return (result);
	}
	
	@GetMapping("/oderdetailObj")
	public Object order() {
		List<OrderDetailBean> result= odSerive.findAll();
		Object data = result;
		return data;
	}
	
	//訂單主表
	@GetMapping("/news")
	public List<OrderDetailBean> oderdsfindAll1(){
		List<OrderDetailBean> result= odSerive.selectOrderToDetail(80);
//		System.out.println(result);
		return (result);
	}
	
	@GetMapping("/date/{date1}/{date2}")
	public List<OrderDetailBean> oderdsfindAlldate(@PathVariable("date1") String date1,@PathVariable("date2") String date2){
		System.out.println(date1+":"+date2);
		List<OrderDetailBean> result= odSerive.selectdate(date1, date2);
//		System.out.println(result);
		return (result);
	}
	
	//訂單明細 單表指定查詢
//	@GetMapping("/oderdetail/{id}")
//	public void orderselect(String id) {
//		System.out.println(id);
//	}
	
	//營業額
	@GetMapping("/monthprice")
	public List<MonthPrice> monthprice() {
		List<MonthPrice> result= odSerive.selectMonthPrice();
		return result;
	}
	
	//總時數
	@GetMapping("/totaltime")
	public List<EmployeeHour> totaltime() {
		List<EmployeeHour> result= EmpJpa.selectEmployeeHour();
		return result;
	}
	
}
