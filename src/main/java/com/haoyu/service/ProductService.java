package com.haoyu.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.haoyu.beans.PageQuery;
import com.haoyu.beans.PageResult;
import com.haoyu.dao.MesOrderMapper;
import com.haoyu.dao.MesProductCustomerMapper;
import com.haoyu.dao.MesProductMapper;
import com.haoyu.dao.MesStockMapper;
import com.haoyu.dto.ProductDto;
import com.haoyu.dto.SearchProductDto;
import com.haoyu.model.MesOrder;
import com.haoyu.model.MesProduct;
import com.haoyu.model.MesStock;
import com.haoyu.param.MesProductVo;
import com.haoyu.param.SearchProductParam;
import com.haoyu.util.BeanValidator;
import com.haoyu.util.UUIDUtil;

@Service
public class ProductService {

	@Resource
	private MesProductMapper mesProdcutMapper;
	@Resource
	private MesOrderMapper mesOrderMapper;
	@Resource
	private MesStockMapper stockMapper;
	@Resource
	private MesProductCustomerMapper mesProductCustomerMapper;

	@Resource
	private SqlSession sqlSession;

	// 批量增加材料
	public void insert(MesProductVo productVo) {
		// 校验
		BeanValidator.check(productVo);
		// 获取增加个数
		Integer counts = productVo.getCounts();
		if (counts != null && counts > 0) {
			for (int i = 0; i < counts; i++) {
				// 批量增加-productDto
				MesProduct pd = MesProduct.builder().productId(UUIDUtil.generateUUID())//
						.productTargetweight(productVo.getProductTargetweight())//
						.productRealweight(productVo.getProductRealweight())//
						.productLeftweight(productVo.getProductLeftweight())//
						.productBakweight(productVo.getProductLeftweight())//
						.productIrontype(productVo.getProductIrontype())//
						.productIrontypeweight(productVo.getProductIrontypeweight())//
						.productMaterialname(productVo.getProductMaterialname())//
						.productImgid(productVo.getProductImgid())//
						.productMaterialsource(productVo.getProductMaterialsource())//
						.productStatus(productVo.getProductStatus())//
						.productRemark(productVo.getProductRemark()).build();
				pd.setProductOperateIp("127.0.0.1");
				pd.setProductOperateTime(new Date());
				pd.setProductOperator("user01");
				MesProductMapper mapper = sqlSession.getMapper(MesProductMapper.class);
				// 批量增加
				mapper.insertSelective(pd);
			}
		}
	}

	// 到库分页
	public PageResult<ProductDto> searchPageList(SearchProductParam param, PageQuery page) {
		// 校验
		BeanValidator.check(page);
		// vo-dto
		SearchProductDto dto = new SearchProductDto();

		if (StringUtils.isNotBlank(param.getKeyword())) {
			dto.setKeyword("%" + param.getKeyword() + "%");
		}
		if (StringUtils.isNotBlank(param.getSearch_source())) {
			dto.setSearch_source(param.getSearch_source());
			;
		}
		if (param.getSearch_status() != null) {
			dto.setSearch_status(param.getSearch_status());
		}
		int count = mesProductCustomerMapper.countBySearchDto(dto);
		if (count > 0) {
			List<ProductDto> productList = mesProductCustomerMapper.getPageListBySearchDto(dto, page);
			return PageResult.<ProductDto>builder().total(count).data(productList).build();
		}

		return PageResult.<ProductDto>builder().build();
	}

