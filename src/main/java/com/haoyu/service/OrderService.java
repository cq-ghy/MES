package com.haoyu.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.google.common.base.Preconditions;
import com.haoyu.beans.PageQuery;
import com.haoyu.beans.PageResult;
import com.haoyu.dao.MesOrderCustomerMapper;
import com.haoyu.dao.MesOrderMapper;
import com.haoyu.dto.SearchOrderDto;
import com.haoyu.exception.ParamException;
import com.haoyu.exception.SysMineException;
import com.haoyu.model.MesOrder;
import com.haoyu.param.MesOrderVo;
import com.haoyu.param.SearchOrderParam;
import com.haoyu.util.BeanValidator;
import com.haoyu.util.MyStringUtils;

@Service
public class OrderService {
	@Resource
	private MesOrderMapper mesOrderMapper;
	@Resource
	private MesOrderCustomerMapper mesOrderCustomerMapper;
	@Resource
	private SqlSession sqlSession;
	@Resource
	private PlanService planService;

	// 一开始就定义一个id生成器
	private IdGenerator ig = new IdGenerator();

	public void batchStart(String ids) {
		// 144&143--order(id)
		if (ids != null && ids.length() > 0) {
			// 批量处理的sqlSession代理
			String[] idArray = ids.split("&");
			mesOrderCustomerMapper.batchStart(idArray);
			// 批量启动待执行计划
			planService.startPlansByOrderIds(idArray);
		}
	}

	// 修改数据
	public void update(MesOrderVo mesOrderVo) {
		BeanValidator.check(mesOrderVo);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		MesOrder before = mesOrderMapper.selectByPrimaryKey(mesOrderVo.getId());
		Preconditions.checkNotNull(before, "待更新的材料不存在");
		try {
			MesOrder after = MesOrder.builder().id(mesOrderVo.getId())
					.orderClientname(mesOrderVo.getOrderClientname())//
					.orderProductname(mesOrderVo.getOrderProductname()).orderContractid(mesOrderVo.getOrderContractid())//
					.orderImgid(mesOrderVo.getOrderImgid()).orderMaterialname(mesOrderVo.getOrderMaterialname())
					.orderCometime(MyStringUtils.string2Date(mesOrderVo.getComeTime(), null))//
					.orderCommittime(MyStringUtils.string2Date(mesOrderVo.getCommitTime(), null))
					.orderInventorystatus(mesOrderVo.getOrderInventorystatus()).orderStatus(mesOrderVo.getOrderStatus())//
					.orderMaterialsource(mesOrderVo.getOrderMaterialsource())
					.orderHurrystatus(mesOrderVo.getOrderHurrystatus()).orderStatus(mesOrderVo.getOrderStatus())
					.orderRemark(mesOrderVo.getOrderRemark()).build();

			// 设置用户的登录信息
			// TODO
			after.setOrderOperator("tom");
			after.setOrderOperateIp("127.0.0.1");
			after.setOrderOperateTime(new Date());
			mesOrderMapper.updateByPrimaryKeySelective(after);
		} catch (Exception e) {
			throw new SysMineException("更改过程有问题");
		}
	}

