package com.haoyu.dao;

import com.haoyu.model.MesStock;

public interface MesStockMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MesStock record);

    int insertSelective(MesStock record);

    MesStock selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MesStock record);

    int updateByPrimaryKey(MesStock record);
}