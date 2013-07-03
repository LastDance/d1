package com.dms.om.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dms.om.model.Order;
import com.dms.om.model.OrderLine;
import com.dms.om.service.IOrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private IOrderService orderService;

	private static final Logger logger = Logger
			.getLogger(OrderController.class);

	@RequestMapping("/createOrder")
	public String createOrder(Map<String, Object> map,
			HttpServletRequest request) {
		String userLoged = (String) request.getSession().getAttribute("user");
		Date date = new Date();

		Order order = new Order();
		order.setEnteredBy(userLoged);
		order.setEnteredDate(date);
		order.getOrderLines().add(new OrderLine());
		map.put("order", order);
		return "om/createOrder";
	}

	@RequestMapping(value = "/createOrder", method = RequestMethod.POST)
	public String addOrder(@ModelAttribute("order") Order order,
			BindingResult result, HttpServletRequest request) {
		
		logger.info("order created");
		order.getOrderLines().get(0).getItem();
		order.setNumber("so000");
		
		orderService.createOrder(order);
		return "om/createOrder";
	}
}
