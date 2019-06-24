package com.haoyu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.haoyu.beans.PageQuery;
import com.haoyu.dto.SearchStockDto;
import com.haoyu.dto.StockDto;

public interface MesStockCustomerMapper {

	int countBySearchDto(@Param("dto")SearchStockDto dto);

	List<StockDto> getPageListBySearchDto(@Param("dto")SearchStockDto dto,@Param("page")PageQuery page);
	
}