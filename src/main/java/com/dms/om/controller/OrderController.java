package com.dms.om.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dms.om.form.ReviewOrderForm;
import com.dms.om.model.Order;
import com.dms.om.model.PaginationSupport;
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
		return "om/createOrder";
	}

	@RequestMapping(value = "/createOrder", method = RequestMethod.POST)
	public String addOrder(@ModelAttribute("order") Order order,
			BindingResult result, HttpServletRequest request,
			Map<String, Object> map, RedirectAttributes redirectAttributes) {

		order = orderService.removeDeletedOrderLines(order);

		OrderValidator orderValidator = new OrderValidator();
		orderValidator.validate(order, result);

		if (result.hasErrors()) {
			return "om/createOrder";
		} else {
			// TODO order prefix & status
			order.setPrefix("test");
			orderService.SetOrderStatus("create", order);
			orderService.createOrder(order);

			logger.info("order created");
			redirectAttributes.addFlashAttribute("message",
					"订单" + order.getPrefix() + order.getId() + "保存成功");
			return "redirect:viewOrder/" + order.getId();
		}
	}

	@RequestMapping(method = RequestMethod.GET, value = "/viewOrder/{orderID}")
	public String viewOrder(Map<String, Object> map, @PathVariable int orderID) {
		Order order = orderService.getOrder(orderID);
		map.put("order", order);
		return "om/viewOrder";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/viewOrders/{pageNum}")
	public String orderLists(Map<String, Object> map, @PathVariable int pageNum) {
//		OrderBrowseForm obf = new OrderBrowseForm();
//		obf.setOrders(orderService.getOrders());
//		map.put("obf", obf);
		PaginationSupport<Order> orderPage = orderService.getPageOrders(2, (pageNum - 1) * 2);
		map.put("orderPage", orderPage);
		return "om/viewOrders";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/reviewOrder/{orderID}/{lineNbr}")
	public String reviewOrder(Map<String, Object> map,
			@PathVariable int orderID, @PathVariable int lineNbr) {
		ReviewOrderForm rof = new ReviewOrderForm();

		rof.setOrder(orderService.getOrder(orderID));
		rof.setLine(orderService.getOrderLine(orderService.getOrder(orderID),
				orderID));

		map.put("rof", rof);

		return "om/reviewOrder";
	}

}
