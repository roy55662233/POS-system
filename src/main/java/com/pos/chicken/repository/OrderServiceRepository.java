package com.pos.chicken.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pos.chicken.domain.OrderBean;

@Service
@Transactional(value = "transactionManager")
public class OrderServiceRepository {
	@Autowired
	OrderRepository orderdao;

	public List<OrderBean> orderSelect(OrderBean bean) {

		List<OrderBean> result = null;
		if (bean != null && bean.getOrderId() != null) {
			Optional<OrderBean> optional = orderdao.findById(bean.getOrderId());
			if (!optional.isEmpty()) {
				OrderBean temp = optional.get();
				result = new ArrayList<OrderBean>();
				result.add(temp);

			}
		} else {
			result = orderdao.findAll();
		}
		return result;

	}

	public OrderBean orderInsert(OrderBean bean) {
		OrderBean result = null;
		if (bean != null && bean.getOrderId() != null) {
			if (!orderdao.existsById(bean.getOrderId())) {
				result = orderdao.save(bean);
			}
		}
		return result;

	}

	public OrderBean orderUpdate(OrderBean bean) {
		OrderBean result = null;
		if (bean != null & bean.getOrderId() != null) {
			if (orderdao.existsById(bean.getOrderId())) {
				result = orderdao.save(bean);
			}
		}
		return result;
	}

}
