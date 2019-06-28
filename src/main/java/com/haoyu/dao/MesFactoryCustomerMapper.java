package com.haoyu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.haoyu.beans.PageQuery;
import com.haoyu.dto.FactoryDto;
import com.haoyu.dto.SearchFactoryDto;
import com.haoyu.model.MesOrder;

public interface MesFactoryCustomerMapper {

	int countBySearchDto(@Param("dto")SearchFactoryDto dto);

	List<FactoryDto> getPageListBySearchDto(@Param("dto")SearchFactoryDto dto,@Param("page") PageQuery page);

	FactoryDto selectFactoryDtoById(@Param("id")Integer id);
	//历史查询
	int countBySearchHistoryDto(@Param("dto")SearchFactoryDto dto);

	List<FactoryDto> getPageListBySearchHistoryDto(@Param("dto")SearchFactoryDto dto,@Param("page")PageQuery page);
    
}