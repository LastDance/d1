package com.dms.om.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dms.om.model.OrderControl;
import com.dms.om.model.OrderStatus;
import com.dms.om.service.IOrderService;

@Controller
public class TestPageController {
	@Autowired
	private IOrderService orderService;
	
	@RequestMapping("/testPage")
	public String welcome(Map<String, Object> map) {
		
		OrderControl orderControl = new OrderControl();
		orderControl.setOrderPrefix("WO");
		orderControl.setOrderStatusOptions(orderService.getOrderStatusList());
		map.put("orderControl", orderControl);
		
		return "test/testPage";
	}
}
