package com.haoyu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.haoyu.beans.PageQuery;
import com.haoyu.dto.ProductDto;
import com.haoyu.dto.SearchProductDto;

public interface MesProductCustomerMapper {

	int countBySearchDto(@Param("dto")SearchProductDto dto);

	List<ProductDto> getPageListBySearchDto(@Param("dto")SearchProductDto dto,@Param("page")PageQuery page);

	int countBySearchBindListDto(@Param("dto")SearchProductDto dto);

	List<ProductDto> getPageListBySearchBindListDto(@Param("dto")SearchProductDto dto,@Param("page")PageQuery page);

	int countBySearchChildBindListDto(@Param("dto")SearchProductDto dto);

	List<ProductDto> getPageListBySearchChildBindListDto(@Param("dto")SearchProductDto dto,@Param("page")PageQuery page);

	int countBySearchParentBindListDto(@Param("dto")SearchProductDto dto);

	List<ProductDto> getPageListBySearchParentBindListDto(@Param("dto")SearchProductDto dto, @Param("page")PageQuery page);
	
}