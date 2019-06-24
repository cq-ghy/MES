package com.haoyu.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haoyu.beans.PageQuery;
import com.haoyu.beans.PageResult;
import com.haoyu.common.JsonData;
import com.haoyu.model.MesOrder;
import com.haoyu.model.MesStorage;
import com.haoyu.param.MesStorageVo;
import com.haoyu.param.SearchOrderParam;
import com.haoyu.service.StorageService;

@Controller
@RequestMapping("/storage")
public class MesStorageController {
	//设置基本参数
	private static String FPATH="storage/";
	private static String RESULT="storage";
	//设置service
	@Resource
	private StorageService storageService;
	
	//页面跳转
	@RequestMapping("/storage.page")
	public String storagePage() {
		return FPATH+RESULT;
	}
	//添加库房
	//添加接收json数据的注解
	@ResponseBody
	@RequestMapping("/insert.json")
	public JsonData insertAjax(MesStorageVo mesStorageVo) {
		storageService.insert(mesStorageVo);
		return JsonData.success();
	}
	//更新库房维护信息
	@ResponseBody
	@RequestMapping("/update.json")
	public JsonData updateAjax(MesStorageVo mesStorageVo) {
		storageService.update(mesStorageVo);
		return JsonData.success();
	}
	
	//显示库房列表
    @RequestMapping("/storage.json")
    @ResponseBody
    public JsonData searchPage(PageQuery page) {
    	PageResult<MesStorage> pr=(PageResult<MesStorage>) storageService.searchPageList(page);
    	return JsonData.success(pr);
    }
}