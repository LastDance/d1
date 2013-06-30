package com.dms.om.service;

import java.util.List;

import com.dms.om.model.Order;

public interface IOrderService {

	public void createOrder(Order order);

	public void removeOrder();

	public List<Order> getOrder(String number);
}
