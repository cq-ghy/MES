//package com.haoyu.controller;
//
//import javax.annotation.Resource;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.haoyu.beans.PageQuery;
//import com.haoyu.common.JsonData;
//import com.haoyu.param.SearchLogParam;
//import com.haoyu.service.SysLogService;
//
//@Controller
//@RequestMapping("/sys/log")
//public class SysLogController {
//
//    @Resource
//    private SysLogService sysLogService;
//
//    @RequestMapping("/log.page")
//    public ModelAndView page() {
//        return new ModelAndView("log");
//    }
//
//    @RequestMapping("/recover.json")
//    @ResponseBody
//    public JsonData recover(@RequestParam("id") int id) {
//        sysLogService.recover(id);
//        return JsonData.success();
//    }
//
//    @RequestMapping("/page.json")
//    @ResponseBody
//    public JsonData searchPage(SearchLogParam param, PageQuery page) {
//        return JsonData.success(sysLogService.searchPageList(param, page));
//    }
//}
