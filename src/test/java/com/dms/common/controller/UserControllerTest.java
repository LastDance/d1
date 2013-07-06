package com.dms.common.controller;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultMatcher;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebAppConfiguration
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/dms-servlet.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class UserControllerTest {

	@Autowired
	private WebApplicationContext wac;

	@Autowired
	private UserController userController;// 你要测试的Controller

	private MockMvc mockMvc;

	@Autowired
	MockHttpServletRequest request;

	@Before
	public void setUp() throws Exception {
		mockMvc = MockMvcBuilders.standaloneSetup(userController).build();
	}

	@After
	public void tearDown() throws Exception {

	}

	@Test
	public void test() throws Exception {
		MockHttpServletRequest request = new MockHttpServletRequest();
		request.setServletPath("/userManager/user.show");
		request.addParameter("name", "张三");
		request.addParameter("password", "123456");
		request.setMethod("post");
		request.setAttribute("msg", "测试action成功");
		mockMvc.perform(post("/login")
				.accept(MediaType.APPLICATION_JSON).param("username", "admin")
				.param("password", "admin"));
	}

}
