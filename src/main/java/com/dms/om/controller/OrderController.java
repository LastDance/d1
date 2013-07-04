package com.dms.om.controller;

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
import com.dms.om.service.IOrderService;
import com.dms.om.validator.OrderValidator;

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
		Order order = orderService.initializeOrder(userLoged);

		map.put("order", order);

		// TODO order status
		// List<OrderStatus> orderStatusList =
		// orderService.getOrderStatusList();
		// for(OrderStatus s : orderStatusList){
		// System.out.println(s.getId());
		// System.out.println(s.getOrderStatus());
		// }
		// map.put("statusList", orderStatusList);
		return "om/createOrder";
	}

	@RequestMapping(value = "/createOrder", method = RequestMethod.POST)
	public String addOrder(@ModelAttribute("order") Order order,
			BindingResult result, HttpServletRequest request) {
		
		orderService.removeDeletedOrderLines(order);

		OrderValidator orderValidator = new OrderValidator();
		orderValidator.validate(order, result);
		
//		for (OrderLine line : order.getOrderLines())
//			orderLineValidator.validate(line, result);
		if (result.hasErrors()) {
			return "om/createOrder";
		} else {
			//TODO order prefix & status
			order.setPrefix("test");
			orderService.SetOrderStatus("create", order);
			orderService.createOrder(order);
			
			logger.info("order created");
			return "om/createOrder";
		}
	}

}