	// 增加单个用户
	// public void addOrder(MesOrder mesOrder) 这里直接传入mesOrder是有问题的，
	// 问题是controller调用service，controller能拿到的数据模型只能是vo，所以controller传给service
	// 的数据模型一定是vo类型
	public void addOrder(MesOrderVo mesOrderVo) {
		// 判断一下mesOrder的值是否正确
		// 后台的数据校验 BeanValidator
		BeanValidator.check(mesOrderVo);// beanvalidator是什么，怎么用
		try {
			// 将vo转换为po
			MesOrder mesOrder = MesOrder.builder().orderId(mesOrderVo.getOrderId())
					.orderClientname(mesOrderVo.getOrderClientname())//
					.orderProductname(mesOrderVo.getOrderProductname()).orderContractid(mesOrderVo.getOrderContractid())//
					.orderImgid(mesOrderVo.getOrderImgid()).orderMaterialname(mesOrderVo.getOrderMaterialname())
					.orderCometime(MyStringUtils.string2Date(mesOrderVo.getComeTime(), null))//
					.orderCommittime(MyStringUtils.string2Date(mesOrderVo.getCommitTime(), null))
					.orderInventorystatus(mesOrderVo.getOrderInventorystatus()).orderStatus(mesOrderVo.getOrderStatus())//
					.orderMaterialsource(mesOrderVo.getOrderMaterialsource())
					.orderHurrystatus(mesOrderVo.getOrderHurrystatus()).orderStatus(mesOrderVo.getOrderStatus())
					.orderRemark(mesOrderVo.getOrderRemark()).build();

			// 设置用户的登录信息
			// TODO
			mesOrder.setOrderOperator("tom");
			mesOrder.setOrderOperateIp("127.0.0.1");
			mesOrder.setOrderOperateTime(new Date());
			mesOrderMapper.insertSelective(mesOrder);
			// mesOrderCustomerMapper.addOrder(mesOrder);//数据层交互的数据类型又是po，传入vo是不对的
		} catch (Exception e) {
			throw new SysMineException(e + "添加单个订单出了问题");
		}
	}

	public void orderBatchInserts(MesOrderVo mesOrderVo) {
		// 数据校验
		BeanValidator.check(mesOrderVo);
		// 先去判断是否是批量添加
		Integer counts = mesOrderVo.getCount();
		// 根据counts的个数，生成需要添加的ids的数据集合
		// zx180001 zx180002
		List<String> ids = createOrderIdsDefault(Long.valueOf(counts));
		// sql的批量添加处理
		MesOrderMapper mesOrderBatchMapper = sqlSession.getMapper(MesOrderMapper.class);
		for (String orderid : ids) {
			try {
				// 将vo转换为po
				MesOrder mesOrder = MesOrder.builder().orderId(orderid)
						.orderClientname(mesOrderVo.getOrderClientname())//
						.orderProductname(mesOrderVo.getOrderProductname()).orderContractid(mesOrderVo.getOrderContractid())//
						.orderImgid(mesOrderVo.getOrderImgid()).orderMaterialname(mesOrderVo.getOrderMaterialname())
						.orderCometime(MyStringUtils.string2Date(mesOrderVo.getComeTime(), null))//
						.orderCommittime(MyStringUtils.string2Date(mesOrderVo.getCommitTime(), null))
						.orderInventorystatus(mesOrderVo.getOrderInventorystatus()).orderStatus(mesOrderVo.getOrderStatus())//
						.orderMaterialsource(mesOrderVo.getOrderMaterialsource())
						.orderHurrystatus(mesOrderVo.getOrderHurrystatus()).orderStatus(mesOrderVo.getOrderStatus())
						.orderRemark(mesOrderVo.getOrderRemark()).build();

				// 设置用户的登录信息
				// TODO
				mesOrder.setOrderOperator("tom");
				mesOrder.setOrderOperateIp("127.0.0.1");
				mesOrder.setOrderOperateTime(new Date());
				// 批量添加未启动订单
				if (mesOrder.getOrderStatus() == 1) {
					planService.prePlan(mesOrder);
				}
				mesOrderBatchMapper.insertSelective(mesOrder);
			} catch (Exception e) {
				throw new SysMineException("创建过程有问题");
			}
		}
	}

	// 获取数据库所有的数量
	public Long getOrderCount() {
		return mesOrderCustomerMapper.getOrderCount();
	}

	// 获取id集合
	public List<String> createOrderIdsDefault(Long ocounts) {
		if (ig == null) {
			ig = new IdGenerator();
		}

		ig.setCurrentdbidscount(getOrderCount());
		List<String> list = ig.initIds(ocounts);
		ig.clear();
		return list;
	}

	// bean:自定义的类，功能适用范围最广
	// domain-javabean-pojo-po--就是表翻译过来的java类
	// vo-param poVo xxParam page SearchOrderParam..
	// dto 用于自定义的与数据层交互的类 SearchOrderDto
	// SearchOrderParam--SearchOrderVo

