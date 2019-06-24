package com.haoyu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.haoyu.beans.PageQuery;
import com.haoyu.model.MesStorage;

public interface MesStorageCustomerMapper {

	List<MesStorage> getPageList(@Param("page")PageQuery page);

	int counts();

	Integer selectIdByName(@Param("stockName")String stockName);
	
}