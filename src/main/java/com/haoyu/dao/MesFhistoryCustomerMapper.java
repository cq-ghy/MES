package com.haoyu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.haoyu.model.MesFhistory;

public interface MesFhistoryCustomerMapper {

	List<MesFhistory> selectFhistorysInfoById(@Param("id")int id);

	MesFhistory selectFhistoryByFidAndStep(@Param("id")Integer id,@Param("stepName")String stepName);
	
}