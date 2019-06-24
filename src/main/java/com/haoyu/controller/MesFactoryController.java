package com.haoyu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.haoyu.beans.PageQuery;
import com.haoyu.beans.PageResult;
import com.haoyu.common.JsonData;
import com.haoyu.dto.FactoryDto;
import com.haoyu.model.MesChistory;
import com.haoyu.model.MesFhistory;
import com.haoyu.param.SearchFactoryParam;
import com.haoyu.service.FactorySerivce;

@Controller
@RequestMapping("/factory")
public class MesFactoryController {

	private static String FPATH="factory/";
	
	@Resource
	private FactorySerivce factoryService;
	//锻造车间转跳
	@RequestMapping("/dzfactory.page")
	public String dzFactoryPage() {
		return FPATH+"dzfactory";
	}
	//热处理车间跳转
	@RequestMapping("/hotfactory.page")
	public String hotFactoryPage() {
		return FPATH+"hotfactory";
	}
	//机加车间转跳
	@RequestMapping("/jjfactory.page")
	public String jjFactoryPage() {
		return FPATH+"jjfactory";
	}
	//质检过程跳转
	@RequestMapping("/check.page")
	public String checkPage() {
		return FPATH+"/check";
	}
	//生产过程分页
    @RequestMapping("/factory.json")
    @ResponseBody
    public JsonData searchPage(SearchFactoryParam param, PageQuery page) {
    	PageResult<FactoryDto> pr=(PageResult<FactoryDto>) factoryService.searchPageList(param, page);
    	return JsonData.success(pr);
    }
	//质检详细页跳转
    @RequestMapping("/factoryCheckInfo.page")
    public ModelAndView factoryCheckInfoPage(SearchFactoryParam param, PageQuery page,String id,ModelAndView model) {
    	model.addObject("searchParam",param);
    	model.addObject("page",page);
    	model.addObject("id",id);
    	FactoryDto dto=factoryService.selectFactoryDtoById(id);
    	model.addObject("dto",dto);
    	model.setViewName(FPATH+"factorycheckinfo");
    	return model;
    }    
	//生产详细页跳转
    @RequestMapping("/factoryInfo.page")
    public ModelAndView factoryInfoPage(SearchFactoryParam param, PageQuery page,String id,ModelAndView model) {
    	model.addObject("searchParam",param);
    	model.addObject("page",page);
    	model.addObject("id",id);
    	FactoryDto dto=factoryService.selectFactoryDtoById(id);
    	model.addObject("dto",dto);
    	model.setViewName(FPATH+"factoryinfo");
    	return model;
    }
    //生产工序派工
    @RequestMapping("/step_start.json")
    public ModelAndView stepStart(String id,String step,String fhistoryRemark,String submit,SearchFactoryParam param, PageQuery page,ModelAndView model) {
    	//TODO  service
    	if(submit.equals("工序派工")) {
    		factoryService.stepStart(id,step,fhistoryRemark);
    	}else {
    		//待质检
    		factoryService.preCheck(id);
    	}
    	
       	model.addObject("searchParam",param);
    	model.addObject("page",page);
    	model.addObject("id",id);
    	FactoryDto dto=factoryService.selectFactoryDtoById(id);
    	model.addObject("dto",dto);
    	model.setViewName(FPATH+"factoryinfo");
    	return model;
    }
    
    //生产记录细节
    @RequestMapping("/fhistorys.json")
    @ResponseBody
    public JsonData fhistorysInfo(String id) {
    	List<MesFhistory> mfh=factoryService.fhistorysInfoById(id);
    	return JsonData.success(mfh);
    }
    //质检记录细节
    @RequestMapping("/chistory.json")
    @ResponseBody
    public JsonData chistorysInfo(String id) {
    	List<MesChistory> mch=factoryService.chistorysInfoById(id);
    	return JsonData.success(mch);
    }
    //质检过程
    @RequestMapping("/step_check.json")
    public ModelAndView stepCheck(String id,String storageid1,String chistoryRemark,String chistoryStep,String checkgoal,String checkresult,SearchFactoryParam param, PageQuery page,ModelAndView model) {
    	//TODO  service
    	if(checkresult.equals("通过")) {
    		factoryService.stepCheck(id,chistoryStep,checkgoal,checkresult,chistoryRemark);
    	}else if(checkresult.equals("需返工")) {
    		factoryService.stepCheck(id,storageid1,chistoryStep, checkgoal, checkresult, chistoryRemark);
    	}
    	
       	model.addObject("searchParam",param);
    	model.addObject("page",page);
    	model.addObject("id",id);
    	FactoryDto dto=factoryService.selectFactoryDtoById(id);
    	model.addObject("dto",dto);
    	model.setViewName(FPATH+"factorycheckinfo");
    	return model;
    }
}
