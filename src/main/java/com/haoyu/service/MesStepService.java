package com.haoyu.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.haoyu.beans.PageQuery;
import com.haoyu.beans.PageResult;
import com.haoyu.dao.MesStepCustomerMapper;
import com.haoyu.dao.MesStepMapper;
import com.haoyu.exception.ParamException;
import com.haoyu.model.MesStep;
import com.haoyu.param.MesStepVo;
import com.haoyu.util.BeanValidator;

@Service
public class MesStepService {

	@Resource
	private MesStepMapper stepMapper;
	@Resource
	private MesStepCustomerMapper stepCustomerMapper;
	//工序列表
	public PageResult<MesStep> searchPageList(PageQuery page) {
		// 验证页码是否为空
		BeanValidator.check(page);

		int count = stepCustomerMapper.countBySearch();
		if (count > 0) {
			List<MesStep> stepList = stepCustomerMapper.getPageListBySearch(page);
			return PageResult.<MesStep>builder().total(count).data(stepList).build();
		}

		return PageResult.<MesStep>builder().build();
	}
	//工序增加
	public void insert(MesStepVo stepVo) {
		BeanValidator.check(stepVo);
		MesStep step=MesStep.builder().stepName(stepVo.getStepName()).stepRemark(stepVo.getStepRemark()).build();
		stepMapper.insertSelective(step);
	}
	//工序更改
	public void update(MesStepVo stepVo) {
		BeanValidator.check(stepVo);
		if(StringUtils.isNotBlank(stepVo.getId())) {
			MesStep step=MesStep.builder().id(Integer.parseInt(stepVo.getId())).stepName(stepVo.getStepName())//
					.stepRemark(stepVo.getStepRemark()).build();
			stepMapper.updateByPrimaryKeySelective(step);
		}else {
			throw new ParamException("修改时，工序id为空");
		}
	}
	//查询所有steps
	public List<MesStep> stepsAll() {
		return stepCustomerMapper.stepsAll();
	}

}
