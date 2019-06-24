package com.haoyu.dao;

import com.haoyu.model.MesStorage;

public interface MesStorageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MesStorage record);

    int insertSelective(MesStorage record);

    MesStorage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MesStorage record);

    int updateByPrimaryKey(MesStorage record);
}