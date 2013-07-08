package com.dms.common.dao;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;

import com.dms.common.BaseTest;
import com.dms.om.dao.OrderDAO;
import com.dms.om.model.Order;
import com.dms.om.model.PaginationSupport;

//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class OrderDAOTest extends BaseTest {

	@Autowired
	private WebApplicationContext wac;

	@Autowired
	private OrderDAO orderDao;

	@Before
	public void setUp() throws Exception {
		System.out.println("test");
	}

	@After
	public void tearDown() throws Exception {

	}

	@Test
	public void test() throws Exception {
		// PaginationSupport<Order> pg = orderDao.findPageByCriteria(null, 1,
		// 1);

		PaginationSupport<Order> pg = orderDao.findPageByQuery("from Order", 2,
				1);

		List<Order> orders = pg.getItems();

		for (Order order : orders) {
			System.out.println(order.getCustomer());
		}

		System.out.println("currentPage is :" + pg.getCurrentPage()
				+ "\npreviousIndex is : " + pg.getPreviousIndex()
				+ "\nnextIndex is:" + pg.getNextIndex()
				+ "\nstartIndex is:" + pg.getStartIndex()
				+ "\npagesize is:" + pg.getPageSize()
				+ "\ntotalCount is:" + pg.getTotalCount()
				+ "\nlastIndex is:" + pg.getLastIndex());

	}

}
