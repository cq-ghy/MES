package com.haoyu.dao;

import com.haoyu.model.MesFactory;

public interface MesFactoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MesFactory record);

    int insertSelective(MesFactory record);

    MesFactory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MesFactory record);

    int updateByPrimaryKey(MesFactory record);
}