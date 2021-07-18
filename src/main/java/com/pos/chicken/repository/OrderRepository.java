package com.pos.chicken.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pos.chicken.domain.OrderBean;

public interface OrderRepository extends JpaRepository<OrderBean, Integer> {
//	@Query(value = "SELECT * FROM `orders` order by Order_ID DESC",nativeQuery = true)
//	 public List<OrderBean> findAllOrderByIdAsc(); 
}
