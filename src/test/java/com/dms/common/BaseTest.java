package com.dms.common;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/dms-servlet.xml"})
public class BaseTest extends AbstractTransactionalJUnit4SpringContextTests {

	@Resource
    protected SessionFactory sessionFactory;
	
}
