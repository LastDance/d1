package com.dms.om.validator;

import org.springframework.validation.Errors;

import com.dms.om.model.OrderLine;

public class OrderLineValidator {
	public void validate(Object obj, Errors errors) {

		OrderLine orderLine = (OrderLine) obj;

		if (orderLine.getItem() == null || orderLine.getItem().length() == 0) {
			errors.rejectValue("item", "error.empty.field", "必填");
		}
		if (orderLine.getLineQuantity() == null) {
			errors.rejectValue("lineQuantity", "error.empty.field", "必填");
		}
		if (orderLine.getLineQuantity() == 0) {
			errors.rejectValue("lineQuantity", "error.empty.field", "不能为0");
		}
		if (orderLine.getItemPrice() == null) {
			errors.rejectValue("itemPrice", "error.empty.field", "必填");
		}
		
	}
}
