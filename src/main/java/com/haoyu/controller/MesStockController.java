package com.haoyu.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haoyu.beans.PageQuery;
import com.haoyu.beans.PageResult;
import com.haoyu.common.JsonData;
import com.haoyu.dto.ProductDto;
import com.haoyu.dto.StockDto;
import com.haoyu.param.MesStockVo;
import com.haoyu.param.SearchProductParam;
import com.haoyu.param.SearchStockParam;
import com.haoyu.service.StockService;

@Controller
@RequestMapping("/stock")
public class MesStockController {
	//设置基本参数
	private static String FPATH="stock/";
	
	@Resource
	private StockService stockService;
    
	//库存信息增加
	@RequestMapping("/insert.page")
	public String insertPage() {
		return FPATH+"stockinsert";
	}
	
    //原料库房页面跳转
    @RequestMapping("/sourceroom.page")
    public String sourceRoomPage() {
    	return FPATH+"sourceroom";
    }
    //锻造车间
    @RequestMapping("/dzroom.page")
    public String dzRoomPage() {
    	return FPATH+"dzroom";
    }
    //半成品库
    @RequestMapping("/halfroom.page")
    public String halfRoomPage() {
    	return FPATH+"halfroom";
    }
    //热处理车间
    @RequestMapping("/hotroom.page")
    public String hotRoomPage() {
    	return FPATH+"hotroom";
    }
    //机加车间
    @RequestMapping("/jjroom.page")
    public String jjRoomPage() {
    	return FPATH+"jjroom";
    }
    //成品库
    @RequestMapping("/productroom.page")
    public String productRoomPage() {
    	return FPATH+"productroom";
    }
    //废料库
    @RequestMapping("/wasteroom.page")
    public String wasteRoomPage() {
    	return FPATH+"wasteroom";
    }
    //库存信息录入
    @RequestMapping("/insert.json")
    public String insert(MesStockVo stockVo) {
    	stockService.insert(stockVo);
    	return FPATH+"stockinsert";
    }
    
	//库存分页页面
	@RequestMapping("/stock.json")
	@ResponseBody
    public JsonData searchPage(SearchStockParam param, PageQuery page) {
    	PageResult<StockDto> pr=(PageResult<StockDto>) stockService.searchPageList(param, page);
    	return JsonData.success(pr);
    }
    //批量入库  batchCheck.json
	@RequestMapping("/batchCheck.json")
	@ResponseBody
    public JsonData batchCheck(String ids,String stockCheck) {
		stockService.batchCheck(ids,stockCheck);
    	return JsonData.success(true);
    }
	
	@RequestMapping("/batchOut.json")
	@ResponseBody
    public JsonData batchOut(String ids,String stockOutObj,String stockOutRemark) {
		stockService.batchOut(ids,stockOutObj,stockOutRemark);
    	return JsonData.success(true);
    }
	
}