package com.dms.om.form;

import com.dms.om.model.Order;
import com.dms.om.model.OrderLine;
import com.dms.om.model.Task;

public class ReviewOrderForm {
	
	private Order order;
	private OrderLine line;
	private Task task;
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public OrderLine getLine() {
		return line;
	}
	public void setLine(OrderLine line) {
		this.line = line;
	}
	public Task getTask() {
		return task;
	}
	public void setTask(Task task) {
		this.task = task;
	}
	
	
}
