package com.haoyu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.haoyu.beans.PageQuery;
import com.haoyu.model.MesStep;

public interface MesStepCustomerMapper {

	int countBySearch();

	List<MesStep> getPageListBySearch(@Param("page")PageQuery page);

	List<MesStep> stepsAll();

	Integer selectIdByStep(@Param("step")String step);
	
}