	public Object searchPageList(SearchOrderParam param, PageQuery page) {
		// 验证页码是否为空
		BeanValidator.check(page);
		// 将param中的字段传入dto进行数据层的交互
		// 自定义的数据模型，用来与数据库进行交互操作
		// searchDto 用于分页的where语句后面
		SearchOrderDto dto = new SearchOrderDto();
		// copyparam中的值进入dto
		if (StringUtils.isNotBlank(param.getKeyword())) {
			dto.setKeyword("%" + param.getKeyword() + "%");
		}
		if (StringUtils.isNotBlank(param.getSearch_status())) {
			dto.setSearch_status(Integer.parseInt(param.getSearch_status()));
		}
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			if (StringUtils.isNotBlank(param.getFromTime())) {
				dto.setFromTime(dateFormat.parse(param.getFromTime()));
			}
			if (StringUtils.isNotBlank(param.getToTime())) {
				dto.setToTime(dateFormat.parse(param.getToTime()));
			}
		} catch (Exception e) {
			throw new ParamException("传入的日期格式有问题，正确格式为：yyyy-MM-dd");
		}

		int count = mesOrderCustomerMapper.countBySearchDto(dto);
		if (count > 0) {
			List<MesOrder> orderList = mesOrderCustomerMapper.getPageListBySearchDto(dto, page);
			return PageResult.<MesOrder>builder().total(count).data(orderList).build();
		}

		return PageResult.<MesOrder>builder().build();
	}

	///////////////////////////////////////////////////////////////////////////////////////////////
	// 1 默认生成代码
	// 2 手工生成代码
	// id生成器
	class IdGenerator {
		// 数量起始位置
		private Long currentdbidscount;
		private List<String> ids = new ArrayList<String>();
		private String idpre;
		private String yearstr;
		private String idafter;

		public IdGenerator() {
		}

		public Long getCurrentdbidscount() {
			return currentdbidscount;
		}

		public void setCurrentdbidscount(Long currentdbidscount) {
			this.currentdbidscount = currentdbidscount;
			if (null == this.ids) {
				this.ids = new ArrayList<String>();
			}
		}

		public List<String> getIds() {
			return ids;
		}

		public void setIds(List<String> ids) {
			this.ids = ids;
		}

		public String getIdpre() {
			return idpre;
		}

		public void setIdpre(String idpre) {
			this.idpre = idpre;
		}

		public String getYearstr() {
			return yearstr;
		}

		public void setYearstr(String yearstr) {
			this.yearstr = yearstr;
		}

		public String getIdafter() {
			return idafter;
		}

		public void setIdafter(String idafter) {
			this.idafter = idafter;
		}

		public List<String> initIds(Long ocounts) {
			for (int i = 0; i < ocounts; i++) {
				this.ids.add(getIdPre() + yearStr() + getIdAfter(i));
			}
			return this.ids;
		}

		//
		private String getIdAfter(int addcount) {
			// 系统默认生成5位 ZX1700001
			int goallength = 5;
			// 获取数据库order的总数量+1+循环次数(addcount)
			int count = this.currentdbidscount.intValue() + 1 + addcount;
			StringBuilder sBuilder = new StringBuilder("");
			// 计算与5位数的差值
			int length = goallength - new String(count + "").length();
			for (int i = 0; i < length; i++) {
				sBuilder.append("0");
			}
			sBuilder.append(count + "");
			return sBuilder.toString();
		}

		private String getIdPre() {
			// idpre==null?this.idpre="ZX":this.idpre=idpre;
			this.idpre = "ZX";
			return this.idpre;
		}

		private String yearStr() {
			Date currentdate = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String yearstr = sdf.format(currentdate).substring(2, 4);
			return yearstr;
		}

		public void clear() {
			this.ids = null;
		}

		@Override
		public String toString() {
			return "IdGenerator [ids=" + ids + "]";
		}
	}

}
