package com.haoyu.dao;

import com.haoyu.model.MesStep;

public interface MesStepMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MesStep record);

    int insertSelective(MesStep record);

    MesStep selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MesStep record);

    int updateByPrimaryKey(MesStep record);
}