package pnunu.ssm.test;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pnunu.ssm.service.impl.ResourceServiceImpl;

public class SpringTest {

	private ApplicationContext ac = new ClassPathXmlApplicationContext("spring-core.xml");

	// 测试SessionFactory
	@Test
	public void testSessionFactory() throws Exception {
		SqlSessionFactory sessionFactory = (SqlSessionFactory) ac.getBean("sessionFactory");
		ResourceServiceImpl resourceService = (ResourceServiceImpl) ac.getBean("resourceService");
		System.out.println(sessionFactory);
		System.out.println(resourceService);
	}
	
	// 测试SessionFactory
	@Test
	public void testDataSource() throws Exception {
	}
}
