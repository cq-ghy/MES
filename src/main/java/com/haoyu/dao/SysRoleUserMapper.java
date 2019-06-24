package com.haoyu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.haoyu.model.SysRoleUser;

public interface SysRoleUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysRoleUser record);

    int insertSelective(SysRoleUser record);

    SysRoleUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysRoleUser record);

    int updateByPrimaryKey(SysRoleUser record);

    List<Integer> getRoleIdListByUserId(@Param("userId") int userId);

    List<Integer> getUserIdListByRoleId(@Param("roleId") int roleId);

    void deleteByRoleId(@Param("roleId") int roleId);

    void batchInsert(@Param("roleUserList") List<SysRoleUser> roleUserList);

    List<Integer> getUserIdListByRoleIdList(@Param("roleIdList") List<Integer> roleIdList);
}