package com.haoyu.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.haoyu.beans.PageQuery;
import com.haoyu.beans.PageResult;
import com.haoyu.dao.UserTestMapper;
import com.haoyu.model.MesOrder;
import com.haoyu.model.UserTest;
import com.haoyu.param.MesOrderVo;
import com.haoyu.param.SearchOrderParam;
import com.haoyu.service.OrderService;
import com.haoyu.util.MyStringUtils;

public class UTest {
	private static ApplicationContext bean=new ClassPathXmlApplicationContext("spring\\applicationContext.xml");
	private static OrderService orderService;
	private static UserTestMapper userTestMapper;
	
	@Test
	public void testTestMapper() {
		userTestMapper=bean.getBean(UserTestMapper.class);
		UserTest user=new UserTest();
		user.setName("username01");
		user.setParentid(1);
		userTestMapper.insertSelective(user);
	}
	
	@Test
	public void testGetOrderListByDto() {
		orderService=(OrderService) bean.getBean(OrderService.class);
		SearchOrderParam param=SearchOrderParam.builder().fromTime("2018-09-09").build();
		PageQuery page=new PageQuery();
		page.setPageNo(1);
		page.setPageSize(3);
		PageResult<MesOrder> pr= (PageResult<MesOrder>) orderService.searchPageList(param, page);
		for(MesOrder mesOrder:pr.getData()) {
		}
	}
	
	@Test
	public void testGetOrderCount() {
		orderService=(OrderService) bean.getBean(OrderService.class);
		List<String> lists=orderService.createOrderIdsDefault(3L);
		System.out.println(lists);
	}
	
	@Test
	public void testAddOrder() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String strDate=sdf.format(new Date());
	
		orderService=(OrderService) bean.getBean(OrderService.class);
		
		MesOrderVo orderVo=new MesOrderVo();
		
		orderService.addOrder(orderVo);
	}
	
}	
