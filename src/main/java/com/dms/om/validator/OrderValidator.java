package com.dms.om.validator;

import java.util.List;

import org.springframework.validation.Errors;

import com.dms.om.model.Order;
import com.dms.om.model.OrderLine;

public class OrderValidator {
	public void validate(Object obj, Errors errors) {

		Order order = (Order) obj;
		
		if (order.getCustomer() == null || order.getCustomer().length() == 0) {
			errors.rejectValue("customer", "error.empty.field", "必填");
		}
		if (order.getEnteredBy() == null || order.getEnteredBy().length() == 0) {
			errors.rejectValue("enteredBy", "error.empty.field", "必填");
		}
		if (order.getRequiredDate() == null) {
			errors.rejectValue("requiredDate", "error.empty.field", "必填");
		}else if(order.getRequiredDate().before(order.getEnteredDate()) ){
			errors.rejectValue("requiredDate", "error.empty.field", "交货日期不得晚于订单日期");
		}
		
		List<OrderLine> orderLines = order.getOrderLines();
		
		for(int i = 0; i < orderLines.size(); i++){
			OrderLine orderLine = orderLines.get(i);
			if (orderLine.getLineItem() == null || orderLine.getLineItem().length() == 0) {
				errors.rejectValue("orderLines[" + i + "].lineItem", "error.empty.field", "必填");
			}
			if (orderLine.getLineQuantity() == null) {
				errors.rejectValue("orderLines[" + i + "].lineQuantity", "error.empty.field", "必填");
			}
			else if (orderLine.getLineQuantity() == 0) {
				errors.rejectValue("orderLines[" + i + "].lineQuantity", "error.empty.field", "不能为0");
			}
			if (orderLine.getItemPrice() == null) {
				errors.rejectValue("orderLines[" + i + "].itemPrice", "error.empty.field", "必填");
			}
		}
		
	}
}
