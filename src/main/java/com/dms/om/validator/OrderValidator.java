package com.dms.om.validator;

import org.springframework.validation.Errors;

import com.dms.om.model.Order;

public class OrderValidator {
	public void validate(Object obj, Errors errors) {

		Order order = (Order) obj;
		
		if (order.getCustomer() == null || order.getCustomer().length() == 0) {
			errors.rejectValue("customer", "error.empty.field", "必填");
		}
		if (order.getEnteredBy() == null || order.getEnteredBy().length() == 0) {
			errors.rejectValue("enteredBy", "error.empty.field", "必填");
		}
		if (order.getCustomer() == null || order.getCustomer().length() == 0) {
			errors.rejectValue("customer", "error.empty.field", "必填");
		}
	}
}
