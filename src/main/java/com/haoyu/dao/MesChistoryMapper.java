package com.haoyu.dao;

import com.haoyu.model.MesChistory;

public interface MesChistoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MesChistory record);

    int insertSelective(MesChistory record);

    MesChistory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MesChistory record);

    int updateByPrimaryKey(MesChistory record);
}