	// 批量启动
	public void batchStart(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			MesProductMapper mapper = sqlSession.getMapper(MesProductMapper.class);
			String[] idStrs = ids.split("&");
			for (String id : idStrs) {
				MesProduct mesProduct = mapper.selectByPrimaryKey(Integer.parseInt(id));
				mesProduct.setProductStatus(1);
				mesProduct.setProductOperateTime(new Date());
				mapper.updateByPrimaryKeySelective(mesProduct);
				//生成待入库记录--原料库
				batchStockPre(Integer.parseInt(id),mapper);
			}
		}
	}
	//批量待入库操作-默认进入原料库
	private void batchStockPre(Integer id, MesProductMapper mapper) {
		if(id!=null) {
			//生成库存逻辑
			//增加操作
			MesProduct mesProduct = mapper.selectByPrimaryKey(id);
			//Order*
			if(mesProduct!=null) {
				MesStock mesStock=MesStock.builder().stockProductid(mesProduct.getId())//
						.stockImgid(mesProduct.getProductImgid())//
						.stockProductsource(mesProduct.getProductMaterialsource())//
						.stockStatus(1)//
						.stockStorageid(1).build();//1 代表原料库
				
				Integer orderid=mesProduct.getProductOrderid();
				if(orderid!=null) {
					MesOrder mesOrder=mesOrderMapper.selectByPrimaryKey(mesProduct.getProductOrderid());
					if(mesOrder!=null) {
						mesStock.setStockProductname(mesOrder.getOrderProductname());
						mesStock.setStockOrderid(orderid);
						mesStock.setStockOrdername(mesOrder.getOrderProductname());
					}
				}
				//mesStock.setStockProductname(product.getProductMaterialname());
				mesStock.setStockStoragestatus(1);//待入库
				stockMapper.insertSelective(mesStock);
			}
		}
	}

	public PageResult<ProductDto> searchPageBindList(SearchProductParam param, PageQuery page) {
		// 校验
		BeanValidator.check(page);
		// vo-dto
		SearchProductDto dto = new SearchProductDto();

		if (StringUtils.isNotBlank(param.getKeyword())) {
			dto.setKeyword("%" + param.getKeyword() + "%");
		}
		
		if (StringUtils.isNotBlank(param.getSearch_source())) {
			dto.setSearch_source(param.getSearch_source());
		}
		
		if (param.getSearch_status() != null) {
			dto.setSearch_status(param.getSearch_status());
		}

		int count = mesProductCustomerMapper.countBySearchBindListDto(dto);

		if (count > 0) {
			List<ProductDto> productList = mesProductCustomerMapper.getPageListBySearchBindListDto(dto, page);
			return PageResult.<ProductDto>builder().total(count).data(productList).build();
		}

		return PageResult.<ProductDto>builder().build();
	}

	public MesProduct selectById(String id) {
		if (StringUtils.isNotBlank(id) && StringUtils.isNotEmpty(id)) {
			MesProduct product = mesProdcutMapper.selectByPrimaryKey(Integer.parseInt(id));
			if (null != product) {
				return product;
			}
		}
		throw new RuntimeException("没有这个材料");
	}

	// 钢材绑定子材料分页显示
	public PageResult<ProductDto> searchPageChildBindList(SearchProductParam param, PageQuery page) {
		// 校验
		BeanValidator.check(page);
		// vo-dto
		SearchProductDto dto = new SearchProductDto();
		if (StringUtils.isNotBlank(param.getSearch_source())) {
			dto.setSearch_source(param.getSearch_source());
		}
		int count = mesProductCustomerMapper.countBySearchChildBindListDto(dto);

		if (count > 0) {
			List<ProductDto> productList = mesProductCustomerMapper.getPageListBySearchChildBindListDto(dto, page);
			return PageResult.<ProductDto>builder().total(count).data(productList).build();
		}

		return PageResult.<ProductDto>builder().build();
	}

	public void update(MesProductVo productVo) {
		// 校验
		BeanValidator.check(productVo);
		
		MesProduct product=mesProdcutMapper.selectByPrimaryKey(productVo.getId());
		product.setProductImgid(productVo.getProductImgid());
		product.setProductIrontype(productVo.getProductIrontype());
		product.setProductIrontypeweight(productVo.getProductIrontypeweight());
		product.setProductMaterialname(productVo.getProductMaterialname());
		product.setProductTargetweight(productVo.getProductTargetweight());
		product.setProductMaterialsource(productVo.getProductMaterialsource());
		product.setProductRemark(productVo.getProductRemark());
		product.setProductRealweight(productVo.getProductRealweight());
		
		float temp=product.getProductLeftweight()-product.getProductBakweight();
		float leftweight=product.getProductLeftweight();
		
		product.setProductLeftweight(productVo.getProductLeftweight());
		//剩余重量备份需要重新设置
		product.setProductBakweight(product.getProductLeftweight()-temp);
		
		if(leftweight>=temp)
		mesProdcutMapper.updateByPrimaryKeySelective(product);
	}
	//钢材绑定钢锭的逻辑
	public void bind(String parentId, String childId) {
		Integer pid=Integer.parseInt(parentId);
		Integer cid=Integer.parseInt(childId);
		
		MesProduct parent=mesProdcutMapper.selectByPrimaryKey(pid);
		MesProduct child=mesProdcutMapper.selectByPrimaryKey(cid);
		
		//钢材的理论剩余和真实剩余比钢锭的工艺重量大或等
		//后台的健壮性判断，防止页面js效果失效
		if(parent.getProductLeftweight()>=parent.getProductBakweight()&&parent.getProductBakweight()>=child.getProductTargetweight()) {
			//计算钢材的剩余理论重量剩余值
			parent.setProductBakweight(parent.getProductBakweight()-child.getProductTargetweight());
			//计算钢锭的理论重量剩余值，修改status为真，绑定pid
			child.setpId(pid);
			child.setProductBakweight(child.getProductTargetweight());
			child.setProductStatus(1);
			//更新parent与child  钢材 与 钢锭
			mesProdcutMapper.updateByPrimaryKeySelective(parent);
			mesProdcutMapper.updateByPrimaryKeySelective(child);
		}
	}
	//钢材绑定的钢锭列表
	public PageResult<ProductDto> searchPageParentBindList(SearchProductParam param, PageQuery page) {
		// 校验
		BeanValidator.check(page);
		// vo-dto
		SearchProductDto dto = new SearchProductDto();
		if (StringUtils.isNotBlank(param.getSearch_source())) {
			dto.setSearch_source(param.getSearch_source());
		}
		if(param.getPid()!=null) {
			dto.setPid(param.getPid());
		}
		int count = mesProductCustomerMapper.countBySearchParentBindListDto(dto);

		if (count > 0) {
			List<ProductDto> productList = mesProductCustomerMapper.getPageListBySearchParentBindListDto(dto, page);
			return PageResult.<ProductDto>builder().total(count).data(productList).build();
		}

		return PageResult.<ProductDto>builder().build();
	}
	//钢材解绑钢锭
	public boolean unbound(String childId) {
		if(StringUtils.isNoneBlank(childId)&&StringUtils.isNotEmpty(childId)) {
			Integer cid=Integer.parseInt(childId);
			MesProduct product=mesProdcutMapper.selectByPrimaryKey(cid);
			//status-0
			product.setProductStatus(0);
			//backweight-0
			product.setProductBakweight(0f);
			//pid-null
			Integer pid=product.getpId();
			product.setpId(null);
			MesProduct parent=mesProdcutMapper.selectByPrimaryKey(pid);
			parent.setProductBakweight(parent.getProductBakweight()+product.getProductTargetweight());
			//执行绑定双方修改
			mesProdcutMapper.updateByPrimaryKey(product);
			mesProdcutMapper.updateByPrimaryKeySelective(parent);
		}
		return false;
	}

}
