package com.haoyu.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.haoyu.beans.PageQuery;
import com.haoyu.beans.PageResult;
import com.haoyu.dao.MesChistoryMapper;
import com.haoyu.dao.MesStepMapper;
import com.haoyu.dto.ProductDto;
import com.haoyu.model.MesChistory;
import com.haoyu.model.MesOrder;
import com.haoyu.model.MesStep;
import com.haoyu.param.SearchOrderParam;
import com.haoyu.param.SearchProductParam;
import com.haoyu.service.OrderService;
import com.haoyu.service.ProductService;

public class ServiceTest {
	private static ApplicationContext bean=new ClassPathXmlApplicationContext("spring\\applicationContext.xml");
	private static OrderService orderService;
	private static ProductService productService;
	private static MesChistoryMapper cmapper;
	
	@Test
	public void stepMapperTest()throws Exception{
		cmapper=bean.getBean(MesChistoryMapper.class);
		MesChistory mc=cmapper.selectByPrimaryKey(1);
		System.out.println(mc);
	}
	
	@Test
	public void planServiceTest() throws Exception{
		productService=bean.getBean(ProductService.class);
		SearchProductParam spp=new SearchProductParam();
		spp.setKeyword("");
		spp.setSearch_source("钢材");
		PageQuery pq=new PageQuery();
		pq.setPageNo(1);
		pq.setPageSize(10);
		PageResult<ProductDto>  pr=productService.searchPageList(spp,pq);
		for(ProductDto pd:pr.getData()) {
			System.out.println(pd);
		}
	}
	
	@Test
	public void testBatchUpdate() {
		orderService=(OrderService) bean.getBean(OrderService.class);
		System.out.println(orderService);
//		String ids="75&76";
//		orderService.batchStart(ids);
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
//			System.out.println(MyStringUtils.date2String(mesOrder.getCommitTime(),null));
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
		
//		MesOrderVo orderVo=new MesOrderVo();
//		orderVo.setOid("zx1900003");
//		orderVo.setClientname("c01");
//		orderVo.setProductname("p01");
//		orderVo.setContractid("c01");
//		orderVo.setImgid("im01");
//		orderVo.setMaterialname("mn01");
//		orderVo.setComeTime(strDate);
//		orderVo.setCommitTime(strDate);
//		orderVo.setIsinventory(1);
//		orderVo.setIsout("1");
//		orderVo.setMsource("m01");
//		orderVo.setIshurry(1);
//		orderVo.setStatus(1);
//		orderVo.setRemark("累死老子了");
//		orderService.addOrder(orderVo);
	}
	
}	
