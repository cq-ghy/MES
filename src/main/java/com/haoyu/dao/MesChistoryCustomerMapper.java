package com.haoyu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.haoyu.model.MesChistory;

public interface MesChistoryCustomerMapper {

	List<MesChistory> selectFhistorysInfoById(@Param("id")int id);
   
}