package com.haoyu.dao;

import com.haoyu.model.MesFhistory;

public interface MesFhistoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MesFhistory record);

    int insertSelective(MesFhistory record);

    MesFhistory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MesFhistory record);

    int updateByPrimaryKey(MesFhistory record);
}