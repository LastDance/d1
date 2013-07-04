package com.dms.om.model;

import java.util.List;

public class OrderControl {

	private String orderPrefix;
	
	private List<OrderStatus> orderStatusOptions;

	public String getOrderPrefix() {
		return orderPrefix;
	}

	public void setOrderPrefix(String orderPrefix) {
		this.orderPrefix = orderPrefix;
	}

	public List<OrderStatus> getOrderStatusOptions() {
		return orderStatusOptions;
	}

	public void setOrderStatusOptions(List<OrderStatus> orderStatusOptions) {
		this.orderStatusOptions = orderStatusOptions;
	}
	
	
}
