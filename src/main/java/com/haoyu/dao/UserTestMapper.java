package com.haoyu.dao;

import com.haoyu.model.UserTest;

public interface UserTestMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(UserTest record);

	int insertSelective(UserTest record);

	UserTest selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(UserTest record);

	int updateByPrimaryKey(UserTest record);
}