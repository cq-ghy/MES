package com.haoyu.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haoyu.beans.PageQuery;
import com.haoyu.beans.PageResult;
import com.haoyu.common.JsonData;
import com.haoyu.common.SameUrlData;
import com.haoyu.dto.ProductDto;
import com.haoyu.model.MesProduct;
import com.haoyu.param.MesProductVo;
import com.haoyu.param.SearchProductParam;
import com.haoyu.service.ProductService;

@Controller
@RequestMapping("/product")
public class MesProductController {

	private static String FPATH="product";
	
	@Resource
	private ProductService productService;
	
	//增加材料页面
	@RequestMapping("/productinsert.page")
	public String productInsertPage() {
		return FPATH+"/productinsert";
	}
	
	//增加材料功能
	@RequestMapping("/insert.json")
	@SameUrlData//防止重复提交
	public String insert(MesProductVo productVo) {
		productService.insert(productVo);
		return FPATH+"/product";
	}
	
	//增加材料功能
	@RequestMapping("/update.json")
	@ResponseBody
	public JsonData update(MesProductVo productVo) {
		productService.update(productVo);
		return JsonData.success(true);
	}
	
	//材料管理页面
	@RequestMapping("/product.page")
	public String productList() {
		return FPATH+"/product";
	}
	
	//材料到库管理分页页面
	@RequestMapping("/product.json")
	@ResponseBody
    public JsonData searchPage(SearchProductParam param, PageQuery page) {
    	PageResult<ProductDto> pr=(PageResult<ProductDto>) productService.searchPageList(param, page);
    	return JsonData.success(pr);
    }
	
	//材料批量启动
	@RequestMapping("/productBatchStart.json")
    public String productBatchStart(String ids) {
		productService.batchStart(ids);
		return FPATH+"/product";
    }
	
	//材料到库管理
	@RequestMapping("/productCome.page")
	public String productComePage() {
		return FPATH+"/productCome";
	}
	
	//钢锭查询
	@RequestMapping("/productIron.page")
	public String productIronList() {
		return FPATH+"/productIron";
	}
	
	//绑定状态列表
	@RequestMapping("/productBindList.page")
	public String productBindList() {
		return FPATH+"/productBindList";
	}
	
	//绑定钢材分页显示
	@RequestMapping("/productBindList.json")
	@ResponseBody
    public JsonData searchBindListPage(SearchProductParam param, PageQuery page) {
    	PageResult<ProductDto> pr=(PageResult<ProductDto>) productService.searchPageBindList(param, page);
    	return JsonData.success(pr);
    }
	//待绑定钢材的页面跳转
	@RequestMapping("/productBind.page")
	public String productBindPage(String id,Model model) {
		//通过id拿到product的对象
		MesProduct mesProduct=productService.selectById(id);
		if(mesProduct!=null) {
			model.addAttribute("product",mesProduct);
			return FPATH+"/productBind";
		}else {
			return FPATH+"/productBindList";
		}
	}
	
	//绑定材料分页显示
	@RequestMapping("/productChildBindList.json")
	@ResponseBody
    public JsonData searchChildBindListPage(SearchProductParam param, PageQuery page) {
    	PageResult<ProductDto> pr=(PageResult<ProductDto>) productService.searchPageChildBindList(param, page);
    	return JsonData.success(pr);
    }
	
	//绑定逻辑
	@RequestMapping("/bind.json")
	@ResponseBody
    public JsonData bind(String parentId,String childId) {
		productService.bind(parentId,childId);
    	return JsonData.success(true);
    }
	//查看钢材已绑定的钢锭
	@RequestMapping("/productParentBindList.json")
	@ResponseBody
    public JsonData searchParentBindListPage(SearchProductParam param, PageQuery page) {
    	PageResult<ProductDto> pr=(PageResult<ProductDto>) productService.searchPageParentBindList(param, page);
    	return JsonData.success(pr);
    }
	//钢材解绑钢锭
	@RequestMapping("/parentUnbound.json")
	@ResponseBody
    public JsonData unbound(String childId) {
    	boolean result=productService.unbound(childId);
    	return JsonData.success(result);
    }
}