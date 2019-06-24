package com.haoyu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haoyu.beans.PageQuery;
import com.haoyu.beans.PageResult;
import com.haoyu.common.JsonData;
import com.haoyu.model.MesStep;
import com.haoyu.param.MesStepVo;
import com.haoyu.service.MesStepService;

@Controller
@RequestMapping("/step")
public class MesStepController {

	private static String FPATH="step/";
	
	@Resource
	private  MesStepService stepService;
	
	//工序页面跳转
	@RequestMapping("/step.page")
	public String stepPage() {
		return FPATH+"step";
	}
	//工序插入
	@RequestMapping("/insert.json")
	@ResponseBody
	public JsonData insertAjax(MesStepVo stepVo) {
		stepService.insert(stepVo);
		return JsonData.success(true);
	}
	//工序修改
	@RequestMapping("/update.json")
	@ResponseBody
	public JsonData udpateAjax(MesStepVo stepVo) {
		stepService.update(stepVo);
		return JsonData.success(true);
	}
	//工序分页
	@RequestMapping("/step.json")
	@ResponseBody
    public JsonData searchPage(PageQuery page) {
    	PageResult<MesStep> pr=(PageResult<MesStep>) stepService.searchPageList(page);
    	return JsonData.success(pr);
    }
	//所有工序列表
	@RequestMapping("/stepall.json")
	@ResponseBody
	public JsonData stepAllAjax() {
		List<MesStep> steps=stepService.stepsAll();
		return JsonData.success(steps);
	}
}
