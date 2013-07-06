package com.dms.om.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dms.om.dao.IOrderDAO;
import com.dms.om.dao.IOrderStatusDAO;
import com.dms.om.model.Order;
import com.dms.om.model.OrderLine;
import com.dms.om.model.OrderStatus;

@Service
public class OrderService implements IOrderService {

	@Autowired
	private IOrderDAO orderDAO;

	@Autowired
	private IOrderStatusDAO orderStatusDAO;

	@Transactional
	public void createOrder(Order order) {
		orderDAO.createOrder(order);
	}

	@Transactional
	public void removeOrder() {

	}

	@Transactional
	public Order getOrder(int id) {
		return orderDAO.getOrder(id);
	}

	@Transactional
	public List<OrderStatus> getOrderStatusList() {
		return orderStatusDAO.getOrderStatus();
	}

	@Override
	public void removeDeletedOrderLines(Order order) {
		// Remove the ##deleted_lines
		int lineNumber = 1;

		for (int i = 0; i < order.getOrderLines().size(); i++) {
			if (order.getOrderLines().get(i) != null) {
				if (!order.getOrderLines().get(i).isActive())
					order.getOrderLines().remove(i);
				else {
					order.getOrderLines().get(i).setOrder(order);
					order.getOrderLines().get(i).setLine(lineNumber);
					lineNumber++;
				}
			}
		}
	}

	@Override
	public Order initializeOrder(String enteredBy) {
		Date today = new Date();
		Order order = new Order();

		order.setEnteredBy(enteredBy);
		order.setEnteredDate(today);

		// order.setPrefix("test");

		return order;
	}

	// TODO order status
	@Override
	public Order SetOrderStatus(String step, Order order) {
		if (step.equalsIgnoreCase("create")) {
			order.setStatus("已录入，待审核");
			for (OrderLine line : order.getOrderLines()) {
				line.setStatus("已录入，待审核");
			}
		}
		return order;
	}
}
