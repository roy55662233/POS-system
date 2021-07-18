package com.pos.chicken.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.pos.chicken.domain.MonthPrice;
import com.pos.chicken.domain.OrderDetailBean;
import com.pos.chicken.domain.OrderDetailBean.ConfigId;


public interface OrderDetailRepository extends JpaRepository<OrderDetailBean, ConfigId> {
	
	@Modifying
	@Query(value = "insert into OrderDetail(`Order_ID`, `Prod_ID`, `Order_Count`, `Order_Price`, `Order_Unitsprice`)"
			+ " values(?1,?2,?3,?4,?5)",nativeQuery = true)
    int addOrderToDetail(Integer orderId,Integer prodId,Integer orderCount , Integer orderPrice,Integer unitsPrice);
	
	//抓取資料庫的orderDetail order_id= %s
	@Modifying
	@Query(value = "select * from OrderDetail where `Order_ID` = ?1 ",nativeQuery = true)
    List<OrderDetailBean> selectOrderToDetail(Integer orderid);
	
	
	@Modifying
	@Query(value = "SELECT * FROM `orderdetail` odt left join `orders` "
			+ "ods ON odt.order_id = ods.order_id WHERE `Order_Date` "
			+ "BETWEEN ?1 AND ?2",nativeQuery = true)
    List<OrderDetailBean> selectdate(String date1 , String date2);
	
	@Modifying
	@Query(value = "SELECT * FROM orderdetail odt left join prod ods ON odt.Prod_ID = ods.prod_id WHERE odt.Order_ID = ?1 ",nativeQuery = true)
    List<OrderDetailBean> selectBuy(Integer receipt);
	
	
	 @Modifying
	 @Query(value ="select * FROM orderdetail WHERE Order_ID = ?1 ", nativeQuery = true)
	 List<OrderDetailBean> findByOrderAll(Integer orderId);
	 
	 
	 @Transactional
	  @Query("SELECT NEW com.pos.chicken.domain.MonthPrice(SUM(odt.orderPrice), MONTH(odt.orderfk.orderDate)) FROM OrderDetailBean odt"
	    + " JOIN odt.orderfk GROUP BY MONTH(odt.orderfk.orderDate) "
	    )
	  List<MonthPrice> selectMonthPrice();
}
